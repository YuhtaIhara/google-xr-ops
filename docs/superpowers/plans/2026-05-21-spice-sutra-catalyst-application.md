# Spice Sutra — Catalyst Program 応募 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Spice Sutra (Indian home cooking conductor for Android XR) を Project Aura Developer Catalyst Program (締切 2026-06-30 23:59 PDT) に応募し、 採択待ち状態に持っていく。

**Architecture:** 本 plan は **応募 form 提出までの 5 週間 scope** に絞る (markdown / 個人情報整備 / form 提出)。 採択後 (2026-07-15+) の Kotlin 実装 plan は別途 (採択判明後に新 repo `~/work/google/spice-sutra/` 側で書く)。

**Tech Stack:** Markdown / GitHub portfolio 整備 / Google Form 提出 / (optional) Android Studio + Jetpack XR DP4 emulator で Developer Readiness 証拠 PoC。

**前提 spec:** `../specs/2026-05-21-spice-sutra-design.md` (本 plan の根拠)

**Timeline (date driven)**:

```
2026-05-21 (本日、 残 ~5.5 週間)
2026-05-21 〜 05-28  Task 1-3 (form 実物確認 / 公式 source 確定 / pitch outline 作成)
2026-05-28 〜 06-11  Task 4-6 (Developer Readiness 個人情報 / portfolio / PoC)
2026-06-11 〜 06-25  Task 7-8 (pitch 自己 + 任意外部レビュー / form draft 全項目埋め)
2026-06-25 〜 06-29  Task 9 (最終チェック)
2026-06-29 〜 06-30  Task 10 (form 提出 + submission record)
バッファ 1 日
```

**Critical path:** Task 7 (form draft 全項目埋め) は Task 1 (form 実物確認) + Task 3 (pitch outline) + Task 4 (個人情報) が揃って始められる。 並列実行可能な箇所は各 task 冒頭に明記。

---

## File Structure

| Path | 役割 | 状態 |
|---|---|---|
| `docs/superpowers/specs/2026-05-21-spice-sutra-design.md` | 設計 spec (根拠) | 既存 commit 済 |
| `knowledge/google-xr-official/sources.yml` | 公式 source URL set | **新規** (Task 2) |
| `project-aura/application/form-structure-2026.md` | 応募 form の実物 (全項目 / 必須 / 文字数) を doc 化 | **新規** (Task 1) |
| `project-aura/application/pitch-outline.md` | spec section 9 を form 各項目へ変換した draft | **新規** (Task 3) |
| `project-aura/application/personal-readiness.md` | Developer Readiness 個人情報 (G2 着用開始日 / Kotlin 経験 / portfolio) | **新規** (Task 4) |
| `project-aura/application/portfolio-prep.md` | GitHub portfolio 整備 work log | **新規** (Task 5) |
| `project-aura/application/poc-screenshots/` | (optional) DP4 emulator で動かした PoC 画像 + 動画 | **新規** (Task 6) |
| `project-aura/application/review-log.md` | 自己 + 任意外部レビューの指摘ログ | **新規** (Task 7) |
| `project-aura/application/form-final-draft.md` | form 提出直前の全項目 final draft | **新規** (Task 8) |
| `project-aura/application/submission-record.md` | form 提出後の submitted 内容 控え + submission datetime / 受領 mail screenshot | **新規** (Task 10) |
| `~/.claude/projects/-Users-yuhtaihara-work-google-xr-ops/memory/` | session 横断 memory (本 plan の進捗) | 既存 |

---

## Task 1: 応募 form 実物の構造を doc 化

**目的:** 推定 (spec section 9) と実物 form がズレている risk を排除。 form を実際に開いて全項目 / 必須 / 文字数制限 / 選択式 vs 自由記述 を doc に落とす。

**Files:**
- Create: `project-aura/application/form-structure-2026.md`

- [ ] **Step 1: 応募 form を開いて全項目を確認**

URL: https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform

Google アカウント (個人 `iharayuhta@gmail.com` 想定) でログイン。 form 全ページを 1 周、 全項目をスクロール確認。

- [ ] **Step 2: 全項目を doc 化**

各項目について以下を記録:

```markdown
## Section N: <セクションタイトル>

### Q1. <質問文>
- 必須: yes/no
- 形式: 短文 / 長文 / 単一選択 / 複数選択 / ファイルアップロード
- 文字数制限: あり (N 字) / なし
- 選択肢 (該当時): [list]
- 推定との一致: ◯ (spec section 9 通り) / △ (差分: ...) / ✗ (想定外)
```

Spec section 9 の 7 項目 (App 名 / Vertical / Use Case / Developer Readiness / Funding / Form Factor / Tech Stack / Timeline) と実物を突き合わせ、 差分を強調。

- [ ] **Step 3: 推定外の項目 / 制約があれば spec へ feedback ノート**

