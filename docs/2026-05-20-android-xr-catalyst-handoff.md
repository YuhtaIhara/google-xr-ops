# Android XR Developer Catalyst Program — 応募ハンドオフ

調査日: 2026-05-20 (Google I/O 2026 二日目)
前セッション cwd: `~/work/google` (本来 `xr-ops/` でやるべきだったため移行)
本セッション関連物: メモリ書き込みなし / プロジェクトファイル生成なし。本 doc が唯一の成果物。

---

## 1. 応募の根幹情報

| 項目 | 値 |
|---|---|
| プログラム名 | Android XR Developer Catalyst Program |
| 公式ランディング | https://developer.android.com/develop/xr/catalyst |
| 短縮 URL | g.co/dev/catalyst |
| 応募フォーム | https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform (Google ログイン必須) |
| **応募締切** | **2026-06-30 23:59 PDT** (= JST 2026-07-01 15:59) |
| 結果通知 | 2026-07-15 までにメール |
| 配送可能地域 | 米国 / **日本** / 英国 / EU |
| IP 帰属 | 開発者が完全保持 |

## 2. 提供されるもの

- **ハードウェア開発キット早期アクセス** (XREAL Project Aura、audio glasses、display glasses のプロトタイプ)
  - 譲渡か貸与かは公式ページ未明記。NDA 込みの貸与が蓋然性高い。
- **専門技術サポート / サポートフォーラム**
- **non-recoupable grant** (返済不要助成金、オプトイン)
  - マイルストーン到達ごとに段階配分: 契約締結 → 技術設計 → Google Play 公開
  - 金額固定なし、応募者が使途と根拠を提示して査定される

## 3. 応募フォームで問われる項目 (推定)

公式に明記されている評価軸:

1. **Vertical Alignment** (優先カテゴリは下記)
   - Media & Entertainment
   - Gaming
   - Productivity & Learning
   - Discovery & Navigation
   - Messaging & Social
   - Health & Wellness
   - Commerce & Payments
   - リスト外でも可
2. **Developer Readiness** (チームの技術力 / 実装可能性)
3. **Clear Articulation of Funding Requirements** (grant 申請時)
4. **Form Factor 選択** (Project Aura / audio glasses / display glasses、複数選択可能と推定)
5. **使用予定スタック** (Kotlin + Jetpack XR SDK / Unity / Unreal / Godot)
6. **タイムライン** (6〜12 ヶ月以内に Google Play 公開予定であること)

## 4. 個人 (indie) 応募の可否

**可能**。公式に "established studio to independent developer" と明記。日本住所も配送対象内。

## 5. 想定するアプリのフォームファクター

希望は **audio + display 両方**。1 フォームで複数選択する想定 (別々に応募する必要なし)。

## 6. EVEN G2 (Even Realities) vs Google glasses 比較

| 項目 | EVEN G2 | Google Audio glasses | Google Display glasses |
|---|---|---|---|
| ディスプレイ | 両眼モノクロ microLED 20° | なし | 片眼 → 両眼 waveguide カラー (microLED, Raxium 由来) |
| カメラ | なし | あり | あり |
| マイク / スピーカー | なし | あり | あり |
| 重量 | 36g (チタン + マグネシウム) | 未公表 | 未公表 |
| バッテリー | 約 2 日 | 未公表 | 未公表 |
| AI | Even AI | Gemini | Gemini |
| プラットフォーム | 独自クローズド | Android XR (open) | Android XR (open) |
| 主機能 | Conversate / Translate / Teleprompt / Transcribe / ナビ | 翻訳 / 通知要約 / Gemini 会話 | + ナビ表示 / メッセ表示 / アプリ投影 / 画像表示 |
| スマホ連携 | Android / iOS | Android + iPhone | Android + iPhone |

**結論**: G2 とコンセプト直接競合は **Display glasses**。Audio glasses は Ray-Ban Meta 系で別カテゴリ。G2 を日常使いしている経験は応募文の「ユースケース解像度」根拠として強い。

## 7. 発売情報 (参考)

