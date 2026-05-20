# 共通ガードレール

- 機密情報、トークン、本番データ、個人情報、顧客固有情報を要求・出力・コミットしない。
- 外部入力はすべて不正前提で扱い、利用前に検証する。
- 承認なしでセキュリティ強度を下げる変更をしない。
- 承認なしの `git commit` / `gh pr create` / `git merge` / `git push`、本番デプロイ、破壊的操作を実行しない。
- `git commit` / `git push` / `gh pr create` の前に、`git config user.name` / `git config user.email` / `gh auth status` を確認し、 CLAUDE.md「Git / GitHub 識別情報」の定義と不一致なら停止する。