実物に「想定していなかった項目」 や「文字数 200 字制限」 等の制約があれば、 doc 末尾に **「spec section 9 への差分 / 要 update」** セクションを追加。 spec 本体は触らず、 後の Task 3 (pitch outline) で吸収する。

- [ ] **Step 4: Commit**

```bash
git add project-aura/application/form-structure-2026.md
git commit -m "docs(spice-sutra): catalyst 応募 form 実物の構造を doc 化"
```

---

## Task 2: 公式 source URL 確定 + 最小限の sync 基盤投入

**目的:** Spec / pitch の根拠 URL (Android XR / Catalyst / Jetpack XR DP4 / XREAL Aura / Warby Parker) を 1 個の YAML に集約。 採択後の継続 sync 基盤になる。 並列実行可能 (Task 1 と independent)。

**Files:**
- Create: `knowledge/google-xr-official/sources.yml`
- Create: `knowledge/google-xr-official/README.md`
- (optional / Task 6 の余裕があれば) Create: `scripts/sync-google-xr-official.sh` (even-conversate-ops から派生、 今 plan では skip 可)

- [ ] **Step 1: even-conversate-ops の sources.yml schema を確認**

参考: `~/work/even/even-conversate-ops/knowledge/even-official/sources.yml`

schema 項目 (前 spec の design doc に記載):
- id / url / priority / fetch_cadence / fetch_method / snapshot_file / note

- [ ] **Step 2: 最低限の source 8 件を YAML 化**

```yaml
# knowledge/google-xr-official/sources.yml
sources:
  - id: catalyst-landing
    url: https://developer.android.com/develop/xr/catalyst
    priority: 1
    fetch_cadence: weekly
    fetch_method: webfetch
    snapshot_file: snapshots/catalyst-landing.md
    note: 応募締切 / 配送地域 / 評価軸 (Vertical/Readiness/Articulation)

  - id: catalyst-blog-2026-05
    url: https://android-developers.googleblog.com/2026/05/apply-android-xr-developer-catalyst.html
    priority: 1
    fetch_cadence: once
    fetch_method: webfetch
    snapshot_file: snapshots/catalyst-blog-2026-05.md
    note: program 発表 blog、 提供物 (HW + grant + mentoring) の一次出典

  - id: jetpack-xr-dp4
    url: https://android-developers.googleblog.com/2026/05/android-xr-sdk-developer-preview-4-updates.html
    priority: 1
    fetch_cadence: weekly
    fetch_method: webfetch
    snapshot_file: snapshots/jetpack-xr-dp4.md
    note: SDK 最新版 (Compose Glimmer / Projected API / SpatialGltfModel 等)

  - id: android-xr-io-2026
    url: https://blog.google/products-and-platforms/platforms/android/android-xr-io-2026/
    priority: 1
    fetch_cadence: once
    fetch_method: webfetch
    snapshot_file: snapshots/android-xr-io-2026.md
    note: I/O 2026 二日目発表まとめ

  - id: xreal-project-aura
    url: https://9to5google.com/2026/05/19/xreal-project-aura-android-xr-developers-2026-launch/
    priority: 2
    fetch_cadence: once
    fetch_method: webfetch
    snapshot_file: snapshots/xreal-project-aura.md
    note: Aura HW kit 仕様 (OLED 70°FOV / 有線 / glass passthrough / DisplayPort)

  - id: warby-parker-intelligent-eyewear
    url: https://www.warbyparker.com/intelligent-eyewear
    priority: 2
    fetch_cadence: monthly
    fetch_method: curl-with-ua  # WebFetch 403 確認済
    snapshot_file: snapshots/warby-parker.md
    note: consumer 側端末、 Cloudflare bot block 注意

  - id: roadtovr-android-xr-program
    url: https://www.roadtovr.com/google-android-xr-developer-program-free-ar-glasses/
    priority: 3
    fetch_cadence: once
    fetch_method: webfetch
    snapshot_file: snapshots/roadtovr-android-xr-program.md
    note: 海外 XR メディアの program 解説

  - id: moguravr-catalyst
    url: https://www.moguravr.com/android-xr-developer-catalyst/
    priority: 3
    fetch_cadence: once
    fetch_method: webfetch
    snapshot_file: snapshots/moguravr-catalyst.md
    note: 日本語 source、 応募締切 / 配送地域の和訳確認用
```

- [ ] **Step 3: README.md で運用方針記述**

