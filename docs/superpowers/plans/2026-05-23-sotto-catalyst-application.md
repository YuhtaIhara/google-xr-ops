# Sotto — Catalyst Program 応募 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Sotto (engineer mentor real-time HUD for Android XR) を Project Aura Developer Catalyst Program (締切 2026-06-30 23:59 PDT) に応募し、 採択待ち状態に持っていく。

**Architecture:** 本 plan は **応募 form 提出までの 38 日 scope** に絞る (markdown / 個人情報整備 / form 提出)。 採択後 (2026-07-15+) の Kotlin 実装 plan は別途 (採択判明後に新 repo `~/work/google/sotto/` 側で書く、 Even repo memory-bridge / conversate-ops からの移植が core)。

**前提**: Spice Sutra (2026-05-21 起票、 2026-05-23 deprecated) で 5 週間相当の application framework が完成済、 本 plan はその framework を Sotto 用に書き換える + Even repo 流用 component リストを成果物として追加する scope。

**Tech Stack:** Markdown / GitHub portfolio / Google Form 提出 / (流用) Android Studio + Jetpack XR DP4 emulator で Compose Glimmer mock HUD PoC (Spice Sutra T6 で確立した知見)。

**前提 spec:** `../specs/2026-05-23-sotto-design.md`
**前提 component リスト:** `../specs/2026-05-23-sotto-even-component-reuse.md`

**Timeline (date driven)**:

```
2026-05-23 (本日、 残 38 日)
2026-05-23 〜 05-31  Task 1-3 (Spice Sutra form-structure / sources.yml 検証 + Sotto 用 pitch outline)
2026-05-31 〜 06-14  Task 4-6 (Developer Readiness 個人情報 review / portfolio 微修正 / PoC 改修)
2026-06-14 〜 06-25  Task 7-8 (pitch self-review + form-final-draft Sotto 版)
2026-06-25 〜 06-29  Task 9 (最終チェック + PDF 化)
2026-06-29 〜 06-30  Task 10 (form 提出 + submission record)
バッファ 1 日
```

**Critical path:** Task 8 (form-final-draft Sotto 版) は Task 1 (form 構造再確認) + Task 3 (pitch outline Sotto 版) + Task 4 (個人情報 Sotto 用 review) が揃って始められる。 並列実行可能な箇所は各 task 冒頭に明記。

**Spice Sutra からの差分**:
- 流用そのまま (再利用): `form-structure-2026.md` (form 自体は同じ)、 `review-log.md` の framework、 portfolio (PUBLIC + pin 完了)、 PoC setup guide の Compose 環境
- 中身書き換え: `pitch-outline.md` (Sutra → Sotto narrative)、 `form-final-draft.md` (Sotto 版を新規 file 作成)、 `personal-readiness.md` (engineer 痛みの自己記述に再構築)
- PoC 改修: T6 の 3 zone mock HUD (cooking) → engineer 用 3 zone (summary list / inline code / architecture diagram) に書換、 Compose 構造は流用

---

## File Structure

| Path | 役割 | 状態 |
|---|---|---|
| `docs/superpowers/specs/2026-05-23-sotto-design.md` | 設計 spec (根拠) | 既存 (2026-05-23 commit 予定) |
| `docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md` | Even repo 流用 component リスト | 既存 (2026-05-23 commit 予定) |
| `docs/superpowers/specs/2026-05-21-spice-sutra-design.md` | (deprecated) Spice Sutra design | 流用 artifact 参照用に保持 |
| `knowledge/google-xr-official/sources.yml` | 公式 source URL set | 既存 (Spice Sutra Task 2 で確定済、 そのまま使用) |
| `project-aura/application/form-structure-2026.md` | 応募 form の実物 doc | 既存 (Spice Sutra Task 1 で確定済、 そのまま使用) |
| `project-aura/application/pitch-outline-sotto.md` | spec § 9 を form 各項目へ変換した Sotto 版 draft | **新規** (Task 3) |
| `project-aura/application/personal-readiness.md` | Developer Readiness 個人情報 (engineer 痛み軸に再構築) | **改訂** (Task 4) |
| `project-aura/application/portfolio-prep.md` | GitHub portfolio 整備 work log | 既存 (Spice Sutra Task 5 完了、 微修正のみ) |
| `project-aura/application/poc-screenshots/` | DP4 emulator で動かした PoC 画像 | 既存 (cooking 用) → **新規追加** (Sotto 用 3 zone) (Task 6) |
| `project-aura/application/review-log-sotto.md` | 自己 + 任意外部レビューの指摘ログ (Sotto 用) | **新規** (Task 7) |
| `project-aura/application/form-final-draft-sotto.md` | form 提出直前の全項目 final draft (Sotto 版) | **新規** (Task 8) |
| `project-aura/application/submission-record.md` | form 提出後の submitted 内容 控え + submission datetime / 受領 mail screenshot | **新規** (Task 10) |
| `~/.claude/projects/-Users-yuhtaihara-work-google-xr-ops/memory/` | session 横断 memory (本 plan の進捗) | 既存 (Sotto pivot 反映済 2026-05-23) |

