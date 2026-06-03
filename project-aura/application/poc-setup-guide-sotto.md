# Sotto DP4 PoC セットアップガイド (Windows 版)

> Android XR Emulator で Compose Glimmer の **engineer 特化 mock HUD** を動かし、 screenshot を撮る手順書。 自己完結 (他 doc 参照不要)。
>
> 旧 `poc-setup-guide.md` (macOS + Spice Sutra cooking 版) は historical 保持。 本 doc が **Sotto 版 + Windows 版** current。
> 2026-05-31 の Mac → Windows 移行で旧 PoC 環境 (Studio / AVD / sample clone) は引き継がれていないため、 本 guide は Windows 上でゼロから構築する前提。

---

## 0. Goal と deliverables

**何をするか**: Jetpack XR SDK DP4 の公式 sample を base に `SottoMockHud` composable (hardcode・real logic 無し) を 1 画面追加し、 Android XR Emulator で動作確認して screenshot を撮る。

**なぜ必要か**:
- 応募 form Page 3「Development progress (0-10 scale)」の **score 2** の根拠を Sotto 版で成立させる (現状の cooking screenshot では engineer-specific 主張と食い違う)
- 「DP4 を実際に触っている」「Compose Glimmer の engineer 3 zone layout を実装できる」を証明
- form Page 3 Supporting files 枠の添付 `sotto-hud-overview.png` を生成