```markdown
# knowledge/google-xr-official/

Google XR エコシステム公式 source の管理。 `sources.yml` が source 一覧の正本、
`snapshots/` 配下に各 source の取得スナップショット (markdown 化済) を置く。

## 運用

- 応募 / pitch 作成中 (Phase 2): `sources.yml` を編集して URL 追加 / 削除
- 採択後 (Phase 3+): `scripts/sync-google-xr-official.sh` で月次 sync (TBD、 even-conversate-ops から派生予定)
- 今期 (応募までの 5 週間) は手動 fetch で snapshots を必要時のみ取得

## 参考

- even-conversate-ops の `knowledge/even-official/` が schema と sync script の origin
- 設計判断: `../../docs/google-xr-design.md`
```

- [ ] **Step 4: snapshots/ ディレクトリは placeholder のみ作成 (空)**

```bash
mkdir -p knowledge/google-xr-official/snapshots
touch knowledge/google-xr-official/snapshots/.gitkeep
```

実 fetch は Task 7 (pitch レビュー時に根拠 URL を引用する際) に必要分のみ実行。 今期は全件 fetch しない (YAGNI)。

- [ ] **Step 5: Commit**

```bash
git add knowledge/google-xr-official/sources.yml \
        knowledge/google-xr-official/README.md \
        knowledge/google-xr-official/snapshots/.gitkeep
git commit -m "docs(knowledge): google-xr 公式 source の sources.yml 初版"
```

---

## Task 3: pitch outline を form 各項目へ変換

**目的:** Spec section 9 の narrative を、 Task 1 で確定した form 実物の各項目に合わせて draft 化。 文字数制限を遵守。

**前提:** Task 1 完了 (form-structure-2026.md があること)。 Task 2 と並列可。

**Files:**
- Create: `project-aura/application/pitch-outline.md`

- [ ] **Step 1: spec section 9 と form 実物の対応表を冒頭に置く**

```markdown
# Spice Sutra Pitch Outline

> form 実物 (`form-structure-2026.md`) の各項目へ spec section 9 を変換した draft。
> 文字数制限は form 実物に従う。 spec 側と差分が出た箇所は本 doc が prevail。

## 対応表

| form 項目 | spec section 9 該当箇所 | 文字数制限 (form 実物) | 状態 |
|---|---|---|---|
| App name | App 名 | (Task 1 で確認) | draft |
| Vertical alignment | Vertical Alignment | (同上) | draft |
| Use case | Use Case (one paragraph) | (同上) | draft |
| Developer readiness | Developer Readiness 表 | (同上) | 個人情報待ち (Task 4) |
| ... | ... | ... | ... |
```

- [ ] **Step 2: 各項目の draft を書く (英語版 + 日本語 reference 版)**

応募 form は英語提出が原則 (公式 source は英語、 査定者は英語話者)。 spec section 9 は既に英訳済 (App 名 / Use Case / Funding articulation 英文 quote)。

各項目について以下の形式:

```markdown
## App name

**英語 (form 提出用):**
Spice Sutra — Indian home cooking conductor for Android XR

**日本語 reference:**
スパイスカレー / インド家庭料理用 Android XR conductor アプリ

**根拠:** spec § 1, § 9 App 名
```

```markdown
## Vertical alignment

**英語 (form 提出用):**
Primary: Productivity & Learning
Secondary: Health & Wellness

Hands-free, vision-aware cooking guidance for complex parallel recipes
(Indian home cooking) — a category currently unaddressed on any XR platform.

**日本語 reference:**
[内容略、 spec § 9 Vertical Alignment 参照]

**根拠:** spec § 2 Positioning + § 9 Vertical Alignment
```

- [ ] **Step 3: spec の Use Case 英文をそのまま flowing paragraph として清書**

spec § 9 Use Case の英文を取り込み、 form 文字数制限内に収まることを確認。 オーバーなら核 message (parallel + spices + wet hands + vision-aware) を残して短縮。

- [ ] **Step 4: Funding articulation の英文 + milestone 表を清書**

USD 1,500-2,500、 30/40/30 配分、 各 milestone 使途 を form の funding 質問の形式 (自由記述 or 数値入力 + コメント) に合わせる。

- [ ] **Step 5: Form Factor 選択 / Tech Stack / Timeline を form 形式に合わせる**

form が radio / checkbox / 自由記述 のどれかで pivot:
- checkbox なら spec § 9 の ☑ list をそのまま選択
- 自由記述なら spec § 9 の bullet を文章化

- [ ] **Step 6: Developer Readiness はプレースホルダ残し (Task 4 でリンク)**

```markdown
## Developer Readiness

> 注: 個人情報項目は `personal-readiness.md` (Task 4) で確定後、 本 doc に転記する。
> 現状プレースホルダ:
> - Team size: Solo indie developer (YuhtaIhara / delight-x.co.jp)
> - Prior XR experience: EVEN Realities G2 daily user since [TBD]
> - Prior Android experience: [TBD]
> - Open source / portfolio: https://github.com/YuhtaIhara ([TBD: pinned 整備])
> - Domain expertise: Daily home cook of Indian / spice-based cuisine (dogfood guarantee)
> - Concept validation: Wet-hand recipe access — personal pain validated for years on G2
```