---

## Task 1: 応募 form 構造の再確認 (Sotto 用差分検証)

**目的:** Spice Sutra Task 1 で確定済の `form-structure-2026.md` を Sotto 用 narrative に当てはめて差分検証。 form 自体は同一 (2026-05-21 確認時点)、 Sotto では Category / Tech Stack / Use Case が変わるので項目別整合を再確認。

**Files:**
- Modify: `project-aura/application/form-structure-2026.md` (末尾に「Sotto 適用時の項目別整合」 section 追加)

- [ ] **Step 1: form 実物を再オープン (公式 source の変更検知)**

URL: https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform

- 2026-05-21 確認時から form 構造が変わっていないか (Q 追加 / 文字数制限 / 選択肢追加)
- 締切 / 配送地域 / acknowledgement 文言の変更検知

- [ ] **Step 2: Sotto 用 narrative の項目別整合 chk**

```markdown
## Sotto 適用時の項目別整合 (2026-05-23 追記)

| form 項目 | Spice Sutra 値 | Sotto 値 | 差分理由 |
|---|---|---|---|
| Category | Productivity + Health & Wellness + Education | Productivity + Enterprise + Education | engineer 痛み → enterprise 軸追加、 cooking 関連 (Health & Wellness) は外す |
| Tech Stack | Android with Compose | Android with Compose | 同じ |
| Hardware form factor | Display & Audio glasses | Display & Audio glasses | 同じ (商談中装着の social 適合性) |
| Grant amount | No grant required | No grant required | 同じ (Sotto は Even repo 流用で cost 一層低い) |
| Target Launch Regions | Global | Global | 同じ (engineer 需要は世界中) |
| Estimated launch date | 2027-04-30 | 2027-04-30 | 同じ (9 ヶ月 window 同じ) |
```

- [ ] **Step 3: 差分があれば spec へ feedback ノート (本 task 内で吸収、 spec § 9 は既に整合済)**

`2026-05-23-sotto-design.md` § 9 と矛盾あれば、 form-structure 側に「spec § 9 と本 doc の差分」 section を追記。

- [ ] **Step 4: Commit**

```bash
git add project-aura/application/form-structure-2026.md
git commit -m "docs(sotto): catalyst 応募 form Sotto 用差分検証"
```

---

## Task 2: 公式 source 再 fetch (Sotto pivot 反映)

**目的:** Spice Sutra Task 2 で確定済の `sources.yml` を、 Sotto pivot 後の文脈で読み直し。 特に Catalyst program の評価軸記載 (Vertical / Readiness / Articulation) を engineer 特化 vertical でどう打ち出すか再評価。 並列実行可能 (Task 1 と independent)。

**Files:**
- Modify: `knowledge/google-xr-official/README.md` (Sotto pivot を反映、 Spice Sutra 履歴は historical として保持)

- [ ] **Step 1: priority 1 source の最新 snapshot を再取得**

