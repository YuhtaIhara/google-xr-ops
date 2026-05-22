# Spice Sutra DP4 PoC セットアップガイド

> Android XR Emulator で Compose Glimmer mock HUD を 1 day で動かし、 screenshot を撮る手順書。 自己完結 (他 doc 参照不要)。

---

## 0. Goal と deliverables

**何をするか**: Jetpack XR SDK DP4 の公式 sample を base に `SpiceSutraMockHud` composable (hardcode・real logic 無し) を 1 画面追加し、 Android XR Emulator で動作確認して screenshot を撮る。

**なぜ必要か**:
- 応募 form Page 3「Development progress (0-10 scale)」を **1 → 2** に push する直接の根拠
- 「DP4 を実際に触っている」「Compose Glimmer の 3 zone layout を実装できる」を 1 日で証明
- Supporting files (max 5 個) の枠に spec PDF と並ぶ重要添付として使用

**成果物**:
- `project-aura/application/poc-screenshots/hud-overview.png` (必須)
- `project-aura/application/poc-screenshots/hud-timeline-closeup.png` (必須)
- `project-aura/application/poc-screenshots/hud-next-step-closeup.png` (必須)
- `project-aura/application/poc-screenshots/hud-warning-closeup.png` (推奨)
- `project-aura/application/poc-screenshots/hud-demo.mp4` (任意、30-60 秒)
- `project-aura/application/poc-notes.md`

---

## 1. Prerequisites

| 項目 | 要件 |
|---|---|
| OS | macOS (Darwin 25、 zsh) |
| RAM | 16 GB+ 推奨 (Android XR Emulator は重い) |
| 空き容量 | 約 20 GB (Android Studio + SDK + Emulator system image) |
| 所要時間 | 4-8 時間 (Kotlin/Android 未経験。 経験者なら 30-90 分) |
| 事前知識 | 不要。 本 guide の通りコピペで進められる |

---

## 2. Step A: Android Studio のインストール

### A-1. ダウンロード・インストール

1. ブラウザで https://developer.android.com/studio を開く
2. **「Download Android Studio」** ボタンをクリック
3. macOS 版 (`.dmg`) をダウンロード
4. `.dmg` を開き、 `Android Studio.app` を `/Applications` にドラッグ
5. Android Studio を起動 (初回は「インターネットからダウンロードしたアプリ」の警告が出る → 開く)

> **バージョン要件**: Android XR Emulator のサポートは **Jellyfish (2023.3.1)** 以降。 2026 年 5 月時点の最新 stable を使えば問題ない。 バージョンは起動後 `Android Studio > About Android Studio` で確認できる。

### A-2. 初回セットアップウィザード

Android Studio が起動すると Setup Wizard が立ち上がる:

1. **「Next」** → **「Standard」** (Custom は不要) → **「Next」**
2. SDK の保存先は default (`~/Library/Android/sdk`) のままでよい
3. **「Finish」** を押すと SDK コンポーネントのダウンロードが始まる (5-15 分)

### A-3. Android XR の system image を追加インストール

Setup Wizard 完了後:

1. Android Studio を起動し、 スタート画面から **「More Actions」 → 「SDK Manager」** を開く
   (プロジェクト開いている場合は **「Tools」 → 「SDK Manager」**)
2. **「SDK Platforms」** タブ:
   - 「Show Package Details」 チェックボックスをオン
   - **Android 16 (Baklava)** または **Android 15 (VanillaIceCream)** を展開
   - **「Android XR ARM 64 v8a System Image」** にチェックを入れる
   - ない場合は「Android XR Google APIs ARM 64 v8a System Image」を探す
3. **「SDK Tools」** タブ:
   - **「Android Emulator」** にチェック (通常 default でチェック済)
   - **「Android Emulator - Extended Controls」** があればチェック
4. **「Apply」 → 「OK」** → ダウンロード完了まで待つ (5-10 分)

> **SDK Manager が見つからない場合**: スタート画面右下の歯車アイコン → 「SDK Manager」。

---

## 3. Step B: Jetpack XR SDK DP4 公式 sample の取得

### B-1. 公式 blog から sample URL を取得する

DP4 の公式 sample は以下の blog post に掲載されている:

```
https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html
```

1. ブラウザで上記 URL を開く
2. ページ内で「**sample**」「**GitHub**」「**github.com/android/xr**」等のキーワードを検索 (`Cmd+F`)
3. sample repo への GitHub URL を見つける

> **想定 URL パターン**: 公式は通常 `https://github.com/android/xr-samples` または `https://github.com/google/jetpack-xr-samples` のような命名。 DP4 blog post 内のリンクが正式 URL になる。