- [ ] **Step 7: Commit**

```bash
git add project-aura/application/pitch-outline.md
git commit -m "docs(spice-sutra): pitch outline 初版 (form 各項目への変換)"
```

---

## Task 4: Developer Readiness の個人情報を確定

**目的:** spec section 9 の `[TODO]` 3 箇所 (G2 着用開始日 / Kotlin & Android 経験 / pinned repo 整理) を確定。 user 自身しか答えられない情報の収集。

**Files:**
- Create: `project-aura/application/personal-readiness.md`

- [ ] **Step 1: G2 着用開始日を確認**

確認方法:
- EVEN アプリ / Account の購入履歴
- メール検索 ("Even Realities" 受領通知 / 配送通知)
- 写真 / SNS 投稿の最古日付
- `~/work/even/even-conversate-ops/` の git log で「G2 受領」 記載 commit を grep

```markdown
## G2 着用開始日

- 確定日: YYYY-MM-DD
- 出典: <メール / EVEN アプリ / git log / その他>
- 着用期間 (2026-05-21 時点): N ヶ月 / N 年
- 主要利用 use case (top 3): Conversate / Teleprompt / Transcribe / Translate / Navi のうち
```

- [ ] **Step 2: Kotlin / Android 経験を整理**

経験記述項目:
- Kotlin 経験年数 (もしくは「未経験、 採択後習得予定」)
- Android アプリ公開実績 (Play Store URL があれば全列挙)
- 関連言語経験 (Java / Swift / TypeScript 等)
- 大規模個人プロジェクトの例 (即 link で見せられるもの)

```markdown
## Kotlin / Android 経験

- Kotlin: N 年 / 未経験 (採択後 6-12 ヶ月で習得計画)
- Android アプリ公開: あり [Play URL list] / なし
- 関連言語: TypeScript (N 年) / Python (N 年) / ...
- 主要個人 PJ:
  - `<repo URL>`: <概要、 何ができるか>
  - ...
```

- [ ] **Step 3: GitHub portfolio pin 候補を選定 (Task 5 への inputs)**

`https://github.com/YuhtaIhara?tab=repositories` を確認、 pin する 6 個を選定 (Catalyst 査定者が 30 秒で見て「この indie はやれる」 と思える組合せ)。

候補例 (実 repo 確認後に確定):
- `even-conversate-ops` (XR ops 系の実績)
- `ai-driven-template` (.claude/ 設計力)
- 過去 production アプリ (なんでも)
- design 系 (UI / UX) もあれば 1 つ
- 最新 active な PJ

```markdown
## GitHub pin 候補 (順序付き 6 個)

1. `<repo>` - <査定者へのメッセージ>
2. ...
```

- [ ] **Step 4: spec § 9 Developer Readiness 表の [TODO] 3 箇所を埋める patch を作る**

`docs/superpowers/specs/2026-05-21-spice-sutra-design.md:367-373` (Developer Readiness 表) の `[TODO: ...]` 3 箇所を、 personal-readiness.md の確定値で置換する diff を提示。 実反映は Task 8 (form-final-draft 作成) で実施。

```markdown
## spec patch (Task 8 で適用)

| 箇所 | before | after |
|---|---|---|
| spec § 9 Prior XR | `since [TODO: 着用開始日を埋める]` | `since YYYY-MM-DD (N ヶ月)` |
| spec § 9 Prior Android | `[TODO: Kotlin / Android 経験年数 / 公開実績を埋める]` | `Kotlin N 年, ... (Play URL list)` |
| spec § 9 Portfolio | `([TODO: pinned repo 整理])` | `(pinned: <repo list>)` |
```

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/personal-readiness.md
git commit -m "docs(spice-sutra): Developer Readiness 個人情報を確定"
```

---

## Task 5: GitHub portfolio 整備

**目的:** 応募 form の Open source / portfolio URL (https://github.com/YuhtaIhara) を 査定者 30 秒目線で評価できる状態に。 Task 4 step 3 の pin 候補に従って GitHub profile を整える。

**前提:** Task 4 step 3 完了 (pin 候補確定済)。

**Files:**
- Create: `project-aura/application/portfolio-prep.md`

- [ ] **Step 1: 現状の GitHub profile を screenshot で記録**

```bash
mkdir -p project-aura/application/portfolio-prep-screenshots
# https://github.com/YuhtaIhara を 「before」 として screenshot 保存
# ファイル名: portfolio-prep-screenshots/before-2026-05-21.png
```

- [ ] **Step 2: profile README (`YuhtaIhara/YuhtaIhara` repo) を確認 / 整備**

```markdown
# portfolio-prep.md

## profile README 現状

