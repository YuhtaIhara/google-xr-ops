# Spice Sutra — Catalyst Application Pitch Outline

> form 実物 4 page の各項目への英文 draft。 個人情報は [TBD: 概要] でプレースホルダ、 後の Task 8 で確定値に置換予定。 提出言語は英語、 日本語 reference を併記。

## form 項目対応表

| form Page / Q | 本 outline 内 section | source spec |
|---|---|---|
| Page 1 / Company section (7 項目) | § Company info | spec § 9 Developer Readiness 上段 |
| Page 2 / Previous dev experience | § Previous Development Experience | spec § 9 Developer Readiness |
| Page 2 / Existing apps | § Existing Apps | spec § 9 Developer Readiness portfolio |
| Page 2 / Tech stack (multi) | § Tech Stack | spec § 9 Tech Stack |
| Page 3 / Elevator pitch | § Elevator Pitch | spec § 9 Use Case + § 1 一言定義 + § 2 Positioning |
| Page 3 / Upload supporting files | § Supporting Files | spec § 9 Supporting files |
| Page 3 / Category (multi) | § Category | spec § 9 Vertical Alignment |
| Page 3 / Existing port link | § Existing Port | (該当無し: 新規開発) |
| Page 3 / Development progress | § Development Progress | spec § 9 Developer Readiness |
| Page 3 / Target Launch Regions (multi) | § Target Launch Regions | spec § 9 Target Launch Regions |
| Page 3 / Estimated launch date | § Estimated Launch Date | spec § 9 Timeline |
| Page 3 / Hardware form factor | § Hardware Form Factor | spec § 9 Form Factor Selection |
| Page 4 / Grant amount | § Grant Amount | spec § 9 Funding Requirements |
| Page 4 / Acknowledgements | § Acknowledgements | (form 標準 2 checkbox) |

---

## § Company info

**English (form 提出用):**

- **Company Name:** `[TBD: delight-x.co.jp (company entity) or YuhtaIhara (Individual) — user decision]`
- **Company website:** `[TBD: user decision]`
- **Primary Contact Name:** Yuhta Ihara
- **Primary Contact Email:** iharayuhta@gmail.com
- **Job title:** `[TBD: Indie Developer / Founder / Engineer — user decision]`
- **Region:** APAC
- **Country:** Japan
- **Company Address:** `[TBD: user's address]`

**日本語 reference:**

- 会社名: 会社単位 (`delight-x.co.jp`) または個人名義 (`YuhtaIhara`) — user 判断
- サイト: user 判断
- 代表者名: Yuhta Ihara
- 代表メール: iharayuhta@gmail.com
- 肩書: Indie Developer / Founder / Engineer 等 — user 判断
- Region: APAC
- 国: 日本
- 住所: user の住所

**根拠:**

form-structure-2026.md Page 1 全 7 項目。 spec § 9 Developer Readiness 上段の表と整合。 `[TBD]` 3 箇所は個人情報のため user 確認後 Task 8 で置換。

---

## § Previous Development Experience

**English (form 提出用):**

Solo indie developer based in Japan. I build and ship software independently, with a background in Kotlin and Android development spanning `[TBD: years of Kotlin / Android experience]`. No co-founders, no team — design, implementation, and QA all sit with me.

On the XR side: I have been a daily user of EVEN Realities G2 display glasses since `[TBD: start date]`. That's roughly `[TBD: duration]` of hands-on experience with a heads-up display in real-world contexts — commuting, cooking, note-taking. That daily friction taught me where HUD UX works and where it breaks down. The G2 has no camera, which means recipe display was possible but step-advance and visual confirmation were not. That gap is exactly what Spice Sutra addresses.

On the Android side: I have published `[TBD: app count and names, or "portfolio projects on GitHub" if no public production release]`. My GitHub is github.com/YuhtaIhara. The work there reflects my approach to clean architecture and solo-maintainable codebases.