### B-2. scratch ディレクトリに clone する

**注意**: Kotlin code は `google-xr-ops` repo の外に置く。 ops repo には screenshot と notes のみ commit する。

ターミナル (zsh) で実行:

```bash
mkdir -p ~/work/google/spice-sutra-poc
cd ~/work/google/spice-sutra-poc

# blog から取得した URL で clone (例、 実際の URL は blog で確認)
git clone <blog-post-で取得した-sample-URL> xr-sample
cd xr-sample
```

clone 後のディレクトリ構造 (sample によって変わる):

```
~/work/google/spice-sutra-poc/
└ xr-sample/
   ├ app/
   │  └ src/main/java/com/example/...
   ├ build.gradle.kts (または build.gradle)
   ├ settings.gradle.kts
   └ ...
```

### B-3. Android Studio でプロジェクトを開く

1. Android Studio のスタート画面 → **「Open」**
2. `~/work/google/spice-sutra-poc/xr-sample` を選択 → **「OK」**
3. Gradle sync が自動で始まる (2-5 分)
4. sync 完了後、 左ペイン「Project」 ツリーでファイル構造を確認

> **Gradle sync エラーが出た場合**: ウィンドウ下部の「Build」タブでエラー内容を確認。 JDK バージョン不一致が多い → `File > Project Structure > SDK Location > Gradle JDK` を Android Studio 同梱の JDK に設定し直す。

---

## 4. Step C: build.gradle.kts に依存ライブラリを確認・追加する

`SpiceSutraMockHud` は **Jetpack Compose + Material3** を使う。 sample に既に含まれているか確認する。

### C-1. 依存関係の確認

`app/build.gradle.kts` (または `app/build.gradle`) をエディタで開き、 以下が含まれているか確認する:

```kotlin
dependencies {
    // Jetpack Compose
    implementation(platform("androidx.compose:compose-bom:2024.06.00"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.activity:activity-compose:1.9.0")

    // Material3 (必須)
    implementation("androidx.compose.material3:material3")

    // Jetpack XR (sample に含まれているはず)
    // implementation("androidx.xr.compose:compose:...")
}
```

### C-2. Material3 が含まれていない場合のみ追加

`dependencies { }` ブロック内に以下を追記する:

```kotlin
implementation("androidx.compose.material3:material3")
```

追記後: Android Studio 上部の **「Sync Now」** バナーをクリックして Gradle sync を実行。

---

## 5. Step D: SpiceSutraMockHud composable を作成する

### D-1. 新規ファイルを作成する

1. Android Studio の Project ツリーで `app/src/main/java/` 配下の既存 package ディレクトリを確認
   (例: `com/example/xrsample` や `com/google/androidxr/samples/` 等)
2. その package ディレクトリを **右クリック → 「New」 → 「Kotlin Class/File」**
3. ファイル名に `SpiceSutraMockHud` と入力 → **「File」** を選択 → **「OK」**

> **package 名の確認**: 既存の `.kt` ファイルの 1 行目 `package com.example.xxx` の値と合わせる。

### D-2. 以下のコードを丸ごと貼り付ける

`SpiceSutraMockHud.kt` の内容を全て削除し、 以下のコードを **そのままコピペ**する。
`package` 行の `com.example.spicesutra` は実際の package 名に書き換える (Step D-1 で確認した値)。

```kotlin
package com.example.spicesutra  // ← 実際の package 名に変更

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Card
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Spice Sutra mock HUD — 3 zone layout (hardcoded, no real logic).
 *
 * Top zone:    5-lane parallel timeline overview (curry / dal / sabzi / roti / rice)
 * Middle zone: Current step card (ingredient / action / remaining time)
 * Bottom zone: Warning toast (red banner)
 *
 * Catalyst application PoC — demonstrates HudPresenter layout concept
 * using Compose without any backend integration.
 */
@Composable
fun SpiceSutraMockHud() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        TimelineOverview()
        NextStepCard()
        WarningToast()
    }
}

@Composable
private fun TimelineOverview() {
    val lanes = listOf("curry", "dal", "sabzi", "roti", "rice")
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        lanes.forEach { lane ->
            Surface(
                modifier = Modifier
                    .weight(1f)
                    .height(36.dp),
                color = MaterialTheme.colorScheme.primaryContainer,
                shape = MaterialTheme.shapes.small
            ) {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = Modifier.fillMaxSize()
                ) {
                    Text(
                        text = lane,
                        style = MaterialTheme.typography.labelSmall
                    )
                }
            }
        }
    }
}

@Composable
private fun NextStepCard() {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = "Next: 玉葱を炒める",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = "鍋 1 (curry) — 玉葱を飴色まで 約 5 分",
                style = MaterialTheme.typography.bodyMedium
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Remaining: 4:32",
                style = MaterialTheme.typography.bodyLarge
            )
        }
    }
}

@Composable
private fun WarningToast() {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.errorContainer,
        shape = MaterialTheme.shapes.small
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "⚠",
                style = MaterialTheme.typography.titleLarge,
                color = MaterialTheme.colorScheme.error
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = "鍋 1: 火を弱めて",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.error
            )
        }
    }
}
```

