# シークレット管理

シークレット保管と認証情報ハンドリングの会社基準。

- シークレットは source code ではなく vault / secret manager / CI secrets に保管する。
- 長期固定シークレットより、 短命 / OIDC ベース資格情報を優先する。
- ローカル共有は template (`.env.example` 等) のみ。 実値 (`.env*` / `local.settings.json`) を git に乗せない (詳細は `@.claude/rules/global.md`)。
- クライアント公開可能キーを明示し、 それ以外は公開禁止とする。
- managed / workload / federated identity が使える場合、 API key 直認証を禁止する。
