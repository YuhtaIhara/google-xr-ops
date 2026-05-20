#!/usr/bin/env bash
set -euo pipefail

# 最小ガードレール hook (Claude Code PreToolUse):
# - Bash の command 文字列に対して破壊的パターン / 保護ブランチへの commit / .env* アクセスをブロック
# - Read / Edit / Write / NotebookEdit の対象 file_path に対して .env.example 以外の .env* をブロック
#
# 重要: Write/Edit の tool_input.content (書き込もうとする本文) は判定対象に **しない**。
# Plan ファイルや docs / Issue 本文に破壊コマンド名や ".env" などの文字列を書こうとする
# 正当な利用が誤検知されないように。
#
# 公式 hook 仕様: https://code.claude.com/docs/en/hooks

payload="$(cat || true)"

HOOK_PAYLOAD="$payload" python - <<'PY'
import json
import os
import re
import subprocess
import sys

payload = os.environ.get("HOOK_PAYLOAD", "")
try:
    data = json.loads(payload) if payload else {}
except Exception:
    data = {}

tool_name = data.get("tool_name", "") or ""
tool_input = data.get("tool_input", {}) or {}


def block(msg: str) -> None:
    sys.stderr.write(f"pre-tool-use hook ブロック: {msg}\n")
    sys.exit(2)


def check_env_path(path: str, source: str) -> None:
    """file_path / notebook_path に対して .env.example 以外の .env* をブロック。"""
    if not path:
        return
    basename = path.replace("\\", "/").rsplit("/", 1)[-1]
    if basename.startswith(".env") and basename != ".env.example":
        block(f".env* 非 example ファイル ({path}) へのアクセス試行 ({source})")


if tool_name == "Bash":
    command = (tool_input.get("command") or "").strip()
    lower = command.lower()

    destructive_patterns = [
        r"git reset --hard",
        r"git checkout -f",
        r"git worktree remove",
        r"rm -rf",
        r"find .* -delete",
        r"remove-item",
        r"(^|[^a-z])del[\s]",
        r"(^|[^a-z])erase[\s]",
    ]
    for pattern in destructive_patterns:
        if re.search(pattern, lower):
            block(f"破壊的パターン '{pattern}' に一致 (Bash command)")

    if "git commit" in lower:
        try:
            branch = subprocess.check_output(
                ["git", "rev-parse", "--abbrev-ref", "HEAD"],
                stderr=subprocess.DEVNULL,
                text=True,
            ).strip()
        except Exception:
            branch = ""
        if branch in ("main", "master"):
            block(
                f"'{branch}' への直接 commit は禁止。 feature / fix ブランチを使ってください。"
            )

    env_re = re.compile(r"""(?:^|[\\/:"'\s=])(\.env[^\s"'/\\:=]*)""")
    for match in env_re.finditer(command):
        candidate = match.group(1).rstrip(".:,;")
        if not candidate or candidate.lower() == ".env.example":
            continue
        block(f".env* 非 example ファイル ({candidate}) へのアクセス試行 (Bash command)")

elif tool_name in ("Read", "Edit", "Write", "NotebookEdit"):
    file_path = tool_input.get("file_path") or tool_input.get("notebook_path") or ""
    check_env_path(file_path, f"{tool_name} file_path")
PY