---

## 6. Step E: MainActivity から SpiceSutraMockHud を呼ぶ

sample の `MainActivity.kt` (または entry point の Activity) を開き、 `setContent { }` ブロックを以下のように変更する。

### E-1. MainActivity.kt を探す

Project ツリーで `app/src/main/java/` 配下の `MainActivity.kt` を開く。

### E-2. setContent ブロックを書き換える

既存の `setContent { }` の中身を以下で **置き換える** (theme クラス名は sample の既存名をそのまま使う):

```kotlin
setContent {
    // YourSampleTheme は sample に既存の Theme composable 名に合わせる
    // 例: XrSampleTheme { ... } や MaterialTheme { ... } 等
    YourSampleTheme {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colorScheme.background
        ) {
            SpiceSutraMockHud()
        }
    }
}
```

> **theme 名の確認**: Project ツリーで `ui/theme/Theme.kt` を探す。 `@Composable fun XxxTheme(` の `Xxx` 部分が使うべき名前。

### E-3. import を追加する

`MainActivity.kt` の先頭 import 群に以下を追加する (`com.example.spicesutra` は実際の package 名に変更):

```kotlin
import com.example.spicesutra.SpiceSutraMockHud  // ← 実際の package 名に変更
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
```

> **import が既にある場合**: 重複 import は Android Studio が自動でエラー表示するので、 該当行を削除。

---

## 7. Step F: Android XR Emulator の作成と起動

### F-1. Virtual Device を作成する

1. Android Studio のメニューから **「Tools」 → 「Device Manager」** を開く
   (または右上の Device アイコンをクリック)
2. **「+」 (Add Virtual Device)** ボタンをクリック
3. カテゴリ「**XR**」または「**Android XR**」を選択
   - リストに XR カテゴリが表示されない場合 → Step A-3 に戻り system image を install
4. 適切な device profile を選択 (例: `Android XR Medium` など)
5. **「Next」** → system image リストで先ほど install した **「Android XR」** system image を選択
6. **「Next」** → AVD name を確認 → **「Finish」**

> **XR device が一覧に出ない場合**: SDK Manager で「Android XR ARM 64 v8a System Image」が Downloaded になっているか確認 (Step A-3)。

### F-2. アプリを実行する

1. Android Studio 右上のデバイス選択ドロップダウンで、 作成した AVD (例: `Android XR Medium API XX`) を選択
2. **「Run 'app'」 (緑の再生ボタン)** をクリック
3. Emulator が起動し、 アプリがインストール・起動される (初回は 3-5 分かかる場合がある)

### F-3. 期待される表示

Emulator 上に以下の 3 zone が表示されれば成功:

- **上部**: 小さな帯が 5 個横並び (左から `curry` / `dal` / `sabzi` / `roti` / `rice`)
- **中央**: カード (「Next: 玉葱を炒める」 / 「鍋 1 (curry) — ...」 / 「Remaining: 4:32」)
- **下部**: 赤みがかった帯 (「⚠ 鍋 1: 火を弱めて」)

---

## 8. Step G: Screenshot を撮る

### G-1. Android Studio のスクリーンショット機能を使う

Emulator ウィンドウが表示された状態で:

1. Emulator ウィンドウのツールバーにあるカメラアイコン 📷 をクリック
   (または Android Studio 右の「Emulator」サイドパネル → カメラアイコン)
2. 保存ダイアログが出る → 保存先と名前を指定

または、 Android Studio 上部メニュー **「Tools」 → 「Take Screenshot」** でも撮影できる。

### G-2. 撮影する 3-5 枚

以下の順番で撮影し、 それぞれの名前で保存する:

| ファイル名 | 撮影方法 |
|---|---|
| `hud-overview.png` | Emulator 全体が収まるよう zoom out した状態で撮影 (3 zone 全体が見える) |
| `hud-timeline-closeup.png` | 上部の 5 lane 帯グラフを中心に撮影 |
| `hud-next-step-closeup.png` | 中央のカード部分を中心に撮影 |
| `hud-warning-closeup.png` | 下部の赤い warning 部分を中心に撮影 |

