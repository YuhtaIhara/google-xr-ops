# Changelog

All notable changes to `ai-driven-template` are documented in this file.

形式は [Keep a Changelog](https://keepachangelog.com/) に基づき、 [Semantic Versioning](https://semver.org/) に従う。

## [Unreleased]

### Added

- `.claude/rules/README.md`: skills / agents の precedence が公式 docs で逆方向 (skills は user 優先、 agents は project 優先) であることを明示する section を追加。 案件で同名衝突を起こさないための注記。
- `.claude/settings.json`: `_notes` array を追加。 他の JSON file (`.mcp.json`, `settings.local.example.json`) と同じ convention で意図 (team 共有設定の正本、 env 用途、 user-level との重複は defense in depth、 公式 docs link) を明記。

### Changed

- `CLAUDE.md` (root): `## 詳細規範 (import)` を分割。 critical guard (global / branching / security-secrets、 合計 22 行) は引き続き `@import` で eager load、 設計 doc である `permissions.md` (67 行) は lazy reference に変更。 session 開始時の context 消費を約 67 行削減。
