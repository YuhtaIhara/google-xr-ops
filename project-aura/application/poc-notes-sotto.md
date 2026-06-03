# Sotto DP4 PoC notes (TODO: 作業日 YYYY-MM-DD)

> Sotto 版 engineer mock HUD PoC の作業記録テンプレ。 `TODO` を実値で埋める。
> 旧 `poc-notes.md` (Spice Sutra cooking 版、 macOS、 2026-05-23) は historical 保持。 本 doc が Sotto 版 current。

## 目的

Project Aura Developer Catalyst Program 応募の Developer Readiness 補強。 Jetpack XR SDK DP4 で Compose Glimmer の **engineer 特化 mock HUD** を 1 画面動かした証跡。 form Page 3 Development progress score 2 の根拠を Sotto 版で成立させる (cooking screenshot との食い違い解消)。

## 環境

- **Android Studio**: TODO (例: Otter / Panda 系の version、 `Help > About` で確認)
- **Jetpack XR SDK**: DP4 (公式 sample base、 clone commit: TODO)
- **Gradle**: TODO (sample 同梱 wrapper の version)
- **JDK**: TODO (Studio 同梱 jbr-17 等)
- **Emulator device**: TODO (例: Android XR Medium / XR Headset、 Google Play XR System Image、 API XX、 解像度)
- **OS**: Windows 11 (Mac → Windows 移行後初の PoC、 2026-05-31 移行)
- **作業日**: TODO
- **所要時間**: TODO (Studio install から screenshot まで)

## やったこと

1. 公式 DP4 blog から sample repo を clone (`sotto-poc/xr-sample`、 xr-ops 本 repo には commit しない)
2. **SottoMockHud composable** を新規 file `SottoMockHud.kt` に追加 (hardcoded、 real logic なし)
3. `MainActivity` の root composable を sample 既存から `SottoMockHud()` に置換 (最小変更)
4. (必要なら) `settings.gradle.kts` / `build.gradle.kts` の調整: TODO
5. Android Studio で Gradle Sync (所要 TODO)
6. XR AVD 作成 + Google Play XR system image download
7. emulator 起動 → XR 環境内 Compose panel に Sotto engineer 3 zone を確認
8. screenshot を `poc-screenshots/sotto-*.png` に保存

## 3 zone layout の構成 (engineer 特化、 設計 spec § 3 / § 5 準拠)

demo シナリオ: 数ヶ月前の自分の commit が code review に上がり「なぜ audit module に event-sourcing を選んだ?」と聞かれた瞬間の HUD。

- **上** (`SummaryList`): 過去 context summary list 3 行、 各行に出典 file path
  - 「Event-sourcing chosen for immutable audit trail — audit/DESIGN.md:42」
  - 「Trade-off: write-amplification accepted vs full history — PR #128 review」
  - 「Rejected CRUD — no point-in-time reconstruction — decisions/2025-11-08.md」
- **中** (`CodeSnippet`): inline code snippet (monospace 〜6 行) — `audit/EventStore.kt` の append-only 実装
- **下** (`ArchitectureThumbnail`): architecture diagram thumbnail — `Command -> EventStore -> Projection -> ReadModel`

## やってないこと (採択後の本実装で取り組む)

- ASR Bridge (STT API、 ephemeral PCM rolling buffer)
- Gemini Bridge (intent 分類 architecture-decision / debugging / code-review + retrieval rerank + summarizeForHud)
- 個人 corpus への hybrid RAG (cosine 0.7 + BM25 + LLM rerank、 design doc / PR / decision log / code 横断)
- HudPresenter の real data binding + dismiss UX (gesture / voice / dwell timeout)
- AudioCue (極小音量 nudge)
- masking layer / OAuth / cost meter / 永続化
- 実機 (Aura HW kit) での latency / battery / 視認性検証

## 査定者へのメッセージ (添付前提)

- **DP4 環境を Windows でゼロから構築して触っている**: Studio install / XR system image / XR AVD / sample build の障壁を越えている = solo indie でも実装着手可能
- **Compose Glimmer の engineer 3 zone layout を実装できる**: 設計 spec § 5 `HudPresenter` の 3 zone (summary list / inline code / architecture diagram) をそのまま体現
- **G2 (audio HUD) では不可能な visual context を XR panel で実現**: code snippet / decision list / diagram は Even G2 の monochrome narrow audio HUD では出せない — Aura の Display & Audio glasses だからこその差別化
- 採択後 9 ヶ月で ASR + Gemini intent + hybrid RAG + real HudPresenter を実装、 2027-04-30 Play 公開目標

## 関連 docs

- 設計 spec: `../../docs/superpowers/specs/2026-05-23-sotto-design.md` (§ 3 HUD render, § 5 HudPresenter)
- 応募 plan: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md` (T6)
- setup guide: `./poc-setup-guide-sotto.md` (本 PoC の Windows 手順書)
- form final draft: `./form-final-draft-sotto.md` (Development progress 140 行 / 添付表 194 行)
- Even 流用 component: `../../docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`