Domain expertise: I cook Indian and spice-based cuisine at home regularly. I have personally experienced the parallel-cooking, wet-hands, spice-residue problem that Spice Sutra solves. I am the primary dogfooder. That is not a talking point — it is the reason I trust the premise enough to spend nine months on it.

**日本語 reference:**

日本在住のソロ indie 開発者。 Kotlin / Android 経験は `[TBD: 年数]`。 共同創業者・チームなし。 設計・実装・QA を一人で担う。

XR 経験: EVEN Realities G2 display glasses を `[TBD: 着用開始日]` から毎日使用。 HUD UX を通勤・料理・メモ取りの日常で体感。 G2 にカメラが無いため「レシピ表示はできても工程判定ができない」 という限界を実感しており、 その gap が Spice Sutra のコアになっている。

Android 経験: 公開実績 `[TBD: アプリ名・件数]`、 GitHub: github.com/YuhtaIhara。

ドメイン知識: 自宅でインド・スパイス料理を日常的に調理。 parallel 調理 + 濡れた手 + スパイス手という問題を自分自身で体感しており、 自分が第一の検証者。

**根拠:**

form-structure-2026.md Page 2「Previous development experience」(必須・長文)。 spec § 9 Developer Readiness 表の Solo indie developer / G2 経験 / dogfood guarantee 各行が対応。 `[TBD]` 3 箇所は個人情報 / 公開実績情報のため Task 8 で確定。

---

## § Existing Apps

**English (form 提出用):**

> **Task 8 note:** これらは alternate phrasings。 personal-readiness.md 結果に応じて 1 つだけ採用、 もう 1 つは削除。

Portfolio: github.com/YuhtaIhara `[TBD: note whether pinned repos are organized; add any public production app URLs here if available]`

`[TBD: If no public production app: "Solo indie portfolio on GitHub. No published production app on Google Play to date — Spice Sutra is the first Play-targeted release."]`

**日本語 reference:**

ポートフォリオ: github.com/YuhtaIhara。 公開 production app があれば URL を追加。 なければ「Google Play への公開は Spice Sutra が初」 と明記。

**根拠:**

form-structure-2026.md Page 2「Existing apps」(任意・links)。 spec § 9 Developer Readiness 表の「Open source / portfolio」行が対応。 実態に応じて Task 8 で確定。

---

## § Tech Stack

**English (form 提出用):**

Primary selection: **Android with Compose**

Details:
- Language / runtime: Kotlin + Jetpack XR SDK (Developer Preview 4, targeting Beta)
- UI: Jetpack Compose Glimmer
- Scene / camera: Jetpack SceneCore (periodic single-frame capture)
- Multimodal AI: Gemini 2.x via Vertex AI (or Gemini Direct API)
- Auth: Google OAuth 2.0 (personal Google Cloud project)
- Distribution target: Google Play (Android XR)

Unity-specific fields (Unity version / render pipeline / Graphics API): **N/A** — Compose-based stack, no Unity dependency.

**日本語 reference:**

選択: Android with Compose。 Kotlin + Jetpack XR SDK DP4 + Jetpack Compose Glimmer + SceneCore (camera frame 取得) + Gemini 2.x multimodal。 Unity 関連項目は N/A。

**根拠:**

form-structure-2026.md Page 2「Tech stack」(必須・複数選択)。 spec § 9 Tech Stack と完全一致。 form 実物の選択肢「Android with Compose」が Spice Sutra の選択。

---

## § Elevator Pitch

**English (form 提出用):**

Indian home cooking demands precision on two axes simultaneously: strict tempering sequence (cumin → onion → garlic-ginger → tomato → spice powders → protein, with no margin for misordering) and true parallel execution across three to five dishes at once — curry, dal, sabzi, rice, roti — each on its own timeline. The whole time, your hands are wet, spiced, and unusable. You cannot touch your phone. You cannot flip a page. Voice assistants answer questions but do not watch the pan. Every other recipe tool assumes you have a free hand.