> **拡大・縮小**: Emulator ウィンドウのサイズを変えるか、 Emulator 内でズーム (Ctrl+スクロール) して構図を整える。

### G-3. (任意) 画面収録 30-60 秒

Emulator ツールバーの「Screen record」ボタン (四角の中に丸) をクリック → 開始 → 30-60 秒後に停止。
ファイル名 `hud-demo.mp4` で保存。

### G-4. screenshot を ops repo にコピーする

```bash
# ops repo の保存先ディレクトリを作成
mkdir -p ~/work/google/xr-ops/project-aura/application/poc-screenshots

# Finder で保存した screenshot を以下にコピーする (ファイルパスは実際の保存先に合わせる)
cp ~/Desktop/hud-overview.png \
   ~/work/google/xr-ops/project-aura/application/poc-screenshots/

cp ~/Desktop/hud-timeline-closeup.png \
   ~/work/google/xr-ops/project-aura/application/poc-screenshots/

cp ~/Desktop/hud-next-step-closeup.png \
   ~/work/google/xr-ops/project-aura/application/poc-screenshots/

cp ~/Desktop/hud-warning-closeup.png \
   ~/work/google/xr-ops/project-aura/application/poc-screenshots/

# (任意)
# cp ~/Desktop/hud-demo.mp4 \
#    ~/work/google/xr-ops/project-aura/application/poc-screenshots/
```

---

## 9. Step H: poc-notes.md を作成する

以下の内容で `~/work/google/xr-ops/project-aura/application/poc-notes.md` を新規作成する。
`TODO` の箇所は実際の値で埋めること。

```markdown
# Spice Sutra DP4 PoC notes (YYYY-MM-DD)  ← 作業日に変更

## 目的

Catalyst 応募の Developer Readiness 補強。 DP4 で Compose Glimmer の mock HUD を
1 画面動かした証跡。 Development progress score (form Page 3) を 1 → 2 に bump する根拠。

## 環境

- Android Studio version: TODO (例: Ladybug Feature Drop 2024.2.2)
- Jetpack XR SDK version: DP4
- Emulator device profile: TODO (例: Android XR Medium API 36)
- System image: TODO (例: Android XR ARM 64 v8a System Image API 36)
- 作業日: TODO (例: 2026-05-22)
- macOS: Darwin 25

## やったこと

1. Android Studio (Jellyfish 以降) を install
2. SDK Manager で Android XR system image を install
3. 公式 DP4 sample を clone: `<clone-した-URL>`
4. `SpiceSutraMockHud` composable を追加 (hardcode、 real logic 無し)
   - 3 zone layout: timeline overview (5 lane) / next step card / warning toast
5. Android XR Emulator で動作確認
6. screenshot 3-5 枚 capture → `poc-screenshots/` に保存

## やってないこと (採択後に実装)

- Gemini API integration (parseRecipe / planTimeline / checkStep)
- 実 camera frame 処理 (SceneCore)
- TimelinePlanner DAG 構築
- VisionWatcher 周期チェック
- 状態管理・永続化・認証

## 査定者へのメッセージ

- 「DP4 環境を実際に触っている」 = setup 障壁を越えている。 emulator で Compose Glimmer が
  動く状態になっている。
- 「Compose Glimmer の 3 zone layout はもう作れる」 = spec § 5 の HudPresenter は
  本 PoC の直接の延長として実装可能。
- 添付 spec § 4 Architecture / § 5 Components の HudPresenter は本 PoC の構造と一致する。

## 参照

- DP4 blog: https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html
- sample repo: TODO (clone した URL)
- spec: `docs/superpowers/specs/2026-05-21-spice-sutra-design.md`
```

---

## 10. Step I: ops repo に commit する

**注意**: Kotlin code (`~/work/google/spice-sutra-poc/`) は ops repo に commit しない。 `poc-screenshots/` と `poc-notes.md` のみ commit する。

```bash
cd ~/work/google/xr-ops

# identity 確認 (commit 前の必須チェック)
git config user.name && git config user.email && gh auth status
# 期待値: YuhtaIhara / iharayuhta@gmail.com / active account YuhtaIhara

# feature branch を作成
git checkout -b docs/spice-sutra-t6-poc

# screenshot + notes を追加
git add project-aura/application/poc-screenshots/
git add project-aura/application/poc-notes.md
git status  # 確認

git commit -m "docs(spice-sutra): T6 DP4 emulator で mock HUD PoC 撮影"

# push (gpush helper を使う)
~/.claude/scripts/gpush.sh docs/spice-sutra-t6-poc YuhtaIhara
```

