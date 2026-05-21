# Project Claude ガイド

本リポジトリの案件 context 入力ハブ。 詳細規範は `.claude/rules/` に分離、 不変ガードは `@.claude/rules/global.md` を canonical とする。

## プロジェクト概要

- プロダクト名: `google-xr-ops`
- 目的: Google Android XR エコシステムの ops repo。 2 方向の運用を 1 repo で同居:
  - **(a) consumer 側**: 端末「Warby Parker Intelligent Eyewear」 (Google Android XR powered、 2026 秋発売予定) の購入 + end-user 活用 + use case tuning
  - **(b) developer 側**: 「Project Aura」 = Google Android XR Developer Catalyst Program (XREAL Aura HW kit + 助成金 + 技術 support 提供、 締切 2026-06-30) への応募 + 採択後の app 開発
- 関連 vendor wrapper:
  - `~/work/google/` (本 repo の親、 Google bucket)
  - `~/work/even/` (Even bucket、 別 vendor `even-memory-bridge` / `even-conversate-ops`)
- 主要関係者: YuhtaIhara (`iharayuhta@gmail.com`、 個人 indie、 会社案件ではない)

## Phase 状況

- **Phase 1 (bootstrap)**: 骨格立ち上げ + .claude/ 設定 + dir skeleton ← 本 commit
- **Phase 2 (中身充填、 別 session)**: 公式 source URL 収集 → sources.yml 確定 → 初回 sync snapshot 取得
- **Phase 3 (実 work、 端末着弾 / 採択後)**: Warby Parker use case ops + Aura SDK 開発

## 重要 deadline

- **Project Aura Catalyst Program 応募締切**: **2026-06-30** (太平洋夏時間、 JST 2026-07-01 中)
- 結果通知: 2026-07-15 まで
- 本 repo 立ち上げ日: 2026-05-20、 締切まで約 6 週間

## ディレクトリ構成

```
google-xr-ops/
├ knowledge/
│  └ google-xr-official/      # 公式 source sync 基盤 (Android XR / Project Aura / Warby Parker / XREAL)
├ project-aura/                # Developer Catalyst Program 参加 work
│  ├ application/              # pitch 資料 (締切 6-30)
│  └ apps/                     # (採択後) 開発成果物
├ devices/
│  └ warby-intelligent-eyewear/  # 購入予定端末の use case + 設定 + retrospect
├ docs/
│  └ google-xr-design.md       # 累積される設計判断
├ scripts/                     # (phase 2) sync / audit (even-conversate-ops から借用予定)
└ .claude/                     # rules / hooks / settings (ai-driven-template base)
```

## 実行コマンド

> Phase 1 段階では Lint / Test / Build なし (Markdown + 設計 doc 中心)。 Phase 2-3 で sync script / Aura SDK 関連コマンドを追加。

## Git / GitHub 識別情報

- GitHub Owner: `YuhtaIhara`
- 主運用 GitHub アカウント (username): `YuhtaIhara`
- 期待する `git config user.name`: `YuhtaIhara`
- 期待する `git config user.email`: `iharayuhta@gmail.com`

identity チェック実施タイミング (commit / push / pr create 前) は `@.claude/rules/global.md` 参照。

## 規約 / 慣習

- AI 痕跡を残さない (commit message / PR / Issue 本文に「AI 駆動」 「Claude が」 等の主体表現入れない)
- Project Aura への pitch 資料は **Google に submission する deliverable**、 機密扱いだが repo 内に保管。 ただし採用前提の draft、 漏洩しても致命でない範囲に留める
- Warby Parker 端末固有の identifier (シリアル番号 / アカウント情報) は commit しない、 use case retrospect は anonymized で

## よくある落とし穴

- **Warby Parker = OEM**、 **Google = OS / SDK layer**、 **XREAL = Aura HW kit ベンダー**、 と 3 者が並列、 「Project Aura は Google 単独」 と誤解しない
- Android XR と Project Aura は同じだが指す範囲が違う、 用語整理を Phase 2 で `docs/google-xr-design.md` に明文化予定
- Even (vendor `~/work/even/`) と全く異なる ecosystem、 設計を borrowing する時は哲学差を意識 (Even = 個人 sole-maker / Google = Big Tech ecosystem)

## 読む順序

本 file (案件 context) → `@.claude/CLAUDE.md` (nested 詳細 navi) → `README.md` (運用 cycle) → `docs/google-xr-design.md` (設計判断累積) → `project-aura/README.md` (Catalyst Program 概要) → `devices/warby-intelligent-eyewear/README.md` (端末 use case)

## 詳細規範

session 開始時に eager load する critical guard (小): @import 形式で常時 context 注入
- Global ガード (機密 / 承認 / identity): @.claude/rules/global.md
- Branching: @.claude/rules/branching.md
- Secrets 管理: @.claude/rules/security-secrets.md

詳細設計判断 (大): 該当 file 編集時 or 設計議論時に Read で参照
- Permissions (deny/ask/allow + 二重ガード): `.claude/rules/permissions.md` (lazy load 推奨)
- Google XR 設計判断 (累積): `docs/google-xr-design.md`

## 関連 navi

- 詳細ナビ (`.claude/` 全体): @.claude/CLAUDE.md
- Hooks 役割: @.claude/hooks/README.md
- 入口 (人間向け): @README.md
- 同 vendor (Google) bucket: `~/work/google/`
- 別 vendor (Even) bucket: `~/work/even/` (継続活用 + 哲学応援 stance)