Spice Sutra resolves this with three steps. First, point the glasses at your recipe — a cookbook, a handwritten note, a phone screen — and capture it with a single camera tap. Gemini parses the image into a structured recipe with ingredients, tempering order, timing, and parallel-execution hints. Second, the app builds a five-lane parallel timeline and displays it as a heads-up overlay in your natural field of view, no hand required to advance. Third, every 30–60 seconds, the glasses take one frame and ask Gemini a targeted question: "Has the onion caramelized? Did the mustard seeds pop?" The answer drives the next step — advance, hold, or warn — delivered as a brief audio cue or a HUD card change. You stay in flow. The app stays out of the way unless something needs your attention.

This combination — camera-based recipe capture, parallel-execution planning, and periodic vision-aware step checking — does not exist on any XR platform today. The Display & Audio glasses form factor is a direct fit: display for the HUD, camera for periodic checks, audio for cues. No other consumer XR device currently combines all three. Spice Sutra is scoped to a single vertical deep enough to dogfood every week, narrow enough for a solo developer to ship in nine months, and differentiated enough that no existing app comes close.

**日本語 reference:**

インド家庭料理は、 テンパリング順序の厳密性と複数鍋同時進行という 2 つの要求を同時に満たす必要がある。 その間、 手は濡れてスパイスで汚れており、 スマホも本も触れない。 他の全レシピ tool は「手が空いている」前提。

Spice Sutra は 3 ステップで解決する: (1) グラスのカメラでレシピを 1 枚撮影、 Gemini が構造化 JSON を返す。 (2) 並列 timeline を構築して視野 HUD に表示。 (3) 30〜60 秒ごとにカメラで 1 frame を撮り、 「玉葱は飴色か? マスタードは弾けたか?」 を Gemini に聞いて判定。 結果を HUD カード切替と短い音声 cue で伝える。

この組み合わせ (camera 撮影 + 並列計画 + 周期 vision 判定) は現在どの XR platform にも存在しない。 Display & Audio glasses の form factor は camera + display + audio の 3 要素を備え、 Spice Sutra と直接 fit する。 1 vertical を深く掘り、 9 ヶ月で solo 出荷できるスコープに絞っている。

**根拠:**

form-structure-2026.md Page 3「Elevator pitch」(必須・長文)。 spec § 9 Use Case 英文 (約 70 words) を base に拡張。 spec § 1 一言定義・§ 2 Positioning (parallel / spices / wet hands / vision-aware / camera / Gemini / 9 ヶ月) を 3 段落構成で網羅。 文字数: 約 380 words。

---

## § Supporting Files

**English (form 提出用):**

Up to 5 files planned for attachment (max 100 MB each):

1. `spice-sutra-design.pdf` — Full design spec (architecture, data flow, component boundaries, error handling, test strategy, application narrative). Approximately 11 sections.
2. `spice-sutra-catalyst-application.pdf` — Implementation plan (10 tasks from pitch outline through PoC through final submission). Shows execution readiness beyond the idea stage.
3. `spice-sutra-poc-demo.mp4` — Screen recording of mock HUD running on DP4 emulator (Compose Glimmer, parallel timeline display). Available after Task 6 completion.
4. `spice-sutra-poc-hud-screenshots.pdf` — Static screenshots of HUD layout (5-lane timeline, step card, warning toast) on DP4 emulator. Available after Task 6 completion.
5. `spice-sutra-architecture.png` — Architecture diagram (optional; exported from spec § 4).

**日本語 reference:**

最大 5 ファイル添付予定: 設計 spec PDF / plan PDF / PoC 動画 (Task 6 完了後) / HUD スクリーンショット PDF (Task 6 完了後) / アーキテクチャ図 (任意)。 「indie 1 人で design 完了済」 を 30 秒で証明する winning move として活用。

