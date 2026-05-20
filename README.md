# ai-driven-template

**Delight Inc. 社内向け、 Claude Code 統合スターターテンプレート (薄いひな形)**。 スタック非依存。

- ✅ **secret 漏洩 / 破壊操作の machine-level 防止** — `.env*` access / `rm -rf` / `git push --force` 等を AI が試みても自動拒否
- ✅ **会社の最低限基準** — global / branching / permissions / security-secrets で全社共通ガード
- ✅ **placeholder を埋めるだけ** で 案件 1-2 時間で onboard

**最初にやること** → 下の「Claude Code セットアップ」 を順に。

## Claude Code セットアップ

> ⚠️ **重要**: ローカルで本テンプレフォルダを **コピーしてリネーム** する運用をしない。 GitHub 側で派生 repo を作らずに作業を始めると、 ローカル remote が `ai-driven-template` を指したままになり、 初回 push や PR 作成で詰まる。 下記 Step 2 を **必ず GitHub から** 始めること。 既にコピー運用で始めてしまった場合は [トラブルシュート](#トラブルシュート) を参照。

### Step 1. Claude Code を install

[Claude Code](https://claude.com/product/claude-code) を install。

### Step 2. 派生 repo を **GitHub から** 作成

```bash
# 推奨: gh CLI でテンプレ派生 repo を作成 + ローカル clone
gh repo create YuhtaIhara/<案件名> --template YuhtaIhara/ai-driven-template --private --clone
cd <案件名>

# または GitHub UI:
#   「Use this template」 → 「Create a new repository」 → owner と repo 名を指定 → ローカルに git clone <派生 repo>
```

これで:
- GitHub 上に派生 repo (`YuhtaIhara/<案件名>`) が作られる
- ローカルに clone されて `origin` が派生 repo を指す
- テンプレ起源の commit history が引き継がれる (GitHub 側で「generated from template」バッジが付く)

### Step 3. `/init` を実行 (公式 BP 推奨)

Claude Code 上で `/init` を打つと、 Claude が repo 構造を分析し、 CLAUDE.md placeholder の埋め方を提案。 案件 code を追加した後に再実行するとさらに有用。

### Step 4. CLAUDE.md / README.md を案件用に編集

- 案件 context (プロジェクト概要 / 実行コマンド / Git / GitHub 識別情報) を埋める
- 「プロダクト名」入力後、 Claude に「`ai-driven-template` を同名で `README.md` / `CHANGELOG.md` に置換」 と頼む
- **`.github/CODEOWNERS`** の `@YuhtaIhara` を案件 owner (org の team or 個人 account) に書き換え
- (任意) ローカル dir 名も案件名に rename したい場合は [`.claude/docs/rename-procedure.md`](.claude/docs/rename-procedure.md) を参照 (メモリディレクトリ引越しも同時に必要)

### Step 5. 案件特有の rules / skills / agents / workflows を追加

- 案件特有 AI 規範: `.claude/rules/<topic>.md` (例: `project-context.md`) を追加して `CLAUDE.md` から `@import`
- 案件特有 skills / agents は `.claude/skills/` / `.claude/agents/` に置く (本テンプレに同梱しない)

→ これで準備完了。 案件開発を開始できます。

## トラブルシュート

### Q. テンプレを「Use this template」せずに、 ローカルフォルダをコピーして使ってしまった

これは推奨運用ではない (remote が `ai-driven-template` を指したままになり、 push で詰まる)。 リカバリー手順:

```bash
# 1. GitHub に空の派生 repo を作成 (テンプレ機能は使わずシンプル運用)
gh repo create YuhtaIhara/<案件名> --private --description "<説明>"

# 2. ローカルの remote を派生 repo に向け直す
cd <ローカル複製フォルダ>
git remote set-url origin https://github.com/YuhtaIhara/<案件名>.git

# 3. テンプレ追従用 remote を別途追加
git remote add template https://github.com/YuhtaIhara/ai-driven-template.git
git remote -v  # 確認

# 4. 初回 push (テンプレ起源 commit がそのまま乗る)
git push -u origin main
```

これで通常運用に戻れる。 GitHub 上で「template generated from」バッジは付かないが、 commit history が共通祖先を持つので `template` remote 経由のテンプレ追従は機能する。

> ⚠️ `git push -u origin main` が `rejected (non-fast-forward)` になる場合: GitHub 側で repo 作成時に auto-init された commit がある。 個人 repo の初回限定で `git push --force-with-lease -u origin main` で上書き可能 (慎重に)。

### Q. ローカルフォルダ名も案件名に rename したい

[`.claude/docs/rename-procedure.md`](.claude/docs/rename-procedure.md) に手順あり。 Claude Code セッション中の rename は CWD 破壊リスクがあるので必ずセッション終了後に実施。

### Q. テンプレ側で hook が誤検知して作業が進まない

`.claude/hooks/pre-tool-use.sh` の最新版で改善済 (Bash command の対象文字列のみ判定、 Write/Edit の本文文字列は判定対象から除外)。 古い派生 repo は `template` remote 経由でテンプレ追従して取り込めば解消。

## 利用者向けガイド (派生案件 repo 向け)

### テンプレ更新の追従

本テンプレに修正が入った時、 派生案件 repo に取り込む方法:

- **自動 (推奨)**: 派生 repo の `.github/workflows/template-sync.yml` に [`actions-template-sync`](https://github.com/AndreasAugustin/actions-template-sync) 設置 → 月次で更新 PR が自動 open
- **手動**: 必要時に下記:
  ```bash
  git remote add template https://github.com/YuhtaIhara/ai-driven-template.git
  git fetch template main
  git merge template/main --allow-unrelated-histories  # or cherry-pick <SHA>
  ```

### フィードバック / 改善提案

GitHub Issues タブから。

## 正本配置

| 領域 | 正本 |
|------|------|
| 案件 context 入力ハブ | `CLAUDE.md` |
| AI 規範 (会社基準) | `.claude/rules/` |
| Lifecycle 自動化 (machine-level ガード) | `.claude/hooks/` (本体) + `.claude/settings.json` (登録) |
| 共有 permissions | `.claude/settings.json` |
| Secret scan (CI) | `.github/workflows/secret-scan.yml` |

## 個人ローカル設定 (gitignore)

- `CLAUDE.local.example.md` → `CLAUDE.local.md` (個人 URL / メモ、 commit しない)
- `.claude/settings.local.example.json` → `.claude/settings.local.json` (個人 `env` / `model` / `statusLine`。 `permissions` / `hooks` は書かない)

## 環境前提

- bash 実行環境 (Git Bash / WSL / macOS / Linux 標準)
- [Claude Code CLI](https://claude.com/product/claude-code)
- `gh` CLI (initial push 時に必要)
