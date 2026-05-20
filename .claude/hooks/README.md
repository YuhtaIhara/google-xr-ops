# フック

`.claude/hooks/` は Claude Code のライフサイクルイベントに紐づく shell script の正本ディレクトリ。 `.claude/settings.json` の `hooks` キーで登録され、 PreToolUse event で発火する。

## 採否判断

本テンプレでは hooks を **secret 漏洩 + 破壊操作の machine-level ガード** として **必須採用**。 削除しないこと (削除すると会社基準が崩れる)。

### Windows 案件で PowerShell hook (.ps1) を使う場合

bash 実行環境を用意できない Windows 案件は、 hook を `.ps1` で書き換える選択肢:
- `.claude/hooks/*.sh` を `.claude/hooks/*.ps1` に置き換え
- `.claude/settings.json` の hook command を `pwsh -File "$CLAUDE_PROJECT_DIR/.claude/hooks/pre-tool-use.ps1"` に変更
- `tests/verify-pre-tool-use.sh` も `.ps1` 化

本テンプレでは `.sh` 版が canonical (Git Bash / WSL 前提)。

## 既定構成 (本テンプレ)

- `pre-tool-use.sh`: machine-level block (`.env*` access / 破壊コマンド / `main` 直 commit)

→ 案件で追加 hook (PostToolUse / SessionStart / UserPromptSubmit 等) を採用する場合は本 README にも追記。

## 運用ルール

- 機密情報 (API key / トークン) をスクリプトに埋め込まない。 env variable expansion で外部から渡す。
- 重い処理・長時間ブロック処理を置かない (hooks は軽量に保つ)。
- `pre-tool-use.sh` は破壊的コマンドと `main` / `master` 直 commit と `.env*` access のブロックを担当する。

## Hook 一覧と失敗時方針

| Hook | 発火タイミング | 失敗時方針 |
|---|---|---|
| `pre-tool-use.sh` | tool 実行前 | 危険パターン検知時はブロック (exit 2) |

## 公式の他 lifecycle event (案件で追加採用候補)

公式 docs (https://code.claude.com/docs/en/hooks) で定義された他 event の主要なもの:

- `PostToolUse`: tool 実行後 (監査ログ / nudge 用)
- `SessionStart` / `SessionEnd`: session 開始 / 終了
- `Stop` / `StopFailure`: ターン終了 / API エラー
- `UserPromptSubmit`: prompt 検証 / sanitize
- `PreCompact` / `PostCompact`: context 圧縮前後
- `SubagentStart` / `SubagentStop`: subagent 生成 / 終了
- `WorktreeCreate` / `WorktreeRemove`: worktree 操作

詳細は公式 docs 参照。

## pre-tool-use テスト例 (JSON payload)

- **block される例**:
  - `{"tool_name":"Read","tool_input":{"file_path":".env.preview"}}`
  - `{"tool_name":"Read","tool_input":{"file_path":"apps/foo/.env.preview"}}`
  - `{"tool_name":"Bash","tool_input":{"command":"git commit -m \"feat: sample #123\""}}` (branch=main の場合)
- **許可される例**:
  - `{"tool_name":"Read","tool_input":{"file_path":".env.example"}}`
  - `{"tool_name":"Bash","tool_input":{"command":"git commit -m \"feat: sample #123\""}}` (branch=feature/* の場合)

CI では `.claude/hooks/tests/verify-pre-tool-use.sh` を実行し、 上記ケースの回帰を検査する。

## 設計原則 (公式 BP)

- **Matcher を具体化**: PreToolUse hook の matcher は `Bash` だけでなく `Bash(rm -rf *)` のように tool 名 + 引数 pattern で絞る。 matcher を `*` のみで放置すると全 tool で hook 発火 → session 遅延 + log 肥大。 適切な matcher は `Bash|Edit|Write|NotebookEdit` 等で書き込み系に絞る。
- **deterministic behavior が必要なら hooks を使う**: CLAUDE.md / rules は規範として読まれるが enforced ではない。 機械的にブロックしたいなら hook で実装する。
- **hooks と permissions の分離**: permissions.deny は宣言的、 hooks は手続き的。 二重ガード (permissions の代表パターン + hooks の網羅パターン) で `.env*` 等を保護。

## 関連 rules

- Permissions 設計: `.claude/rules/permissions.md`
- Branching 規律: `.claude/rules/branching.md`