- repo: `YuhtaIhara/YuhtaIhara`
- 存在: yes / no
- 内容: <現状の README 内容を貼り付け>

## 改善計画

- [ ] indie developer であることを明記
- [ ] XR / wearable 興味を明記 (EVEN G2 + Aura applicant)
- [ ] 連絡先 (mail / X / LinkedIn) を明記
- [ ] Recent / pinned projects への lead-in を 1 段落
```

- [ ] **Step 3: pinned repo を Task 4 step 3 候補通りに pin**

GitHub web UI で:
- profile 右上「Customize your pins」
- 6 個を順序通り pin

確認: https://github.com/YuhtaIhara が pinned 6 個に置き換わったこと。

- [ ] **Step 4: 各 pinned repo の README 冒頭を 1 行説明文に**

pinned 各 repo を巡回、 README の H1 / 説明文が 30 秒で意図伝わる形になっているか確認。 必要なら editorial commit。

- [ ] **Step 5: 整備後 screenshot 保存**

`portfolio-prep-screenshots/after-YYYY-MM-DD.png` で記録。

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/portfolio-prep.md project-aura/application/portfolio-prep-screenshots/
git commit -m "docs(spice-sutra): GitHub portfolio 整備 work log"
```

---

## Task 6: (optional / 推奨) DP4 emulator で簡易 PoC を撮る

**目的:** Developer Readiness に「DP4 を触っている証拠」 を 1 つ用意。 1 day 投資で「この indie はもう SDK 触れる」 印象を作る。 不要なら skip 可。

**前提:** Task 4 で「Kotlin 未経験」 でも、 emulator で Compose Glimmer の Hello World は 1 日で動かせる前提。 経験者なら 30 分。

**Files:**
- Create: `project-aura/application/poc-screenshots/`
- Create: `project-aura/application/poc-notes.md`

- [ ] **Step 1: Android Studio (Jellyfish 以降) を install / 確認**

公式 URL: https://developer.android.com/studio
Android XR Emulator 用に system requirements (RAM 16GB+ 推奨) を満たすか確認。

- [ ] **Step 2: Jetpack XR SDK DP4 sample project を clone**

公式 sample (sources.yml の jetpack-xr-dp4 blog から link 辿る):

```bash
mkdir -p ~/work/google/spice-sutra-poc/
cd ~/work/google/spice-sutra-poc/
# 公式 sample repo URL は DP4 blog 経由で取得
# (URL 確定次第ここに記載)
```

注: PoC は `google-xr-ops` repo 内には commit しない (独立に scratch 領域)。 撮った screenshot / 動画 のみ ops repo に取り込む。

- [ ] **Step 3: emulator で Hello XR World 起動**

```bash
# Android Studio で sample 開く
# Run → Android XR Emulator で起動
```

期待: emulator で 3D 空間 + Compose Glimmer の panel が見える。

- [ ] **Step 4: Spice Sutra mock HUD を 1 画面だけ作る**

3 zone (上: timeline overview / 中: 次手順カード / 下: 警告 toast) を Compose で hardcode (real logic 無し、 layout 確認のみ)。 30-90 分の作業。

サンプル Compose code (素朴な layout、 indie 30 分目標):

```kotlin
@Composable
fun SpiceSutraMockHud() {
  Column(
    modifier = Modifier.fillMaxSize().padding(16.dp),
    verticalArrangement = Arrangement.spacedBy(12.dp)
  ) {
    // 上: 5 lane timeline overview (hardcoded bars)
    Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
      listOf("curry", "dal", "sabzi", "roti", "rice").forEach {
        Surface(
          modifier = Modifier.weight(1f).height(32.dp),
          color = MaterialTheme.colorScheme.primaryContainer
        ) { Text(it, modifier = Modifier.padding(4.dp)) }
      }
    }
    // 中: 次手順カード
    Card(modifier = Modifier.fillMaxWidth()) {
      Column(modifier = Modifier.padding(16.dp)) {
        Text("Next: 玉葱を炒める", style = MaterialTheme.typography.titleMedium)
        Text("残り 4:32", style = MaterialTheme.typography.bodyLarge)
      }
    }
    // 下: 警告 toast (mock)
    Surface(
      modifier = Modifier.fillMaxWidth(),
      color = MaterialTheme.colorScheme.errorContainer
    ) { Text("⚠ 火を弱めて", modifier = Modifier.padding(8.dp)) }
  }
}
```

- [ ] **Step 5: emulator で screenshot を 3-5 枚撮る**

- `poc-screenshots/hud-overview.png`
- `poc-screenshots/hud-next-step.png`
- `poc-screenshots/hud-warning.png`
- (optional) 30 秒動画 `poc-screenshots/hud-demo.mp4`

- [ ] **Step 6: poc-notes.md で経緯と limitations を記録**

