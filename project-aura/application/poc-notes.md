# Spice Sutra DP4 PoC notes (2026-05-23)

## 目的

Project Aura Developer Catalyst Program 応募の Developer Readiness 補強。 Jetpack XR SDK Developer Preview 4 (DP4) で Compose Glimmer の mock HUD を 1 画面動かした証跡。 form Page 3 の Development progress score を 1 → 2 に bump する根拠。

## 環境

- **Android Studio**: Panda Canary 4 patch 1 (`android-studio-panda4-patch1-mac_arm.dmg`)
- **Jetpack XR SDK**: DP4 (公式 sample `https://github.com/android/xr-samples` を base、 last commit 2026-05-15)
- **Gradle**: 9.5.0 (sample 同梱の wrapper)
- **JDK**: 17 (foojay-resolver-convention 1.0.0 plugin で Gradle が自動 resolve、 Java toolchain 機能)
- **Emulator device**: XR Headset (Google Play XR ARM 64 v8a System Image, Developer Preview, API 34 UpsideDownCake, 2560×2558, 320 dpi)
- **macOS**: Darwin 25.5 (M-series Mac)
- **作業日**: 2026-05-23 (Sat)
- **所要時間**: 約 1.5 時間 (Studio install + Sync + emulator 起動 + screenshot まで)

## やったこと

1. 公式 DP4 blog から sample repo `https://github.com/android/xr-samples` (= "Hello Android XR") を clone (scratch dir `~/work/google/spice-sutra-poc/` に配置、 google-xr-ops 本 repo には commit しない方針)
2. **SpiceSutraMockHud composable** を新規 file `app/src/main/java/com/example/helloandroidxr/spicesutra/SpiceSutraMockHud.kt` に追加 (hardcoded、 real logic なし)
3. `MainActivity.kt` の root composable を sample 既存の `HelloAndroidXRApp()` から `SpiceSutraMockHud()` に置換 (1 行 + 1 import の最小変更)
4. `settings.gradle.kts` に `foojay-resolver-convention` plugin 追加 (Gradle 9.5 が JDK 17 を自動 download するため、 JDK 未インストール環境用)
5. Android Studio で Gradle Sync (11 分 36 秒、 JDK 17 + 全 dependencies 取り込み、 緑 ✅)
6. XR Headset AVD 作成 + Google Play XR system image 1.5 GB 自動 download
7. emulator 起動 → XR 環境 (火星のような岩肌の immersive scene) 内に Compose panel が浮遊、 panel 内に Spice Sutra mock HUD 3 zone を確認
8. emulator 内 screenshot 1 枚を `poc-screenshots/hud-overview.png` に保存

## 3 zone layout の構成 (実機 emulator で動作確認済)

- **上部** (`TimelineOverview`): 5 lane parallel timeline overview — curry / dal / sabzi / roti / rice (青色 surface 帯、 並列調理の典型構成)
- **中央** (`NextStepCard`): Current step card — 「Next: 玉葱を炒める / 鍋 1 (curry) — 玉葱を飴色まで 約 5 分 / Remaining: 4:32」
- **下部** (`WarningToast`): Warning toast — 「⚠ 鍋 1: 火を弱めて」 (赤 error container、 production では振動 + audio cue 想定)

## やってないこと (採択後の本実装で取り組む)

- Gemini multimodal API integration (`parseRecipe` / `planTimeline` / `checkStep` の 3 prompt template)
- camera frame 取得 (`SceneCore` 経由) + 周期 chk (`VisionWatcher`)
- recipe DAG 構築 (`TimelinePlanner`)
- 状態管理 (`RecipeReader` の出力 → `ExecutionTimeline` → realtime update)
- Audio cue (TTS + 短文 push)
- 永続化 / OAuth 認証 / cost meter
- 実機 (Aura HW kit) での passthrough frame 取得 latency / battery / 視認性検証

## 査定者へのメッセージ (添付前提)

- **DP4 環境を実際に触っている**: setup 障壁 (Canary install / Gradle 9.5 + JDK 17 toolchain 解決 / XR system image / XR Headset AVD) を 1 day で越えている = solo indie でも実装着手可能
- **Compose Glimmer の 3 zone layout はもう作れる**: 設計 spec § 4 / § 5 (添付 design doc 参照) の `HudPresenter` 責務をそのまま体現
- **XR 環境内 panel UX を確認できた**: production の Display & Audio glasses でも同じパターンが使える、 form factor 整合性の証拠
- 採択後の 9 ヶ月で Gemini integration + VisionWatcher + Timeline DAG を実装、 2027-04-30 Play 公開目標

## 関連 docs

- 設計 spec: `../../docs/superpowers/specs/2026-05-21-spice-sutra-design.md` (§ 4 Architecture, § 5 Components HudPresenter)
- 応募 plan: `../../docs/superpowers/plans/2026-05-21-spice-sutra-catalyst-application.md` (Task 6)
- setup guide: `./poc-setup-guide.md` (本 PoC の手順書)
- form final draft: `./form-final-draft.md` (Development progress 1 → 2 update 候補)