**成果物**:
- `project-aura/application/poc-screenshots/sotto-hud-overview.png` (**必須**、 form 添付 #4)
- `project-aura/application/poc-screenshots/sotto-summary-closeup.png` (推奨)
- `project-aura/application/poc-screenshots/sotto-code-closeup.png` (推奨)
- `project-aura/application/poc-screenshots/sotto-diagram-closeup.png` (推奨)
- `project-aura/application/poc-notes-sotto.md` (本 guide と同時に template 作成済、 作業後に値を埋める)

---

## 1. Prerequisites

| 項目 | 要件 |
|---|---|
| OS | Windows 11 (PowerShell) |
| RAM | 16 GB+ 推奨 (Android XR Emulator は重い) |
| 空き容量 | 約 20 GB (Android Studio + XR system image + Emulator) |
| 所要時間 | 半日〜1 日 (Studio install から。 SDK platform は一部既存) |
| 事前知識 | 不要。 本 guide の通りコピペで進められる |

### 1-1. 現在の Windows 機の状態 (2026-06-03 確認済)

- **Android Studio: 未インストール** → Step A で install 要
- **Android SDK: 一部のみ存在** (`%LOCALAPPDATA%\Android\Sdk` に `android-36` / `android-36.1` platform + build-tools + platform-tools)
- **emulator package: 無し** → Step A-3 で install 要
- **Android XR system image: 無し** → Step A-3 で install 要
- **AVD: 未作成** → Step F で作成要
- **DP4 sample scratch dir: 無し** → Step B で clone 要

---

## 2. Step A: Android Studio のインストール

### A-1. ダウンロード・インストール

1. ブラウザで https://developer.android.com/studio を開く
2. **「Download Android Studio」** をクリック → Windows 版 (`.exe`) を DL
3. `.exe` を実行 → install wizard に従う (install 先 default `C:\Program Files\Android\Android Studio` でよい)
4. 起動 (初回は SmartScreen 警告が出る場合あり →「詳細情報」→「実行」)

> **バージョン要件**: Android XR Emulator のサポートは Studio **Jellyfish (2023.3.1)** 以降。 2026 年時点の最新 stable で問題ない。 確認は起動後 `Help > About`。

### A-2. 初回セットアップウィザード

1. **Next** → **Standard** → **Next**
2. SDK 保存先は既存の `%LOCALAPPDATA%\Android\Sdk` を指す (default。 既存 platform を再利用)
3. **Finish** → SDK コンポーネント DL (5-15 分)

### A-3. Android XR system image + emulator を追加 install

現状 system image と emulator package が無いので必ず実施:

1. start 画面 → **More Actions → SDK Manager** (project を開いている場合は **Tools → SDK Manager**)
2. **SDK Platforms** タブ:
   - 右下「**Show Package Details**」をオン
   - `Android 16 (Baklava)` または `Android 15 (VanillaIceCream)` を展開
   - **「Android XR ARM 64 v8a System Image」** にチェック (なければ「Android XR Google APIs ARM 64 v8a System Image」)
3. **SDK Tools** タブ:
   - **「Android Emulator」** にチェック (現状未 install なので必須)
   - 「Android SDK Platform-Tools」 が入っているか確認 (既存のはず)
4. **Apply → OK** → DL 完了まで待つ (XR system image は 1-1.5 GB、 5-15 分)

> **XR が見つからない場合**: API level を 15/16 両方展開して「XR」を含む image を探す。 DP4 系は API 34 (UpsideDownCake) の XR image の場合もある — 「Android XR」を含むものを選べばよい。

---

## 3. Step B: Jetpack XR SDK DP4 公式 sample の取得

### B-1. 公式 blog から sample URL を取得

DP4 公式 sample は以下 blog post に掲載:

```
https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html
```

1. 上記 URL を開く
2. `Ctrl+F` で「sample」「GitHub」「github.com/android/xr」を検索
3. sample repo の GitHub URL を見つける (想定: `https://github.com/android/xr-samples` 等)

### B-2. scratch ディレクトリに clone

**注意**: Kotlin code は `xr-ops` repo の **外** に置く。 ops repo には screenshot と notes のみ commit する。

PowerShell で実行:

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Documents\work\google\sotto-poc"
Set-Location "$env:USERPROFILE\Documents\work\google\sotto-poc"

# blog で取得した URL で clone (実 URL は blog 確認)
git clone <blog-post-で取得した-sample-URL> xr-sample
Set-Location xr-sample
```

### B-3. Android Studio でプロジェクトを開く

1. start 画面 → **Open**
2. `C:\Users\user\Documents\work\google\sotto-poc\xr-sample` を選択 → OK
3. Gradle sync 自動開始 (初回 5-15 分、 JDK + dependency DL)
4. sync 完了後、 左 Project ツリーで構造確認

> **Gradle sync エラー (JDK 不一致)**: `File > Settings > Build, Execution, Deployment > Build Tools > Gradle` の「Gradle JDK」を Studio 同梱 JDK (jbr-17 等) に設定。

---

## 4. Step C: 依存ライブラリ確認

`SottoMockHud` は **Jetpack Compose + Material3** を使う。 sample に含まれているか確認。

`app/build.gradle.kts` の `dependencies { }` に下記があるか確認、 無ければ Material3 のみ追記:

```kotlin
implementation("androidx.compose.material3:material3")
```

追記後、 上部「Sync Now」バナーで Gradle sync。

---

## 5. Step D: SottoMockHud composable を作成

### D-1. 新規ファイル作成

1. Project ツリーで `app/src/main/java/` 配下の既存 package ディレクトリを確認 (例: `com/example/xrsample`)
2. 右クリック → **New → Kotlin Class/File** → ファイル名 `SottoMockHud` → **File** → OK

### D-2. 以下のコードを丸ごと貼り付け

`SottoMockHud.kt` の内容を全削除し、 以下を **そのままコピペ**。 1 行目 `package` を実際の package 名に書き換える (既存 `.kt` の 1 行目に合わせる)。

> demo シナリオ: 数ヶ月前の自分の commit が code review に上がり「**なぜ audit module に event-sourcing を選んだ?**」と聞かれた瞬間に Sotto が出す HUD。 全 hardcode・backend なし。 設計 spec § 3 (HUD render) / § 5 (HudPresenter 3 zone) に対応。

```kotlin
package com.example.sotto  // ← 実際の package 名に変更

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Sotto mock HUD — engineer-specific 3-zone layout (hardcoded, no real logic).
 *
 * Demo question: "Why did you choose event-sourcing for the audit module?"
 *
 *   Top    : past-context summary list (3 rows, source file path each)
 *   Middle : inline code snippet (monospace, ~6 lines)
 *   Bottom : architecture diagram thumbnail (Command -> EventStore -> ReadModel)
 *
 * Maps to design spec section 3 (HUD render) and section 5 (HudPresenter, 3 zone).
 * Catalyst application PoC — Compose layout without any backend integration.
 */
@Composable
fun SottoMockHud() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        SummaryList()
        CodeSnippet()
        ArchitectureThumbnail()
    }
}

