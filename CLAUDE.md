# Project Claude ガイド

本リポジトリの案件 context 入力ハブ。 下記 placeholder を埋めれば実装が概ね意図通り流れる。 詳細規範は `.claude/rules/` に分離、 不変ガードは `@.claude/rules/global.md` を canonical とする。

## プロジェクト概要

> [案件で埋める]

- プロダクト名: TODO
- 目的: TODO
- 主要関係者: TODO

## 実行コマンド

> [案件で埋める。 環境変数のキー名は `.env.example` を正本とし、 ここには記載しない]

- ランタイム: TODO (例: Node 24, Python 3.13)
- パッケージマネージャ: TODO (例: npm, uv, poetry)
- ソース配置: `src/` または `apps/*`

```bash
# Lint
TODO

# Typecheck
TODO

# Test
TODO

# Build
TODO

# IaC 検証 (使う場合)
TODO
```

## Git / GitHub 識別情報

> [案件で埋める。 `git commit` / `git push` / `gh pr create` 前に identity 確認必須]

- GitHub Owner (ユーザーまたは組織): TODO
- 主運用 GitHub アカウント (username): TODO
- 期待する `git config user.name`: TODO
- 期待する `git config user.email`: TODO

identity チェックの実施タイミング (commit / push / pr create 前) は `@.claude/rules/global.md` 参照。

## 規約 / 慣習 (任意、 案件で埋める)

> [案件で埋める。 不要なら本 section 削除]

- コードスタイル / 命名規則: TODO
- レビュー観点: TODO
- テスト方針: TODO

## よくある落とし穴 (任意、 案件で埋める)

> [案件で埋める。 不要なら本 section 削除]

- TODO: 案件特有の落とし穴 / 試行錯誤メモ / Claude が誤りやすい箇所

## 読む順序

本 file (案件 context) → `@.claude/CLAUDE.md` (nested 詳細 navi) → `.claude/rules/` を `.claude/rules/README.md` 推奨順 → 作業対象ディレクトリの README

## 詳細規範

session 開始時に eager load する critical guard (小): @import 形式で常時 context 注入
- Global ガード (機密 / 承認 / identity): @.claude/rules/global.md
- Branching: @.claude/rules/branching.md
- Secrets 管理: @.claude/rules/security-secrets.md

詳細設計判断 (大): 該当 file 編集時 or 設計議論時に Read で参照
- Permissions (deny/ask/allow + 二重ガード): `.claude/rules/permissions.md` (67 行、 設計 doc なので lazy load 推奨)

## 関連 navi

- 詳細ナビ (`.claude/` 全体): @.claude/CLAUDE.md
- Hooks 役割: @.claude/hooks/README.md
- 入口 (人間向け): @README.md