- catalyst-landing (https://developer.android.com/develop/xr/catalyst)
- catalyst-blog-2026-05
- jetpack-xr-dp4

WebFetch で取得、 `snapshots/` 配下に保存 (existing snapshot あれば overwrite)。

- [ ] **Step 2: README に Sotto pivot 反映 1 段落追記**

```markdown
## 2026-05-23 update

応募 app を Spice Sutra (Indian cooking conductor) から Sotto (engineer mentor real-time HUD) に
pivot。 sources.yml の URL set は変更なし (program 自体は同じ)、 ただし pitch narrative の重心が
cooking vertical → engineer vertical に移動。 source の活用観点も「Indian recipe vertical の
defense」 から「engineer memory extension の market gap」 に再 mapping。
```

- [ ] **Step 3: Commit**

```bash
git add knowledge/google-xr-official/README.md knowledge/google-xr-official/snapshots/
git commit -m "docs(sotto): 公式 source 再 fetch + Sotto pivot 反映"
```

---

## Task 3: pitch outline を Sotto 用に書き換え

**目的:** Spec § 9 (Sotto narrative) を form 実物の各項目に合わせて draft 化。 文字数制限を遵守。 Spice Sutra `pitch-outline.md` の構造を流用、 中身を Sotto に書換。

**前提:** Task 1 完了 (form-structure-2026.md の Sotto 差分検証済)。 Task 2 と並列可。

**Files:**
- Create: `project-aura/application/pitch-outline-sotto.md`

- [ ] **Step 1: spec § 9 と form 実物の対応表を冒頭に置く**

```markdown
# Sotto Pitch Outline (2026-05-23)

> form 実物 (`form-structure-2026.md`) の各項目へ spec § 9 を変換した draft。
> 文字数制限は form 実物に従う。 spec 側と差分が出た箇所は本 doc が prevail。
> 前身 `pitch-outline.md` (Spice Sutra 版、 2026-05-22) は historical 保持。

## 対応表

| form 項目 | spec § 9 該当箇所 | 文字数制限 (form 実物) | 状態 |
|---|---|---|---|
| App name | App 名 | 短文 | draft |
| Previous development experience | Developer Readiness 表 | 長文 | 個人情報待ち (Task 4) |
| Tech stack | Tech Stack | multi-select | draft |
| Elevator pitch | Use Case (one paragraph) | 長文 | draft |
| Category | Vertical Alignment | multi-select | draft |
| Hardware form factor | Form Factor Selection | 単一選択 | draft |
| Grant amount | Funding Requirements | 単一選択 | draft |
| Target Launch Regions | Target Launch Regions | multi-select | draft |
| Estimated launch date | Timeline | 日付 | draft |
| Upload supporting files | Supporting files | 添付 | draft |
```

- [ ] **Step 2: 各項目の draft を書く (英語版 + 日本語 reference 版)**

```markdown
## App name

**英語 (form 提出用):**
Sotto — Engineer mentor real-time HUD for Android XR

**日本語 reference:**
Sotto (ソット) — Android XR グラス用 engineer メモリ補助 HUD

**根拠:** spec § 1, § 9 App 名
```

```markdown
## Elevator pitch (Sotto 用)

**英語 (form 提出用、 約 300-350 words):**
[spec § 9 Use Case の英文を core として清書、 形容: "engineer mentor whispering past
context, in your field of view, while you stay credible in front of the other party"]

**日本語 reference:**
[内容略、 spec § 9 Use Case 参照]

**根拠:** spec § 2 Positioning + § 9 Use Case
```

- [ ] **Step 3: Category multi-select を Sotto 用に書換**

```markdown
## Category

**選択 (3 つ multi-select):**
☑ Productivity (主軸、 engineer の会話中 memory extension)
☑ Enterprise (engineer / 経営者 / 商談 context)
☑ Education (junior engineer の用語追従支援)

**根拠:** spec § 2 + § 9 Vertical Alignment、 Spice Sutra Health & Wellness は cooking 専用で外す
```

- [ ] **Step 4: Funding articulation の英文を Sotto 用に清書**

「No grant required」 + Even repo 流用率 60-70% を強調する 1 段落 (spec § 9 Funding Requirements の引用文)。

- [ ] **Step 5: Form Factor / Tech Stack / Timeline を Sotto 用に**

- Form Factor: Display & Audio glasses (商談中装着 social 適合)
- Tech Stack: Android with Compose + STT API + Vertex AI Vector Search
- Timeline: spec § 9 Timeline をそのまま (2027-04-30 Play 公開、 同じ 9 ヶ月 window)

- [ ] **Step 6: Developer Readiness はプレースホルダ残し (Task 4 でリンク)**

```markdown
## Developer Readiness

> 注: 個人情報項目は `personal-readiness.md` (Task 4 で Sotto 用に再構築) で確定後、 本 doc に転記する。
> 現状プレースホルダ (spec § 9 Developer Readiness 表):
> - Team size: Solo indie developer (YuhtaIhara、 個人 indie)
> - Prior XR experience: EVEN Realities G2 daily user since 2026-03 (約 2-3 ヶ月)、 主に Conversate
> - Prior Android experience: Kotlin / Android 触れて 1 年未満、 採択後 9 ヶ月 window で習得
> - Open source / portfolio: https://github.com/YuhtaIhara (pinned 6 個、 even-memory-bridge を含む)
> - Domain expertise: 中堅 indie engineer 自身、 多 client / 多 project context switching の痛みを daily で体感
> - Concept validation: 前身 PJ even-memory-bridge (G2 用 frozen) で 5 ヶ月の dogfood 検証済、 Aura で visual HUD として完成形に到達
```

- [ ] **Step 7: Commit**

```bash
git add project-aura/application/pitch-outline-sotto.md
git commit -m "docs(sotto): pitch outline 初版 (form 各項目への Sotto 変換)"
```

---

## Task 4: Developer Readiness の個人情報を Sotto 用に再構築

**目的:** Spice Sutra `personal-readiness.md` を Sotto 用に書換。 cooking domain expertise は外し、 engineer 痛みの自己記述 + even-memory-bridge dogfood 経験を強調。 user 自身しか答えられない情報 (G2 着用開始日 / Kotlin 経験 / pinned repo) は Spice Sutra で確定済 = そのまま流用。

**Files:**
- Modify: `project-aura/application/personal-readiness.md` (Sotto 用に末尾 section 追加 or 全面書換、 後者推奨)

- [ ] **Step 1: 既存 personal-readiness.md (Spice Sutra 版) を読み、 流用 / 書換項目を整理**

流用そのまま:
- G2 着用開始日 (2026-03、 約 2-3 ヶ月)
- Kotlin / Android 経験 (1 年未満、 採択後習得計画)
- GitHub pin 候補 6 個

書換要 (Sotto 用):
- Domain expertise: 「Indian cooking」 → 「engineer context switching の痛み (中堅 indie / 1 人企業)」
- Concept validation: 「G2 で wet-hand recipe access 痛み」 → 「even-memory-bridge で 5 ヶ月 dogfood、 G2 で memory extension PoC 済」

- [ ] **Step 2: Sotto 用 Domain expertise 文面を起こす**

```markdown
## Domain expertise (Sotto 用)

中堅 indie engineer 自身として、 多 client / 多 project の context switching に
日常的に苦しんでいる。 過去の design 判断 / PR discussion / decision log を
weekly に書き残しているが、 商談 / code review / 1:1 で 「あの時の理由は?」 と
聞かれた瞬間に思い出せない経験は週 2-3 回起きる。 phone を取り出すと credibility
が落ちる、 取り出さないと答えに詰まる、 という engineer の dilemma を user 自身が
weekly に体感している。 Sotto はこの痛みを directly に解決する dogfood-grade な
designed solution。
```

- [ ] **Step 3: Concept validation 文面を Sotto 用に書換**

```markdown
## Concept validation (Sotto 用)

前身 PJ `even-memory-bridge` (EVEN Realities G2 用 HUD-based memory extension、
2026-01 〜 2026-05 / 約 5 ヶ月 / 現在 frozen) で:

- Personal corpus を Hybrid RAG (cosine + BM25 + LLM rerank) で retrieval する
  pipeline を Python + TypeScript で完成、 G2 audio HUD 上で 200+ 回の自己 dogfood
  を実施
- G2 の audio-only HUD では code / 図 / multi-line context が出せない物理制約に
  到達 → Sotto (Aura visual HUD) はこの制約を解除する natural progression
- 「engineer 質問 → 個人 corpus retrieval → HUD render」 の 3-5 秒 latency を
  Python 側で達成 (詳細は even-component-reuse.md 参照)、 Kotlin 移植で同等性能
  維持可能

→ Sotto は新規 use case の concept ではなく、 5 ヶ月の dogfood で validated
   された premise を Aura HW で完成形にする発展。
```

- [ ] **Step 4: spec § 9 Developer Readiness 表の整合確認 (Sotto 用)**

`docs/superpowers/specs/2026-05-23-sotto-design.md` § 9 Developer Readiness の値と personal-readiness.md (Sotto 用) を 1 対 1 で照合、 差分があれば personal-readiness 側を優先 (spec § 9 を後で update)。

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/personal-readiness.md
git commit -m "docs(sotto): Developer Readiness 個人情報を Sotto 用に再構築"
```

---

## Task 5: GitHub portfolio 微修正 (Sotto pivot 反映)

**目的:** Spice Sutra Task 5 で完了済の GitHub portfolio (PUBLIC + pin) を、 Sotto pivot 後の文脈で微修正。 pin 候補は変えず (even-memory-bridge / ai-driven-template / google-xr-ops 等、 Sotto narrative にも適合)、 profile README の表現 1-2 行を engineer 向けに微調整。

**前提:** Task 4 完了 (Sotto narrative の自己記述が確定)。

**Files:**
- Modify: `project-aura/application/portfolio-prep.md` (末尾に Sotto 反映 section 追加)

- [ ] **Step 1: 現状の GitHub profile を再 screenshot**

```bash
# https://github.com/YuhtaIhara を 「sotto-pivot-before」 として screenshot 保存
# ファイル名: portfolio-prep-screenshots/sotto-pivot-before-2026-05-23.png
```

- [ ] **Step 2: profile README (YuhtaIhara/YuhtaIhara) の表現を Sotto 寄りに微調整**

修正候補 (1-2 行):
- "Indie XR developer building cooking and conversational tools" → "Indie XR developer building memory extension and conversational HUDs for engineers and tech founders"
- "Currently exploring Android XR" → "Currently building Sotto for Aura Catalyst Program"

ただし採択前は具体的 app 名を露出させ過ぎないよう注意。 「engineer 向け XR memory extension」 程度の generic 表現に留める。

- [ ] **Step 3: pin 候補は変更なし (6 個そのまま)**

Spice Sutra で確定した pin 6 個は Sotto narrative にも適合:
- `YuhtaIhara/YuhtaIhara` (profile README、 上記 update)
- `google-xr-ops` (Sotto design + Catalyst application work)
- `ai-driven-template` (Claude Code workflow baseline)
- `even-memory-bridge` (Sotto の前身 PJ、 frozen reference として極めて重要、 PUBLIC のまま)
- `sharepoint-rag-azure` (Azure RAG PoC、 Sotto の RAG layer に技術的関連)
- `sharepoint-rag-lite` (SharePoint RAG with pgvector、 同上)

- [ ] **Step 4: 整備後 screenshot 保存**

`portfolio-prep-screenshots/sotto-pivot-after-2026-MM-DD.png`

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/portfolio-prep.md project-aura/application/portfolio-prep-screenshots/
git commit -m "docs(sotto): GitHub portfolio Sotto pivot 反映"
```

---

## Task 6: DP4 emulator で Sotto 用 mock HUD PoC

**目的:** Spice Sutra T6 (cooking 用 3 zone HUD) で確立した Compose Glimmer 環境を流用、 Sotto 用 3 zone (summary list / inline code / architecture diagram) に書換。 Development progress を 2 (PoC 完了) で維持。

**前提:** Spice Sutra T6 完了済 (`poc-setup-guide.md` + `poc-notes.md` + scratch `~/work/google/spice-sutra-poc/`)。 Sotto では Compose code のみ書換、 環境 (Android Studio Panda / Gradle / JDK 17 / foojay-resolver) はそのまま流用。

**Files:**
- Modify: `project-aura/application/poc-notes.md` (末尾に Sotto 用 section 追加)
- Create: `project-aura/application/poc-screenshots/sotto-hud-overview.png`
- Create: (任意) `project-aura/application/poc-screenshots/sotto-hud-code-snippet.png`

- [ ] **Step 1: scratch dir で SpiceSutraMockHud composable を SottoMockHud に書換**

```kotlin
@Composable
fun SottoMockHud() {
  Column(
    modifier = Modifier.fillMaxSize().padding(16.dp),
    verticalArrangement = Arrangement.spacedBy(12.dp)
  ) {
    // 上: summary list 3 行 (過去 context の要約 + 出典)
    Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
      listOf(
        "X 設計を選んだ理由: latency 制約 (2026-02-15 design doc)",
        "Y 案を却下: client A の SLA 不適合 (PR #142 comment)",
        "trade-off: cost +30% vs maintainability +50% (decision log)"
      ).forEach {
        Text(it, style = MaterialTheme.typography.bodySmall, maxLines = 1)
      }
    }

    // 中: inline code snippet (syntax highlight 風)
    Surface(
      modifier = Modifier.fillMaxWidth(),
      color = MaterialTheme.colorScheme.surfaceVariant
    ) {
      Column(modifier = Modifier.padding(8.dp)) {
        Text("// from RetrievalService.kt:42", style = MaterialTheme.typography.labelSmall)
        Text("suspend fun retrieve(query: String): Result {", fontFamily = FontFamily.Monospace)
        Text("  val candidates = hybridSearch(query, k=10)", fontFamily = FontFamily.Monospace)
        Text("  return rerank(candidates).take(3)", fontFamily = FontFamily.Monospace)
        Text("}", fontFamily = FontFamily.Monospace)
      }
    }

    // 下: architecture diagram thumbnail (mock、 placeholder rect)
    Surface(
      modifier = Modifier.fillMaxWidth().height(80.dp),
      color = MaterialTheme.colorScheme.tertiaryContainer
    ) {
      Text(
        "[Architecture Diagram] ASR → IntentClassifier → CorpusRetriever → HudPresenter",
        modifier = Modifier.padding(8.dp).align(Alignment.CenterHorizontally)
      )
    }
  }
}
```

`MainActivity.kt` の content を `SottoMockHud()` 呼び出しに置換。 30-60 分の作業 (Spice Sutra T6 経験で慣れている前提)。

- [ ] **Step 2: emulator (Spice Sutra T6 で setup 済の Google Play XR ARM 64 v8a / API 34) で起動**

```bash
# Android Studio で Run、 既存 emulator を再利用
```

- [ ] **Step 3: screenshot を 1-3 枚撮る**

- `poc-screenshots/sotto-hud-overview.png` (3 zone 全体)
- (任意) `poc-screenshots/sotto-hud-code-snippet.png` (中央 code zone を強調)
- (任意) `poc-screenshots/sotto-hud-diagram.png` (下 diagram zone を強調)

- [ ] **Step 4: poc-notes.md に Sotto 用 section 追記**

```markdown
## Sotto MockHud PoC (2026-MM-DD)

### 目的
Sotto pivot 後の Development progress = 2 維持。 Compose Glimmer 3 zone HUD を
engineer 用 layout (summary list / inline code / architecture diagram) に書換、
emulator 動作確認。

### 環境 (Spice Sutra T6 から流用、 変更なし)
- Android Studio Panda Canary 4 patch 1
- Gradle 9.5.0 / JDK 17 via foojay-resolver 1.0.0
- Android XR Headset emulator (Google Play XR ARM 64 v8a, API 34, 2560×2558)

### 書換内容
- SpiceSutraMockHud (cooking 用) → SottoMockHud (engineer 用) に composable 書換
- 3 zone layout 構造はそのまま、 中身を engineer context に差替
- 上: 5 lane timeline bar (cooking) → summary list 3 行 (engineer context)
- 中: 次手順カード (cooking) → inline code snippet (engineer)
- 下: 警告 toast (cooking) → architecture diagram thumbnail (engineer)

### 査定者へのメッセージ
- 「DP4 環境を触っている」 (Spice Sutra T6 で証明済) + 「Sotto pivot 後も即書換できた」
  = 「indie が pivot しても実装の機動力ある」 二重証拠
```

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/poc-screenshots/sotto-hud-*.png project-aura/application/poc-notes.md
git commit -m "docs(sotto): DP4 emulator で Sotto mock HUD PoC 撮影"
```

---

## Task 7: pitch self-review (Sotto 用)

**目的:** form 提出前に pitch の論理 / 文字数 / 英語自然さ / 査定者目線 を最終確認。 致命的弱点を発見する最後の機会。 Spice Sutra Task 7 framework をそのまま使う、 review-log を Sotto 用に新規。

**前提:** Task 1, 3, 4, 5, 6 完了。

**Files:**
- Create: `project-aura/application/review-log-sotto.md`

- [ ] **Step 1: 自己 review (1-2 時間)**

```markdown
# Sotto Pitch Self-Review (YYYY-MM-DD)

## checklist (各項目に ◯ / △ / ✗ + 一言)

- [ ] 各 form 項目が文字数制限内
- [ ] 英語が自然 (Grammarly 等で 1 周)
- [ ] Category が「Productivity + Enterprise + Education」 で一貫
- [ ] Elevator pitch が「engineer の dilemma + Sotto の介入 + Aura HW 優位」 3 要素全部入っている
- [ ] Developer Readiness 全て埋まっている (engineer 痛み + even-memory-bridge dogfood validation)
- [ ] Funding: No grant + Even repo 流用率 60-70% を強調
- [ ] Form Factor: Display & Audio glasses 排他選択 + 商談中装着 social 適合性
- [ ] Tech Stack に Kotlin + Jetpack XR SDK DP4 + STT + Vertex AI Vector Search 明記
- [ ] Timeline が「採択判明 → 9 ヶ月で Play 公開」 で書けている
- [ ] Open source URL (https://github.com/YuhtaIhara) が動く、 even-memory-bridge が pin に含まれる
- [ ] AI 痕跡 / 主体表現がない (CLAUDE.md 規約)
- [ ] **privacy / 社会受容** の説明が pitch 本文 + spec § 7 で揃っている (差別化 key)
- [ ] **Spice Sutra との差分明示**: portfolio + design doc に Spice Sutra 残骸が混ざっていない
```

- [ ] **Step 2: 「査定者シミュレーション」 を 30-60 分**

仮想査定者として pitch を読み、 以下の角度で chk:
- 「engineer 向け memory extension HUD」 で 30 秒で印象残るか?
- 「9 ヶ月で Play 公開」 が現実的に見えるか? (Even repo 流用 60-70% が key、 これが伝わっているか)
- 「indie 1 人なのに完成度高そう」 と見えるか? (portfolio + PoC + even-memory-bridge dogfood evidence)
- 「STT + Gemini cost が膨らんで途中で詰まる」 印象がないか? (cost 試算 + cost meter design で先回り)
- 「mic 録音の privacy 懸念」 を pitch で先回りできているか? (sotto voce brand + spec § 7 privacy design)
- 「Spice Sutra から pivot した」 こと自体は plus / minus どちらに映るか? (pivot 経緯は portfolio に残らない、 spec / plan の 2026-05-23 日付が古くないことが key)

シミュレーション結果を review-log-sotto.md に追記。

- [ ] **Step 3: (任意) 外部 review 1-2 人**

候補:
- 英語 native の友人 (英文確認)
- engineer / SaaS 業界経験者 (内容妥当性)
- privacy / security 詳しい友人 (mic 録音の risk 説明確認)

依頼方針:
- pitch outline.md の英語部分のみ共有 (本 plan / spec 全文は不要)
- 「30 秒で何のアプリか伝わるか」「不自然な英語ないか」「privacy 説明が雑でないか」 を聞く

- [ ] **Step 4: 修正反映 (pitch-outline-sotto.md を update)**

review-log-sotto.md の指摘を pitch-outline-sotto.md に反映。

- [ ] **Step 5: Commit**

```bash
git add project-aura/application/review-log-sotto.md project-aura/application/pitch-outline-sotto.md
git commit -m "docs(sotto): pitch self-review + 修正反映"
```

---

## Task 8: form-final-draft.md を Sotto 用に新規作成

**目的:** Task 1-7 の output を 1 個の form 投入順 doc に集約。 Task 10 で copy-paste するだけの状態に。 既存 `form-final-draft.md` (Spice Sutra 版) は historical 保持、 Sotto 版を別 file で新規。

**前提:** Task 1-7 完了。

**Files:**
- Create: `project-aura/application/form-final-draft-sotto.md`

- [ ] **Step 1: form-structure-2026.md の項目順に章立て**

Spice Sutra `form-final-draft.md` の構造をそのまま雛形に、 値を Sotto 用に書換。 4 page 構成、 全項目漏れなく。

- [ ] **Step 2: 各項目の英文 final を form-structure 文字数制限内で確定**

pitch-outline-sotto.md (Task 7 修正反映後) から 1 つずつ確定値を貼り付け。 文字数 over があれば再圧縮 (核 message を優先)。

- [ ] **Step 3: Developer Readiness 部分は personal-readiness.md の Sotto 用確定値で埋める**

Task 4 で確定した文面を貼り付け、 Domain expertise + Concept validation を Sotto 用に。

- [ ] **Step 4: 添付ファイル 5 個までリストアップ**

```markdown
## Attachments (form Page 3 Upload supporting files、 最大 5 / 各 100MB)

| # | ファイル名 | 内容 | 準備状況 |
|---|---|---|---|
| 1 | `sotto-design.pdf` | 設計 spec PDF (`docs/superpowers/specs/2026-05-23-sotto-design.md` から pandoc 生成) | 要 PDF 化 (提出前) |
| 2 | `sotto-catalyst-application.pdf` | 実装 plan PDF (本 plan) | 要 PDF 化 (提出前) |
| 3 | `sotto-even-component-reuse.pdf` | Even repo 流用 component リスト PDF (`docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`) | 要 PDF 化 (提出前) |
| 4 | `sotto-hud-overview.png` | Task 6 emulator screenshot (3 zone) | Task 6 完了後 |
| 5 | (optional) `sotto-architecture.png` | spec § 4 architecture diagram 画像 export | 任意 |
```

- [ ] **Step 5: 最終 self-check**

```markdown
## 最終 self-check (Sotto)
- [ ] 全項目に値が入っている (TBD / TODO がない、 住所のみ意図的 [REDACTED])
- [ ] 文字数全項目 OK
- [ ] AI 主体表現がない (grep "AI 駆動\|Claude が\|AI-assisted" — ゼロ確認)
- [ ] portfolio URL 動作、 pinned 6 個 (even-memory-bridge 含む) 確認
- [ ] 添付ファイル PDF / PNG 準備
- [ ] Spice Sutra への参照が漏れていない (form 内で「cooking」 「Indian」 等の単語 zero 確認)
- [ ] 提出 account が iharayuhta@gmail.com
```

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/form-final-draft-sotto.md
git commit -m "docs(sotto): form final draft Sotto 版確定"
```

---

## Task 9: 提出 24-48h 前の最終チェック (2026-06-29 想定)

**目的:** 提出当日のトラブル回避。 Spice Sutra Task 9 framework をそのまま、 対象を form-final-draft-sotto.md に。

**前提:** Task 8 完了、 提出予定 2026-06-30。

**Files:**
- Modify: `project-aura/application/review-log-sotto.md` (final-check section 追記)

- [ ] **Step 1: 公式 source 最新 fetch (再々確認)**

WebFetch で:
- catalyst-landing
- catalyst-blog-2026-05

変更があれば form-final-draft-sotto.md を update。

- [ ] **Step 2: form URL 生存確認**

- 404 / redirect されてないか
- 個人 Google アカウント login OK か
- form-structure-2026.md と項目構成がまだ一致しているか

- [ ] **Step 3: GitHub portfolio 再確認**

pinned 6 個が今でも pin、 each repo の README 冒頭が「30 秒で意図伝わる」 形か。

- [ ] **Step 4: 添付 PDF 生成**

```bash
pandoc docs/superpowers/specs/2026-05-23-sotto-design.md -o sotto-design.pdf
pandoc docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md -o sotto-catalyst-application.pdf
pandoc docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md -o sotto-even-component-reuse.pdf
```

PDF 内 AI 痕跡確認、 page 数妥当性確認。

- [ ] **Step 5: review-log-sotto.md に最終チェック結果追記**

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/review-log-sotto.md
git commit -m "docs(sotto): 提出 24-48h 前最終チェック"
```

---

## Task 10: form 提出 + submission record

**目的:** form を実際に提出し、 提出済み内容を repo に残す。 Spice Sutra Task 10 framework をそのまま。

**前提:** Task 9 完了。 2026-06-30 23:59 PDT (= JST 2026-07-01 15:59) 以前。

**Files:**
- Create: `project-aura/application/submission-record.md`
- (Optional) Create: `project-aura/application/submission-screenshots/`

- [ ] **Step 1: 個人 Google アカウントで form ログイン**

```
https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform
```

ログイン account 確認: `iharayuhta@gmail.com`

- [ ] **Step 2: form-final-draft-sotto.md から各項目を copy-paste**

順序通りに 1 項目ずつ。 添付 (PDF 3 + PNG 1-2) アップロード。

- [ ] **Step 3: 提出直前の preview 画面で全項目を screenshot**

`submission-screenshots/preview-2026-06-30-HHMM.png` 等で全項目分。

- [ ] **Step 4: Submit ボタン**

実行。 提出成功画面 / 受領メールの screenshot:
- `submission-screenshots/submitted-confirmation.png`
- `submission-screenshots/receipt-email.png`

- [ ] **Step 5: submission-record.md を書く**

```markdown
# Submission Record (Sotto → Catalyst Program)

## 提出情報
- 提出日時 (JST): 2026-06-30 HH:MM
- 提出日時 (PDT): 2026-06-30 HH:MM
- 提出 account: iharayuhta@gmail.com
- 提出 form URL: https://docs.google.com/forms/d/e/...
- 受領メール件名: <Gmail 検索 string>
- 受領メール受信時刻: ...

## 提出内容 (form-final-draft-sotto の snapshot を貼り付け)
[form-final-draft-sotto.md の内容を本 doc にも転記、 future-proof 用]

## 添付ファイル一覧
1. sotto-design.pdf
2. sotto-catalyst-application.pdf
3. sotto-even-component-reuse.pdf
4. sotto-hud-overview.png
5. (任意) sotto-architecture.png

## 結果待ち期限
- 2026-07-15 まで (公式: 結果通知)
- 通知方法: メール (提出 account 宛)

## 採択判明後 follow-up (spec § 10 参照)
- 採択: 新 repo `~/work/google/sotto/` bootstrap、 Kotlin 実装 plan を別 session で書き出し、 Even repo memory-bridge / conversate-ops からの移植が core
- 採択落ち: `project-aura/application/post-result-decision.md` を作って次 path 判断 (翌期再応募 / G2 fork 先行 / 別 app 案 / 等)
```

- [ ] **Step 6: Commit**

```bash
git add project-aura/application/submission-record.md project-aura/application/submission-screenshots/
git commit -m "docs(sotto): catalyst program 応募提出完了"
```

- [ ] **Step 7: branch を main にマージ (個人 repo、 user 承認後)**

承認待ち operation (CLAUDE.md global rule)。 user に確認後:

```bash
~/.claude/scripts/gpush.sh docs/sotto-pivot YuhtaIhara
GH_TOKEN=$(gh auth token --user YuhtaIhara) gh pr create \
  --title "Sotto: pivot from Spice Sutra, design spec + Catalyst application work" \
  --body "Spice Sutra から Sotto への pivot 全 commit を main へ。"
```

---

## Self-Review (plan 完了直後)

**1. Spec coverage:**

| spec section | 対応 task | 状態 |
|---|---|---|
| § 1 一言定義 | Task 3 (pitch outline) | ◯ |
| § 2 Positioning | Task 3 (pitch outline) | ◯ |
| § 3 ユーザ体験 | Task 3 (pitch outline Elevator pitch) | ◯ |
| § 4 Architecture | Task 6 (PoC 撮影 = arch 検証) | ◯ |
| § 5 Components | (採択後 Kotlin 実装 plan で扱う) | — |
| § 6 Data Flow | (採択後 Kotlin 実装 plan で扱う) | — |
| § 7 Error / Edge | (採択後 Kotlin 実装 plan で扱う、 ただし privacy design は pitch でも先回り) | △ |
| § 8 Testing strategy | (採択後 Kotlin 実装 plan で扱う) | — |
| § 9 応募 narrative | Task 3, 4, 8 | ◯ |
| § 10 将来拡張 / follow-up | Task 10 step 5 (submission-record で参照) | ◯ |
| § 11 関連 docs | Task 2 (sources.yml 維持) | ◯ |

**結論:** 本 plan は応募 form 提出 scope に絞っているため、 § 5-8 は採択後の別 plan で扱う方針が明示できている。 spec coverage gap なし。

**2. Spice Sutra との重複 / 流用整合:**

- Spice Sutra `form-final-draft.md` (Sutra 版) は historical 保持、 Sotto 版を別 file `form-final-draft-sotto.md` に新規作成 → 上書き risk なし
- `form-structure-2026.md` は同一 form に対する解析、 末尾に Sotto 用差分 section 追記で対応 → file 衝突なし
- `personal-readiness.md` のみ全面改訂 (Sotto narrative に再構築)、 Spice Sutra 版を `personal-readiness-spice-sutra.md` に rename して historical 保持する選択肢あり (Task 4 step 1 で判断)
- `poc-screenshots/` は共存 (`hud-overview.png` (cooking) + `sotto-hud-overview.png` (engineer)) で問題なし

**3. Even repo 流用の倫理 / ライセンス:**

- 流用元 (memory-bridge / conversate-ops) は user 自身の indie 個人著作物、 別 vendor (EVEN Realities) 案件のためライセンス問題なし (user 2026-05-23 確認)
- ただし Even Vendor 公式が今後 G3 / G4 で similar product 出す場合の competitor 化 risk あり → spec § 10 follow-up で「camera 無し版 audio only Sotto を G2 + R1 ring で実装」 提案 path に転化 (v3 以降)

**4. Type consistency:**

- 「pitch-outline-sotto.md」「form-final-draft-sotto.md」「review-log-sotto.md」 等 file 名一貫 (-sotto suffix で Spice Sutra 版と区別)
- 「Task N」 cross-reference 一貫

**結論:** 修正不要、 plan として実行可能。

---

## 関連 docs

- 設計 spec: `../specs/2026-05-23-sotto-design.md`
- Even repo 流用 component リスト: `../specs/2026-05-23-sotto-even-component-reuse.md`
- 前身 (deprecated): `../specs/2026-05-21-spice-sutra-design.md` (流用 artifact 参照用)
- 前身 plan (deprecated): `2026-05-21-spice-sutra-catalyst-application.md` (構造流用元)
- Catalyst Program 概要: `../../../project-aura/README.md`
- ops 設計累積: `../../google-xr-design.md`
- 採択後 Kotlin 実装 plan: (採択判明後 2026-07-15+ に別 session で `2026-07-15-sotto-implementation.md` 作成予定)
