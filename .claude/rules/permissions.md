# 権限設計

`.claude/settings.json` の `permissions` (deny / ask / allow) と `hooks` の設計指針を定義する。 実装本体は `.claude/settings.json`、 本ルールは設計判断の正本とする。

## 設定の優先順位（公式 BP）

衝突時の上書き順序（番号が小さいほど強い）:

1. Managed Settings（組織配布、 CI/CD 強制）
2. CLI 引数（`--settings`）
3. `.claude/settings.local.json`（個人ローカル、 gitignore 必須）
4. `.claude/settings.json`（チーム共有、 commit 済）
5. `~/.claude/settings.json`（個人 user-level）

## deny / ask / allow の判断基準

- **deny**: 取り返しのつかない破壊操作 / シークレット読み書き / settings 自己改変。
  - 例: 破壊的 git（`git reset --hard`, `git checkout -f`, `git branch -D`, `git clean`）
  - 例: 直接削除（`rm`, `Remove-Item`, `find -delete`）
  - 例: `.env*` 実値の Read / Edit
  - 例: 本番デプロイ短絡（`*production*`, `gh workflow run *production*`）
  - 例: `.claude/settings.json` 自己編集

- **ask**: 副作用ありで明示承認を要する操作。
  - 例: `git commit / push / merge / rebase / reset / restore / tag`
  - 例: `gh pr create / merge`, `gh workflow run`, `gh run rerun`
  - 例: `*deploy*` 系コマンド
  - 例: Docker 副作用（`docker compose up/down/build/run/exec`, `docker run/exec/rm`）
  - 例: `.claude/**` 編集

- **allow**: 副作用なしの観察・検証・lint/test/build。
  - 例: `git status / diff / log / show`
  - 例: Docker 観察（`ps / logs / config`, `images`）
  - 例: `npm run lint/test/typecheck/build`, `pytest`, `ruff check`, `black --check`, `mypy`
  - 例: `bandit`, `pip-audit`, `checkov`, `semgrep scan`
  - 例: `* --help`, `* --version`

## settings.local.json の取扱

- 個人ローカル補助としてのみ扱う。 チームの安全ガードを local に依存させない。
- **`permissions` / `hooks` を `settings.local.json` に書かない**（共有ガードを個人で上書きしてはいけない）。
- 置いてよい項目: 個人 `env` / 個人 `model` / 個人 `statusLine` のみ。
- `.gitignore` 対象（commit 厳禁）。

## settings.json に置く項目（推奨）

- `permissions`: 共有ガードレール（必須）
- `hooks`: ライフサイクル連携（推奨）
- `env`: 共有してよい非機密キーのみ。 秘密値は `.env*` 経由で別管理。

## .env* の二重ガード

- 実値 (`.env`, `.env.local`, `.env.production`, etc.) は `permissions.deny` で代表パターンを禁止する。
- permissions の glob は完全網羅できない (例: `apps/foo/.env.preview`)。 `.claude/hooks/pre-tool-use.sh` で網羅パターンをブロックし、 二重ガードを担保する。
- `Read(.env*)` の allow 追加は禁止 (ベースライン規範弱化)。

## hooks の役割境界

- `pre-tool-use.sh`: 破壊コマンド検知、 `main` / `master` 直 commit ブロック、 `.env*` 網羅ガード。 検知時は exit 2 で停止。
- hook scripts に機密情報 (API key, トークン) を埋め込まない。 重い処理・長時間ブロック処理を置かない。

## チーム再現性

- チーム基準は commit 済 `settings.json` + 本 rules + hooks で再現可能にする。
- `settings.local.json` を読まない環境（CI / 新メンバー初日 / fresh clone）でも安全レベルが落ちないこと。
