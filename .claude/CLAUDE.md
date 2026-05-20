# .claude/CLAUDE.md (nested)

`.claude/` 配下の navi。 ルート `CLAUDE.md` (案件 context 入力ハブ) の延長として、 project-level 設定 (rules / hooks / settings / 任意 skills / agents) のディレクトリ構成・正本配置・設計原則を記述する。

公式 BP の nested CLAUDE.md として、 ルート CLAUDE.md と内容重複しない (役割分担: ルート = 案件 context、 nested = `.claude/` navi)。

## ディレクトリ構成

| Path | 役割 | 詳細 navi |
|------|------|-----------|
| `settings.json` | 共有 permissions / hooks 登録 | `rules/permissions.md` |
| `settings.local.example.json` | 個人ローカル override 雛形 (env / model / statusLine、 commit しない) | `rules/permissions.md` |
| `rules/` | AI 規範 (会社基準) の正本 (会社 4 file) | `rules/README.md` |
| `hooks/` | ライフサイクル shell script (PreToolUse) | `hooks/README.md` |
| `skills/` | 再利用可能な手順 (案件で追加、 テンプレでは空) | `skills/README.md` |
| `agents/` | subagent 定義 (案件で追加、 テンプレでは空) | `agents/README.md` |
| `output-styles/` | 応答スタイル (案件で追加、 テンプレでは空) | `output-styles/README.md` |
| `plugins/` | plugin 配置 (案件で追加、 テンプレでは空) | `plugins/README.md` |

→ MCP server 配置雛形は `../.mcp.json` (repo root)。 案件特有 workflows は **案件で追加** (本テンプレに同梱しない)。

## 「どこに何の正本があるか」

- **AI 規範 (会社基準)**: `rules/`
- **lifecycle 自動化 (machine-level ガード)**: `hooks/` (本体) + `settings.json` (登録)
- **共有 permissions**: `settings.json`
- **個人 overrides**: `settings.local.json` (gitignore、 雛形のみテンプレに残す)
- **案件 context 入力ハブ**: `../CLAUDE.md` (リポジトリ root)
- **案件特有の skills / agents**: 案件で追加 (各 dir の README 参照)

## CLAUDE.md memory 階層 (公式 BP)

Claude Code は session 開始時に CLAUDE.md を walk up + concatenate する:

1. 親ディレクトリの `CLAUDE.md` (sub-project / monorepo の親)
2. プロジェクト root の `CLAUDE.md` (本テンプレ / 案件 context 入力ハブ)
3. `.claude/CLAUDE.md` (本ファイル / nested project 補足)
4. `CLAUDE.local.md` (個人ローカル、 gitignore)
5. `~/.claude/CLAUDE.md` (user-level memory、 全 project 共通の好み)

### 衝突時の挙動

具体的 (specific) スコープが優先 (parent → project → nested → local → user-level の順で specific になる)。 公式 BP は **「複数の CLAUDE.md で矛盾するルールを書かない」** を推奨。 矛盾を作らない設計が原則。

## settings 階層 (公式 BP)

衝突時の上書き順 (番号が小さいほど強い):

1. Managed Settings (組織配布、 IT 強制)
2. CLI 引数 (`--settings`)
3. `.claude/settings.local.json` (個人ローカル、 gitignore)
4. `.claude/settings.json` (チーム共有)
5. `~/.claude/settings.json` (個人 user-level)

詳細と deny / ask / allow の判断基準: `rules/permissions.md`

## アンチパターン

- **CLAUDE.md に長文 docs / 手順を直書き**: 詳細は `@.claude/rules/...` import で defer (公式 BP「200 lines target、 longer files reduce adherence」)。
- **複数 CLAUDE.md で矛盾するルール**: 矛盾を作らない設計を原則。
- **hook matcher を `*` のみで放置**: tool 名 (`Bash` / `Read` / `Edit` / `Write` 等) で絞った上で hook script 内で詳細判定。

## 設計原則

- **AI 規範は `.claude/` が正本**: 公式 BP に準拠して `rules/` / `hooks/` を canonical とする。
- **薄い CLAUDE.md + 薄い rules**: 案件で埋める部分は CLAUDE.md (200 行以下)、 会社基準は rules が必要最小限で持つ。
- **AI 痕跡を残さない**: commit message / PR 本文に「AI 駆動」「Claude が」 等の主体表現を入れない。

## 関連

- 案件 context 入力ハブ: `../CLAUDE.md`
- 入口 README (人間向け): `../README.md`