- **Google + Samsung Intelligent Eyewear**: 2026 年秋 (Fall 2026) 米国先行。Audio 先行 → Display 後発。価格未公表 (アナリスト推測 $600-$900)。フレームは Warby Parker / Gentle Monster デザイン。
- **XREAL Project Aura**: 2026 年末までに全世界発売。OLED、70°FOV、有線、glass passthrough、DisplayPort 対応。

## 8. Android XR SDK 開発スタック

- **First-party 推奨**: Kotlin + **Jetpack XR SDK** (Developer Preview 4 公開済み)
- **ゲームエンジン**: Unity / Unreal Engine / Godot
- まもなく Beta 昇格: XR Runtime / Jetpack SceneCore / ARCore for Jetpack XR
- 新機能: `Jetpack Projected` (Device Availability API)、`Jetpack Compose Glimmer` (Google Sans Flex)、`SpatialGltfModel` (glTF ネイティブ)、geospatial anchoring (87 カ国)
- 用語変更: "AI glasses" → **"audio glasses"**、"display AI glasses" → **"display glasses"**

## 9. 未決定事項 (応募前に確定すべきチェックリスト)

- [ ] **アプリのアイデア** (やりたいこと、解決する課題、想定ユーザー)
- [ ] **Vertical の絞り込み** (1 つに集中したほうが審査通りやすい)
- [ ] **開発スタック** (Kotlin/Jetpack XR vs Unity vs Unreal)
- [ ] **タイムライン** (6〜12 ヶ月以内の Play Store 公開目標日)
- [ ] **法人 or 個人** (税務・契約都合)
- [ ] **grant 申請の有無** (hardware only / hardware + grant / 未定)
- [ ] **grant 金額と使途根拠** (申請する場合)
- [ ] **既存 portfolio / GitHub URL**
- [ ] **配送先住所** (日本住所 OK)
- [ ] (任意) プロトタイプ準備 — Android XR SDK DP4 で簡易動作確認できると Developer Readiness の証拠になる

## 10. 個人応募を通すための実務 Tips

1. プロトタイプを先に作る (emulator でも可)、GitHub に置いて応募で URL を出す
2. Vertical を 1 つに絞る (「ヘルスケア × HUD ナビ」のように具体化)
3. G2 ユーザーであることを明示 — HUD グラス日常使いの経験はユースケース仮説の根拠
4. grant 額は控えめでも可。「機材だけ」も成立する
5. 6/30 23:59 PDT 厳守。結果は 7/15 までにメール

## 11. ソース URL (一次情報優先)

- https://developer.android.com/develop/xr/catalyst
- https://android-developers.googleblog.com/2026/05/apply-android-xr-developer-catalyst.html
- https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html
- https://blog.google/products-and-platforms/platforms/android/android-xr-io-2026/
- https://9to5google.com/2026/05/19/google-samsung-android-xr-glasses-styles-release-date/
- https://9to5google.com/2026/05/19/xreal-project-aura-android-xr-developers-2026-launch/
- https://9to5google.com/2025/12/08/android-xr-glasses-displays-2026/
- https://www.androidauthority.com/samsung-google-android-xr-glasses-warby-parker-gentle-monster-google-io-2026-3668380/
- https://www.techradar.com/tech/warby-parker-and-gentle-monster-finally-showed-us-their-samsung-xr-glasses-but-forgot-to-tell-us-when-theyll-release-or-how-much-theyll-cost
- https://www.roadtovr.com/google-android-xr-developer-program-free-ar-glasses/
- https://www.evenrealities.com/smart-glasses
- https://www.geeky-gadgets.com/even-realities-g2-review/
- https://www.ces.tech/ces-innovation-awards/2026/even-realities-g2-display-smart-glasses-and-r1-companion-ring/

## 12. 次セッション再開手順

```sh
cd ~/work/google/xr-ops
claude
```

起動後、本 doc を読ませて「Android XR Catalyst 応募の続きをやる」と伝えれば文脈復帰可能。応募作業の最初のブロッカーは **9. 未決定事項** のアプリアイデア確定。