```markdown
# Spice Sutra DP4 PoC notes (2026-MM-DD)

## 目的
Catalyst 応募の Developer Readiness 補強。 DP4 で Compose Glimmer の
mock HUD を 1 画面動かした証跡。

## 環境
- Android Studio version: ...
- Jetpack XR SDK DP version: 4
- Emulator device: Android XR (...)

## やったこと
- 公式 sample から bootstrap
- SpiceSutraMockHud composable 1 個 (hardcode、 real logic 無し)
- 3 zone layout 動作確認

## やってないこと (採択後 implement)
- Gemini API integration (parseRecipe / checkStep)
- 実 camera frame 処理
- TimelinePlanner DAG 構築

## 査定者へのメッセージ
- 「DP4 環境を触っている」 = setup 障壁を越えている
- 「Compose Glimmer の 3 zone layout はもう作れる」 = HUD 設計を即実装に持っていける
```

- [ ] **Step 7: Commit (screenshots + notes のみ、 Kotlin code は scratch 領域に残す)**

```bash
git add project-aura/application/poc-screenshots/ project-aura/application/poc-notes.md
git commit -m "docs(spice-sutra): DP4 emulator で mock HUD PoC を撮影"
```

---

## Task 7: pitch self-review と (任意) 外部 review

**目的:** form 提出前に pitch の論理 / 文字数 / 英語自然さ / 査定者目線 を最終確認。 致命的弱点を発見する最後の機会。

**前提:** Task 1, 3, 4, 5 完了。 Task 6 は optional。

**Files:**
- Create: `project-aura/application/review-log.md`

- [ ] **Step 1: 自己 review (1 時間)**

review-log.md に以下のチェック項目で評価:

```markdown
# Pitch Self-Review (YYYY-MM-DD)

## checklist (各項目に ◯ / △ / ✗ + 一言)

- [ ] 各 form 項目が文字数制限内
- [ ] 英語が自然 (Grammarly や類似 tool で 1 周)
- [ ] Vertical Alignment が「Productivity & Learning」 で一貫
- [ ] Use Case 1 段落が「parallel + spices + wet hands + vision-aware」 4 要素全部入っている
- [ ] Developer Readiness の `[TODO]` 全て埋まっている (Task 4 で確定済)
- [ ] Funding 数値が milestone 配分 30/40/30 になっている
- [ ] Form Factor 3 種全部 checked
- [ ] Tech Stack に Kotlin + Jetpack XR SDK DP4 が明記
- [ ] Timeline が「採択判明 → Play 公開」 までの 9 ヶ月線で書けている
- [ ] Open source URL が動く (新しい tab で開ける、 portfolio 整備済)
- [ ] AI 痕跡 / 主体表現がない (CLAUDE.md 規約)

## 自分で発見した懸念

- ...

## 修正方針

- ...
```

- [ ] **Step 2: 「査定者シミュレーション」 を 30 分**

仮想査定者として pitch を読み、 以下の角度で chk:
- 「日本の indie がスパイスカレーアプリ」 で 30 秒で印象残るか?
- 「6-12 ヶ月で Play 公開」 が現実的に見えるか?
- 「indie 1 人なのに完成度高そう」 と見えるか? (portfolio + PoC が効くべき箇所)
- 「Gemini API cost が膨らんで途中で詰まる」 印象がないか?

シミュレーション結果を review-log.md に追記。

- [ ] **Step 3: (任意) 外部 review 1-2 人**

候補:
- 英語 native の友人 (英文確認)
- XR / AR 業界経験者 (内容妥当性)
- Indian cooking 詳しい友人 (vertical narrative 確認)

依頼方針:
- pitch outline.md の英語部分のみ共有 (本 plan / spec 全文は不要)
- 「30 秒で何のアプリか伝わるか」「不自然な英語ないか」 を聞く
- 機密度: pitch は非機密 (採用前提の draft、 漏洩しても致命でない、 spec § 機密扱いに沿う)

依頼結果を review-log.md に追記。 外部 review が時間内に集まらなければ skip 可。

- [ ] **Step 4: 修正反映 (pitch-outline.md を update)**

review-log.md の指摘を pitch-outline.md に反映。 大きな構造変更があれば Task 1 (form-structure) や Task 3 (pitch-outline) との整合性も確認。

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/review-log.md project-aura/application/pitch-outline.md
git commit -m "docs(spice-sutra): pitch self-review + 修正反映"
```

---

## Task 8: form-final-draft.md で全項目最終 draft

**目的:** Task 1〜7 の output を 1 個の form 投入順 doc に集約。 これがほぼ form 提出原稿、 Task 10 で copy-paste するだけの状態に。

**前提:** Task 1-7 完了。

**Files:**
- Create: `project-aura/application/form-final-draft.md`

- [ ] **Step 1: form-structure-2026.md の項目順に章立て**

```markdown
# Spice Sutra — Catalyst Form Final Draft (YYYY-MM-DD)