@Composable
private fun SummaryList() {
    val hits = listOf(
        "Event-sourcing chosen for immutable audit trail" to "audit/DESIGN.md:42",
        "Trade-off: write-amplification accepted vs full history" to "PR #128 review",
        "Rejected CRUD — no point-in-time reconstruction" to "decisions/2025-11-08.md"
    )
    Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
        hits.forEach { (text, source) ->
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.primaryContainer,
                shape = MaterialTheme.shapes.small
            ) {
                Column(modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp)) {
                    Text(
                        text = text,
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = source,
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun CodeSnippet() {
    val code = """
        // audit/EventStore.kt — append-only, never mutate
        fun append(e: AuditEvent): EventId {
            val seq = sequencer.next()
            return store.insert(e.copy(seq = seq))
        }
        // state = fold(events); no UPDATE / DELETE
    """.trimIndent()
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(12.dp)) {
            Text(
                text = "audit/EventStore.kt",
                style = MaterialTheme.typography.labelMedium,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(6.dp))
            Text(
                text = code,
                fontFamily = FontFamily.Monospace,
                fontSize = 12.sp,
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun ArchitectureThumbnail() {
    val nodes = listOf("Command", "EventStore", "Projection", "ReadModel")
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.secondaryContainer,
        shape = MaterialTheme.shapes.small
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(4.dp)
        ) {
            nodes.forEachIndexed { i, node ->
                Surface(
                    color = MaterialTheme.colorScheme.surface,
                    shape = MaterialTheme.shapes.extraSmall
                ) {
                    Text(
                        text = node,
                        style = MaterialTheme.typography.labelSmall,
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 6.dp)
                    )
                }
                if (i < nodes.size - 1) {
                    Text(text = "->", style = MaterialTheme.typography.labelMedium)
                }
            }
        }
    }
}
```

---

## 6. Step E: MainActivity から SottoMockHud を呼ぶ

sample の `MainActivity.kt` (entry point Activity) の `setContent { }` を以下で置換 (theme クラス名は sample 既存名に合わせる):

```kotlin
setContent {
    // YourSampleTheme は sample 既存の Theme composable 名に合わせる (例: XrSampleTheme)
    YourSampleTheme {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colorScheme.background
        ) {
            SottoMockHud()
        }
    }
}
```

import 追加 (`com.example.sotto` は実際の package 名に変更):

```kotlin
import com.example.sotto.SottoMockHud
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
```

> **theme 名**: `ui/theme/Theme.kt` の `@Composable fun XxxTheme(` の `Xxx`。 重複 import は Studio が赤字表示するので削除。

---

## 7. Step F: Android XR Emulator の作成と起動

1. **Tools → Device Manager** → **「+」 (Add Virtual Device)**
2. カテゴリ「**XR**」または「**Android XR**」を選択 (出ない場合は Step A-3 で system image install)
3. device profile を選択 (例: `Android XR Medium`) → **Next**
4. Step A-3 で install した XR system image を選択 → **Next** → AVD name 確認 → **Finish**
5. 右上のデバイス選択で作成した AVD を選択 → **Run 'app' (緑▶)**
6. Emulator 起動 + app install (初回 3-5 分)

### F-1. 期待表示

XR 環境 (immersive scene) 内に Compose panel が浮遊し、 panel 内に 3 zone:
- **上**: 3 行の summary list (各行に decision text + 出典 path `audit/DESIGN.md:42` 等)
- **中**: code card (`audit/EventStore.kt` の append-only snippet、 monospace)
- **下**: architecture thumbnail (`Command -> EventStore -> Projection -> ReadModel`)

---

## 8. Step G: Screenshot を撮る

Emulator ツールバーのカメラアイコン 📷、 または **Tools → Take Screenshot**。

| ファイル名 | 撮影 |
|---|---|
| `sotto-hud-overview.png` | 3 zone 全体が収まるよう zoom out (**必須**、 form 添付) |
| `sotto-summary-closeup.png` | 上部 summary list 中心 (推奨) |
| `sotto-code-closeup.png` | 中央 code card 中心 (推奨) |
| `sotto-diagram-closeup.png` | 下部 architecture thumbnail 中心 (推奨) |

ops repo にコピー (PowerShell、 保存先パスは実際の DL/保存先に合わせる):

```powershell
$dst = "$env:USERPROFILE\Documents\work\google\xr-ops\project-aura\application\poc-screenshots"
New-Item -ItemType Directory -Force -Path $dst
Copy-Item "$env:USERPROFILE\Desktop\sotto-hud-overview.png" $dst
Copy-Item "$env:USERPROFILE\Desktop\sotto-summary-closeup.png" $dst
Copy-Item "$env:USERPROFILE\Desktop\sotto-code-closeup.png" $dst
Copy-Item "$env:USERPROFILE\Desktop\sotto-diagram-closeup.png" $dst
```

---

## 9. Step H: poc-notes-sotto.md を埋める

本 guide と同時に作成済の `poc-notes-sotto.md` の `TODO` を実値で埋める (作業日 / Studio version / system image / AVD profile / clone URL)。

---

## 10. Step I: ops repo に commit する

**注意**: Kotlin code (`sotto-poc/`) は commit しない。 `poc-screenshots/` の Sotto 版 PNG と `poc-notes-sotto.md` のみ。

```powershell
Set-Location "$env:USERPROFILE\Documents\work\google\xr-ops"

# identity 確認 (commit 前必須)
git config user.name; git config user.email; gh auth status
# 期待値: YuhtaIhara / iharayuhta@gmail.com / active account YuhtaIhara

git add project-aura/application/poc-screenshots/sotto-*.png
git add project-aura/application/poc-notes-sotto.md
git status
```

> commit / push は明示命令で controller (Claude) 側が identity 確認の上で実施。 本 guide では add まで。

---

## 11. Troubleshooting

### Emulator 起動が遅い・固まる
- RAM 不足 / acceleration 無効。 Device Manager → AVD 編集 → Advanced で `Emulated Performance: Hardware`。 他アプリを閉じる。 Windows は WHPX (Windows Hypervisor Platform) 有効化が必要な場合あり (`Windows の機能の有効化` で「Windows ハイパーバイザー プラットフォーム」をオン)。

### XR device が一覧に出ない
- SDK Manager → SDK Platforms → Show Package Details で「Android XR ... System Image」が `Installed` か確認。

### `SottoMockHud` の import が赤字
- `package` 行が既存 file と一致しているか。 `File > Invalidate Caches > Invalidate and Restart`。 Gradle sync 完了確認。

### Material3 import エラー
- `app/build.gradle.kts` に `implementation("androidx.compose.material3:material3")` 追記 → Sync。

### 白画面・黒画面
- `MainActivity` の `setContent` 内で `SottoMockHud()` を呼んでいるか。 Build Output でコンパイルエラー確認。

### 下部 architecture thumbnail の 4 node + 矢印が横にあふれる
- panel 幅が狭いと overflow。 node 数を 3 に減らす (`val nodes = listOf("Command", "EventStore", "ReadModel")`)、 または `ArchitectureThumbnail` の `Text` font を `labelSmall` のまま `fontSize = 10.sp` 指定で縮小。

### code snippet が枠からはみ出る
- `CodeSnippet` の `fontSize = 12.sp` を `10.sp` に下げる。

---

## 12. 完了チェックリスト

- [ ] Android Studio (Jellyfish 以降) install、 Gradle sync が通る
- [ ] SDK Manager で Android XR system image + Emulator package install 済
- [ ] 公式 DP4 sample が `sotto-poc/xr-sample` に clone 済
- [ ] `SottoMockHud` が Android XR Emulator で表示 (engineer 3 zone: summary list / code / diagram)
- [ ] `sotto-hud-overview.png` を含む screenshot が `poc-screenshots/` に保存
- [ ] `poc-notes-sotto.md` の `TODO` が全て埋まっている
- [ ] form-final-draft-sotto.md 140 行 / 添付表 194 行の「sotto-hud-overview.png」と実ファイルが一致

---

## 付録: scratch ディレクトリ構成

```
C:\Users\user\Documents\work\google\
├ xr-ops\                              # ops repo (git 管理)
│  └ project-aura\application\
│     ├ poc-screenshots\               # ← commit 対象
│     │  ├ sotto-hud-overview.png      (form 添付 #4)
│     │  ├ sotto-summary-closeup.png
│     │  ├ sotto-code-closeup.png
│     │  └ sotto-diagram-closeup.png
│     ├ poc-notes-sotto.md             # ← commit 対象
│     └ poc-setup-guide-sotto.md       # 本 guide
│
└ sotto-poc\                           # ← commit しない scratch
   └ xr-sample\                        # 公式 sample clone
      └ app\src\main\java\...\
         └ SottoMockHud.kt             # Kotlin code はここに留まる
```

採択後 (2026-07-15+) に新 repo を bootstrap した際、 この Kotlin code を引き継ぐ。