> **PR は controller (Claude) が別途作成**。 本手順では push まで。

---

## 11. Troubleshooting

### Emulator の起動が極端に遅い・固まる

- **原因**: Hardware Acceleration が無効、 または RAM 不足
- **確認**: `Android Studio > Tools > Device Manager` → AVD 編集 → 「Show Advanced Settings」 → `Hardware: HAXM` または `Emulated Performance: Hardware` になっているか確認
- **対処**: 他のアプリを閉じて空きメモリを確保。 16 GB 未満の RAM だと厳しい場合がある

### Android XR Emulator がデバイス選択肢に出ない

- **確認**: `SDK Manager > SDK Platforms > Show Package Details` で「Android XR ARM 64 v8a System Image」の Status が `Installed` になっているか確認
- **対処**: チェックを入れて `Apply` → 再 install

### `SpiceSutraMockHud` の import が解決されない (赤字エラー)

- **確認 1**: `package` 行が既存ファイルと一致しているか確認 (大文字小文字含む)
- **確認 2**: `File > Invalidate Caches` → `Invalidate and Restart` で IDE キャッシュをクリア
- **確認 3**: Gradle sync が完了しているか (右下のステータスバーを確認)

### Material3 の import エラー (`Cannot find 'material3'`)

- `app/build.gradle.kts` の `dependencies { }` に以下を追加して Gradle sync:
  ```kotlin
  implementation("androidx.compose.material3:material3")
  ```

### mock HUD が表示されない (白画面・黒画面)

- **確認 1**: `MainActivity.kt` の `setContent { }` 内で `SpiceSutraMockHud()` が呼ばれているか
- **確認 2**: theme の指定がある場合、 `MaterialTheme` の下に `SpiceSutraMockHud()` を置いているか
- **確認 3**: Build Output (`View > Tool Windows > Build`) でコンパイルエラーがないか確認

### `Surface` に `contentAlignment` エラーが出る

- `Surface` は Composable ラムダを 1 つ受け取るが、 `contentAlignment` パラメータはない。
  `Box` を `Surface` 内に置いて `Box(contentAlignment = Alignment.Center)` とするのが正しい (Step D-2 のコードはこの形になっている)。

### Compose preview が表示されない

- Android Studio の Design/Preview タブをクリック
- 上部「Build & Refresh」ボタンを押す
- JDK バージョン不一致の場合は `File > Project Structure > SDK Location > Gradle JDK` を Studio 同梱 JDK に変更

### `Text` が overflow する (5 lane ラベルが切れる)

- `TimelineOverview` の `Text` に `maxLines = 1` と `overflow = TextOverflow.Ellipsis` を追加:
  ```kotlin
  Text(
      text = lane,
      style = MaterialTheme.typography.labelSmall,
      maxLines = 1,
      overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis
  )
  ```

---

## 12. 完了チェックリスト

以下を全て満たせば Task 6 完了:

- [ ] Android Studio (Jellyfish 以降) が install され、 Gradle sync が通る
- [ ] SDK Manager で Android XR system image が install 済み
- [ ] 公式 DP4 sample が `~/work/google/spice-sutra-poc/` に clone できている
- [ ] `SpiceSutraMockHud` composable が Android XR Emulator で表示される (3 zone が見える)
- [ ] screenshot 3 枚以上が `project-aura/application/poc-screenshots/` に保存されている
- [ ] `project-aura/application/poc-notes.md` に環境・日付・経緯が記録されている (`TODO` が全て埋まっている)
- [ ] `docs/spice-sutra-t6-poc` branch に screenshot + notes を commit 済み

---

## 付録: scratch ディレクトリ構成の全体像

```
~/work/google/
├ xr-ops/                          # ops repo (git 管理対象)
│  └ project-aura/
│     └ application/
│        ├ poc-screenshots/        # ← commit 対象 (screenshot / 動画)
│        │  ├ hud-overview.png
│        │  ├ hud-timeline-closeup.png
│        │  ├ hud-next-step-closeup.png
│        │  ├ hud-warning-closeup.png
│        │  └ hud-demo.mp4         (任意)
│        ├ poc-notes.md            # ← commit 対象
│        └ poc-setup-guide.md      # 本 guide
│
└ spice-sutra-poc/                 # ← commit しない scratch 領域
   └ xr-sample/                   # 公式 sample clone
      └ app/src/main/java/.../
         └ SpiceSutraMockHud.kt    # Kotlin code はここに留まる
```

採択後 (2026-07-15+) に新 repo `~/work/google/spice-sutra/` を bootstrap した際、 この Kotlin code を引き継ぐ。