> Task 10 で form に copy-paste するための最終 draft。
> form-structure-2026.md の項目順に並べる。
> 文字数 over があれば本 doc 内で再短縮。

## Section 1: Applicant info
...

## Section 2: App overview
### App name
[英文 final]

### Vertical alignment
[英文 final]

...
```

- [ ] **Step 2: 各項目の英文 final を form-structure の文字数制限内で確定**

pitch-outline.md (Task 7 で修正反映後) から 1 つずつ確定値を貼り付け。 文字数 over があれば再圧縮 (核 message を優先)。

- [ ] **Step 3: Developer Readiness 部分は personal-readiness.md の確定値で埋める**

Task 4 step 4 の patch 通りに 3 箇所更新。

- [ ] **Step 4: 添付ファイル (もしあれば) リストアップ**

form に attachment 欄がある場合 (PoC 動画 / 設計図 PDF 等):

```markdown
## Attachments
- (optional) PoC screenshot 3 枚 (poc-screenshots/)
- (optional) Architecture diagram PDF (spec § 4 を export)
```

- [ ] **Step 5: 最終 self-check (チェックリスト 5 分)**

```markdown
## 最終 self-check
- [ ] 全項目に値が入っている (TBD / TODO がない)
- [ ] 文字数全項目 OK
- [ ] AI 主体表現がない
- [ ] portfolio URL が動く
- [ ] 添付ファイル (該当時) パス確認
```

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/form-final-draft.md
git commit -m "docs(spice-sutra): form final draft、 提出原稿確定"
```

---

## Task 9: 提出 24-48h 前の最終チェック (6-29 想定)

**目的:** 提出当日のトラブル (Google アカウントロック / form URL 変更 / 公式情報の最後の update) を回避するため、 24-48h 前に再チェック。

**前提:** Task 8 完了、 提出予定 2026-06-30。

**Files:**
- Modify: `project-aura/application/review-log.md` (final-check section 追記)

- [ ] **Step 1: 公式 source 最新 fetch (Task 2 の sources.yml priority 1 だけ)**

