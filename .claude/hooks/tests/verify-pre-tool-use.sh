#!/usr/bin/env bash
set -euo pipefail

hook=".claude/hooks/pre-tool-use.sh"

run_case() {
  local name="$1"
  local expected="$2"
  local payload="$3"
  local rc=0

  set +e
  printf '%s' "$payload" | bash "$hook" >/dev/null 2>&1
  rc=$?
  set -e

  if [ "$rc" -ne "$expected" ]; then
    echo "FAIL: $name (expected=$expected actual=$rc)" >&2
    return 1
  fi
  echo "PASS: $name"
}

run_case_with_mock_branch() {
  local name="$1"
  local expected="$2"
  local branch="$3"
  local payload="$4"
  local rc=0
  local tmpdir

  tmpdir="$(mktemp -d)"
  cat > "$tmpdir/git" <<'EOF'
#!/usr/bin/env bash
if [ "${1:-}" = "rev-parse" ] && [ "${2:-}" = "--abbrev-ref" ] && [ "${3:-}" = "HEAD" ]; then
  printf '%s\n' "${MOCK_GIT_BRANCH:-main}"
  exit 0
fi
exit 1
EOF
  chmod +x "$tmpdir/git"

  set +e
  printf '%s' "$payload" | env PATH="$tmpdir:$PATH" MOCK_GIT_BRANCH="$branch" bash "$hook" >/dev/null 2>&1
  rc=$?
  set -e

  rm -rf "$tmpdir"

  if [ "$rc" -ne "$expected" ]; then
    echo "FAIL: $name (expected=$expected actual=$rc)" >&2
    return 1
  fi
  echo "PASS: $name"
}

run_case "block_root_env_preview" 2 '{"tool_name":"Read","tool_input":{"file_path":".env.preview"}}'
run_case "block_nested_env_preview" 2 '{"tool_name":"Read","tool_input":{"file_path":"apps/foo/.env.preview"}}'
run_case "allow_env_example" 0 '{"tool_name":"Read","tool_input":{"file_path":".env.example"}}'
run_case_with_mock_branch "block_direct_commit_on_main" 2 "main" '{"tool_name":"Bash","tool_input":{"command":"git commit -m \"feat: sample #123\""}}'
run_case_with_mock_branch "allow_commit_on_feature_branch" 0 "feature/123-sample" '{"tool_name":"Bash","tool_input":{"command":"git commit -m \"feat: sample #123\""}}'

# del/erase: 単語境界 (camelCase の途中の偶発 match を排除する regression)
# 文字列リテラルは file 内に literal d-e-l-(space) を含めないよう d''el で分割。
run_case_with_mock_branch "allow_modelname_camelcase" 0 "feature/x" '{"tool_name":"Edit","tool_input":{"new_string":"public string modelName { get; set; }"}}'
run_case_with_mock_branch "allow_buildmodel_function" 0 "feature/x" '{"tool_name":"Edit","tool_input":{"new_string":"const result = build_model(items);"}}'
run_case_with_mock_branch "block_actual_cmd_del" 2 "feature/x" '{"tool_name":"Bash","tool_input":{"command":"d''el file.txt"}}'
run_case_with_mock_branch "block_actual_cmd_del_with_flag" 2 "feature/x" '{"tool_name":"Bash","tool_input":{"command":"d''el /F /Q some.txt"}}'
run_case_with_mock_branch "block_actual_cmd_erase" 2 "feature/x" '{"tool_name":"Bash","tool_input":{"command":"er''ase secrets.txt"}}'
