# google-xr-ops

> Google Android XR エコシステムの ops repo。 **(a) Warby Parker Intelligent Eyewear** (consumer、 購入 + 活用) と **(b) Project Aura Developer Catalyst Program** (developer、 応募 + 開発) の 2 方向を 1 repo で運用。

## 経緯 (2026-05-19 二重発表)

- **2026-05-19** Google が「Android XR Developer Catalyst Program」 を発表 ([mogura VR 記事](https://www.moguravr.com/android-xr-developer-catalyst/))
  - XREAL Project Aura 有線 XR グラス HW kit + audio glasses + display glasses 提供
  - 助成金 + 技術リソース support
  - 対象: 北米 / 英国 / EU / **日本**、 今後 6-12 ヶ月以内に Android XR アプリリリース予定の開発者
  - **応募締切 2026-06-30**、 結果通知 2026-07-15
- **同日** Warby Parker が Google Android XR powered の Intelligent Eyewear を発表 ([warbyparker.com/intelligent-eyewear](https://www.warbyparker.com/intelligent-eyewear)、 2026 秋発売予定)

→ user は Google XR エコシステムに all-in 方針、 Warby Parker を個人購入 + Project Aura に開発参加申請 で並行運用、 本 repo はその ops 拠点。

## ディレクトリ構成

```
google-xr-ops/
├ knowledge/
│  └ google-xr-official/        # 公式 source sync 基盤 (Phase 2 で充填)
├ project-aura/                  # Developer Catalyst Program 参加 work
│  ├ application/                # pitch 資料 (締切 2026-06-30)
│  └ apps/                       # (採択後) 開発成果物
├ devices/
│  └ warby-intelligent-eyewear/  # 購入予定端末の use case + 設定 + retrospect
├ docs/
│  └ google-xr-design.md         # 累積される設計判断
├ scripts/                       # (Phase 2) sync / audit (even-conversate-ops から借用予定)
└ .claude/                       # rules / hooks / settings (ai-driven-template base)
```

## Phase 進行

| Phase | 状態 | 内容 |
|---|---|---|
| Phase 1 (bootstrap) | 🔵 in-progress | 骨格立ち上げ + .claude/ 設定 + dir skeleton + 初期 design.md |
| Phase 2 (中身充填) | ⏳ 未着手 | 公式 source URL 収集 → sources.yml → 初回 sync snapshot |
| Phase 3 (実 work) | ⏳ 未着手 | Warby Parker 着弾後 + Aura 採択後の use case ops / app 開発 |

## 関連 vendor

- **`~/work/even/`** = Even Realities (G2 + R1)。 哲学を応援 + 継続活用 stance。 `even-memory-bridge` (frozen) + `even-conversate-ops` (active) の 2 repo
- **`~/work/google/`** = 本 repo を含む Google XR bucket。 all-in stance

## 環境前提

- macOS (zsh)
- [Claude Code CLI](https://claude.com/product/claude-code)
- `gh` CLI (per-command token override で `YuhtaIhara` account 操作)
- (Phase 2 以降) `jq` / `curl` / `pandoc` / `poppler` 等は even-conversate-ops から流用

## 開発しないと判断したこと (anti-scope)

- **Even との統合 / 移行**: 別 vendor、 use case 排他 (両 glasses 同時着用不可)、 統合の ROI 低い
- **業界全 vendor の横断比較**: Meta Quest / Samsung Galaxy XR 等は対象外、 Google bucket に絞る (Samsung も Android XR エコシステム上だが、 user の購買対象は Warby Parker)
- **複数 preset / 切替 ops** (Even から移植しない): Even の v2 preset 設計は Conversate 特化、 Warby Parker / Aura はそもそも仕様未確定、 Phase 3 で実機検証後に判断