WebFetch で以下を再取得、 締切 / 評価軸 / 提供物 に変更がないか:
- catalyst-landing (https://developer.android.com/develop/xr/catalyst)
- catalyst-blog-2026-05

変更があれば form-final-draft.md を update。

- [ ] **Step 2: form URL を開いて生きてること確認**

```
https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform
```

- 404 / redirect されてないか
- 個人 Google アカウント (`iharayuhta@gmail.com`) でログインできるか
- form-structure-2026.md と項目構成がまだ一致しているか

差分があれば form-final-draft.md を update。

- [ ] **Step 3: GitHub portfolio 再確認**

pinned 6 個が今でも pin 状態か、 各 repo の README 冒頭が「30 秒で意図伝わる」 形か。 必要なら final touch commit。

- [ ] **Step 4: review-log.md に最終チェック結果追記**

```markdown
## Final check (YYYY-MM-DD HH:MM)

- 公式 source 最新 fetch: 変更 なし / あり (詳細)
- form URL 状態: 正常
- portfolio 状態: 正常
- 提出予定: 2026-06-30 HH:MM JST (= ... PDT)
```

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/review-log.md
# (もし form-final-draft.md を update したらそれも)
git commit -m "docs(spice-sutra): 提出 24-48h 前最終チェック"
```

---

## Task 10: form 提出 + submission record

**目的:** form を実際に提出し、 提出済み内容を repo に残す。 採択判明 (7-15) まで参照する根拠資料。

**前提:** Task 9 完了。 2026-06-30 23:59 PDT (= JST 2026-07-01 15:59) 以前。

**Files:**
- Create: `project-aura/application/submission-record.md`
- (Optional) Create: `project-aura/application/submission-screenshots/`

- [ ] **Step 1: 個人 Google アカウントで form ログイン**

```
https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform
```

ログイン account 確認: `iharayuhta@gmail.com` であること。 会社 account だと採択後の grant 配分等で混乱する。

- [ ] **Step 2: form-final-draft.md から各項目を copy-paste**

順序通りに 1 項目ずつ。 添付があればアップロード。

- [ ] **Step 3: 提出直前の preview 画面で全項目を screenshot**

`submission-screenshots/preview-YYYY-MM-DD-HHMM.png` 等で全項目分。 提出後の改ざん耐性確保。

- [ ] **Step 4: Submit ボタン**

実行。 提出成功画面 / 受領メールの screenshot を取る:
- `submission-screenshots/submitted-confirmation.png`
- `submission-screenshots/receipt-email.png` (Gmail 受領メール)

- [ ] **Step 5: submission-record.md を書く**

```markdown
# Submission Record (Spice Sutra → Catalyst Program)

## 提出情報

- 提出日時 (JST): YYYY-MM-DD HH:MM
- 提出日時 (PDT): YYYY-MM-DD HH:MM
- 提出 account: iharayuhta@gmail.com
- 提出 form URL: https://docs.google.com/forms/d/e/...
- 受領メール件名: <Gmail 検索 string>
- 受領メール受信時刻: ...

## 提出内容 (final-draft の snapshot を貼り付け)

[form-final-draft.md の内容を本 doc にも転記、 future-proof 用]

## 添付ファイル一覧

- ...

## 結果待ち期限

- 2026-07-15 まで (公式: 結果通知)
- 通知方法: メール (提出 account 宛)

## 採択判明後 follow-up (spec § 10 参照)

- 採択: 新 repo `~/work/google/spice-sutra/` bootstrap、 Kotlin 実装 plan を別 session で書き出し
- 採択落ち: `project-aura/application/post-result-decision.md` を作って次 path 判断 (翌期再応募 / G2 fork 先行 / 等)
```

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/submission-record.md project-aura/application/submission-screenshots/
git commit -m "docs(spice-sutra): catalyst program 応募提出完了"
```

- [ ] **Step 7: branch を main にマージ (個人 repo、 user 承認後)**

承認待ち operation (CLAUDE.md global rule)。 user に「branch `docs/spice-sutra-design` を main にマージ + push して良いか」 を確認後:

```bash
git checkout main
git merge --no-ff docs/spice-sutra-design -m "Merge: Spice Sutra design + Catalyst application work"
# push は更に別途承認
```

または **PR 作成 path**:

```bash
~/.claude/scripts/gpush.sh docs/spice-sutra-design YuhtaIhara
GH_TOKEN=$(gh auth token --user YuhtaIhara) gh pr create \
  --title "Spice Sutra: design spec + Catalyst application work" \
  --body "spec + application work を統合した branch を main へ。"
```

---

## Self-Review (plan 完了直後)

**1. Spec coverage:**

| spec section | 対応 task | 状態 |
|---|---|---|
| § 1 一言定義 | Task 3 (pitch outline) | ◯ |
| § 2 Positioning | Task 3 (pitch outline) | ◯ |
| § 3 ユーザ体験 | Task 3 (pitch outline Use Case) | ◯ |
| § 4 Architecture | Task 6 (PoC 撮影 = arch 検証) | ◯ |
| § 5 Components | (採択後 Kotlin 実装 plan で扱う) | — |
| § 6 Data Flow | (採択後 Kotlin 実装 plan で扱う) | — |
| § 7 Error / Edge | (採択後 Kotlin 実装 plan で扱う) | — |
| § 8 Testing strategy | (採択後 Kotlin 実装 plan で扱う) | — |
| § 9 応募 narrative | Task 3, 4, 8 | ◯ |
| § 10 将来拡張 / follow-up | Task 10 step 5 (submission-record で参照) | ◯ |
| § 11 関連 docs | Task 2 (sources.yml) | ◯ |

**結論:** 本 plan は応募 form 提出 scope に絞っているため、 § 5-8 は採択後の別 plan で扱う方針が明示できている。 spec coverage gap なし。

**2. Placeholder scan:**

- Task 1 step 1 の `form-structure-2026.md` schema 内 `<セクションタイトル>` 等は **テンプレ穴埋め指示**であり、 plan の placeholder ではない (Task 1 実行時に user が埋める正規な work item)
- Task 6 step 2 「公式 sample repo URL 確定次第ここに記載」 → これは **plan placeholder**。 Task 2 (sources.yml) で DP4 blog URL を取得済なので、 sample URL も Task 2 中に追記すべき → 修正 (Task 2 step 2 の `jetpack-xr-dp4` source note に「sample repo URL もここから辿る」 と明記済、 OK)
- Task 4-5 の `[TBD]` は user 入力待ちの placeholder で plan としては正規 (Task 内で「これを user が埋める」 と明示)

**3. Type consistency:**

- 「pitch-outline.md」「form-final-draft.md」「submission-record.md」 等 file 名一貫
- 「Task N」 cross-reference 一貫 (Task 4 → Task 8 への spec patch リンク 等)

**結論:** 修正不要、 plan として実行可能。

---

## 関連 docs

- 設計 spec: `../specs/2026-05-21-spice-sutra-design.md`
- 前 session ハンドオフ: `../../2026-05-20-android-xr-catalyst-handoff.md`
- Catalyst Program 概要: `../../../project-aura/README.md`
- ops 設計累積: `../../google-xr-design.md`
- 採択後 Kotlin 実装 plan: (採択判明後 2026-07-15+ に別 session で `docs/superpowers/plans/YYYY-MM-DD-spice-sutra-implementation.md` 作成予定)