**根拠:**

form-structure-2026.md Page 3「Upload supporting files」(任意・最大 5 / 100MB each)、 spec § 9 Supporting files と完全一致。 ファイル名は plan 内の成果物名を踏襲。

---

## § Category

**English (form 提出用):**

Selected categories (multi-select):

- ☑ **Productivity** — Primary. Parallel cooking conductor is fundamentally a productivity tool: it reduces cognitive overhead, prevents errors, and shortens active attention time during complex multi-dish preparation.
- ☑ **Health & Wellness** — Hands-free home cooking supports healthier eating habits. Reducing friction in complex recipe execution makes home-cooked meals more accessible.
- ☑ **Education** — Users learning new spices or unfamiliar Indian recipes benefit from guided, step-by-step execution with visual confirmation. Each session builds tacit cooking knowledge.

**日本語 reference:**

3 つ multi-select: Productivity (主軸、 並列調理 conductor = 生産性 tool) / Health & Wellness (家庭料理 → 健康な食生活) / Education (スパイス / 新料理を覚える学習体験)。

**根拠:**

form-structure-2026.md Page 3「Category」(必須・複数選択)、 spec § 9 Vertical Alignment の 3 選択と一致。 form 実物の選択肢名称に合わせた表記。

---

## § Existing Port

**English (form 提出用):**

N/A — new development. Spice Sutra is not a port or adaptation of an existing app. This is a greenfield application designed natively for the Android XR Display & Audio glasses form factor.

**日本語 reference:**

N/A — 新規開発。 既存 app の port ではない。 Android XR Display & Audio glasses 向けに新規設計。

**根拠:**

form-structure-2026.md Page 3「Existing port link」(任意・短文)。 Spice Sutra は既存 app 無し。

---

## § Development Progress

**English (form 提出用):**

Current at time of writing: **1 / 10**

Design specification complete (architecture, data flow, component boundaries, error handling, test strategy). Implementation not yet started. No code committed.

Target at submission (after Task 6 PoC): **2 / 10**

One-screen mock HUD (Compose Glimmer, parallel timeline display) running on DP4 emulator. Demonstrates that the core presentation layer compiles and renders as specified. Task 6 completion is the gating condition for this bump.

Note: This score will be re-evaluated at time of actual submission depending on Task 6 progress.

**日本語 reference:**

現時点: 1/10 (設計 + spec 完了、 実装未着手)。 提出時目標: 2/10 (plan Task 6 PoC 完了で 1 画面 mock HUD on DP4 emulator 動作確認済)。 Task 6 の進行次第で提出時に再評価。

**根拠:**

form-structure-2026.md Page 3「Development progress」(必須・0-10 scale)、 spec § 9 Developer Readiness 表の下段と整合。 0 = haven't started / 10 = completed, ready to port。

---

## § Target Launch Regions

**English (form 提出用):**

- ☑ **Global**

Indian home cooking is practiced across a broad diaspora — the broader Indian diaspora across eligible markets (US, UK, EU, Japan), the Middle East, Southeast Asia, and beyond. Restricting to JAPAC would undercut the app's natural audience. Global is the appropriate selection for a vertically focused cooking app with a globally distributed user base.

**日本語 reference:**

Global を選択。 Indian cooking の diaspora は世界中に分布しており、 JAPAC 限定にしない。

**根拠:**

form-structure-2026.md Page 3「Target Launch Regions」(必須・複数選択)、 spec § 9 Target Launch Regions と一致。

---

## § Estimated Launch Date

**English (form 提出用):**

**2027-04-30**

Nine-month timeline from hardware kit receipt (estimated 2026-08) through DP4 prototype, Gemini integration, real-device alpha, beta dogfood, and Google Play submission. Detailed milestone schedule available in the supporting plan document.

**日本語 reference:**

