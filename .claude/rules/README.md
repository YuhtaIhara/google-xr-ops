# ルール一覧

`.claude/rules/` は AI 規範 (会社基準) の正本ディレクトリ。 **薄く、 事故防止に直結するもののみ**。

## 構成 (4 file)

- `global.md`: スタック非依存の必須/禁止 (機密 / 承認 / Git identity)
- `branching.md`: ブランチ・マージ規律 (main 直 commit 禁止)
- `permissions.md`: `.claude/settings.json` の deny/ask/allow 設計判断 + `.env*` 二重ガード
- `security-secrets.md`: シークレット管理ポリシー (vault / OIDC / `.env*` 取扱)

→ 案件特有の rule (stack 規約 / API 規約 / 認証 / ログ運用 / DoR 等) は **案件で追加** (本テンプレに同梱しない)。

## 読む順 (推奨)

1. `global.md` (最優先、 stack 非依存の不変ガード)
2. `branching.md` (Git 規律)
3. `permissions.md` (`.claude/settings.json` 設計理解)
4. `security-secrets.md` (秘密管理)

## 設計原則

- **Lazy load on demand**: rules は session 開始時に description のみロードし、 該当 file 編集時に full body をロードする。
- **設定 vs 規範の分離**: 実装本体 (`.claude/settings.json` 等) に設計判断を埋めず、 本 rules で管理する。
- **薄く、 会社基準のみ**: 案件特有規範は案件側 file に書く (本テンプレは事故防止に直結する最低限)。

## 案件で skills / agents を追加するときの precedence 注意 (公式)

skills と agents は同名衝突時の precedence が **公式 docs で逆方向** に定義されている。 案件で `.claude/skills/<name>/` や `.claude/agents/<name>.md` を追加する際は、 同名の user-level (`~/.claude/skills/<name>/` や `~/.claude/agents/<name>.md`) が存在すると挙動が異なる:

- **skills**: Enterprise > **Personal (user)** > Project → 同名なら user 側が勝つ ([skills.md](https://code.claude.com/docs/en/skills))
- **agents**: Managed > CLI > **Project** > User → 同名なら project 側が勝つ ([sub-agents.md](https://code.claude.com/docs/en/sub-agents))

team が project 側で skill を上書きしたい場合は **別名にする** か plugin の namespace 機能 (`plugin-name:skill-name`) を使う。