2027-04-30。 HW kit 受領 (2026-08 想定) から 9 ヶ月の逆算。 DP4 prototype → Gemini integration → 実機 alpha → beta dogfood → Play 公開。 詳細 milestone は添付 plan PDF に記載。

**根拠:**

form-structure-2026.md Page 3「Estimated launch date」(必須・日付)、 spec § 9 Timeline 最終行と一致。

---

## § Hardware Form Factor

**English (form 提出用):**

Selected: ☑ **Display & Audio glasses**

Rationale: Spice Sutra's three core capabilities — heads-up display for the parallel timeline, periodic camera capture for visual step-checking, and audio cues for hands-free alerts — map directly to the Display & Audio glasses hardware profile (display + camera + speakers). The production form factor and the development target are the same device class, meaning the app ships without porting overhead.

Wired XR glasses were not selected for a practical reason: cooking involves continuous movement around a stove, counter, and sink. A wired headset physically prevents that mobility. The use case requires untethered glasses.

A wired XR (immersive) version of Spice Sutra — with a richer visual environment for recipe presentation — is a plausible future application, but out of scope for this submission.

**日本語 reference:**

Display & Audio glasses を選択。 HUD + camera + audio の 3 要素が Spice Sutra の core に直接 fit。 production form factor と開発 target が同じ device class のため、 port 不要で MVP がそのまま製品に乗る。 Wired XR は調理場での移動が物理的に不可のため非選択。 Wired 版は将来 v2 以降の候補として残す。

**根拠:**

form-structure-2026.md Page 3「Hardware form factor」(必須・排他 2 択)、 form 実物の差分 1 (Form Factor は排他) と spec § 9 Form Factor Selection (全面差し替え後) に基づく。

---

## § Grant Amount

**English (form 提出用):**

Selected: ☑ **No grant required**

The MVP scope — five Indian recipe templates with hybrid timer and periodic camera-based Gemini vision checks — can be self-funded. Estimated Gemini API cost for development and initial production use is in the range of 50,000–150,000 JPY per year for a solo developer running personal usage volumes. This is well within personal budget for an indie project.

I am applying for hardware kit access and technical resources. Those are the inputs that cannot be replicated independently: early access to Display & Audio glasses hardware before consumer release, and direct technical support during SDK integration. The grant funding is not necessary to reach the Play Store milestone.

**日本語 reference:**

No grant required を選択。 MVP cost (Gemini API tuning) は indie 1 人の試算で年 5〜15 万円程度に収まる見込みで自費賄い可能。 $10K (≈ 150 万円) は明確に overshooting。 HW kit + technical resources へのアクセスのみで MVP 9 ヶ月完成可能。 控えめ姿勢 (No grant) は採用率を上げる方向に効く。

**根拠:**

form-structure-2026.md Page 4「Grant amount」(必須・4 択)、 form 実物の差分 2 (Grant 金額固定 4 択) と spec § 9 Funding Requirements の全面差し替え後方針に基づく。

---

## § Acknowledgements

**English (form 提出用):**

Both checkboxes will be checked at time of form submission:

- ☑ I understand that if selected, my team will be required to sign standard digital agreements.
- ☑ I understand that funding is milestone-based.

**日本語 reference:**

form 提出時に 2 checkbox 両方にチェックを入れる。 (1) 採択時に標準的なデジタル契約への署名が必要なことを理解している。 (2) 資金援助はマイルストーンベースであることを理解している。

**根拠:**

form-structure-2026.md Page 4「Program Acknowledgements」(必須・2 checkbox)。 内容確認済み、 提出時チェック。

---

## 追記: Page 2 / Opt-in Android XR dev updates email

**English (form 提出用):**

Yes — opt in.

**日本語 reference:**

Yes を選択。 Android XR developer updates を受け取る。

**根拠:**

form-structure-2026.md Page 2「Opt-in Android XR dev updates email」(必須・yes/no)。 開発者として有用な情報源のため yes 推奨。

---

*end of outline*
