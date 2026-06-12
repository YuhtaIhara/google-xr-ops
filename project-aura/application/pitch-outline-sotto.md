# Sotto — Catalyst Application Pitch Outline

> form 実物 4 page の各項目への英文 draft (Sotto 版)。 個人情報は 2026-05-21 session で user 確定済 (Q1-Q8、 Spice Sutra から流用可能)。 住所のみ機密扱いで `[REDACTED]` 維持、 user が form 提出時に直接入力。 提出言語は英語、 日本語 reference を併記。
>
> 前身 `pitch-outline.md` (Spice Sutra 版、 2026-05-22 確定) は historical 保持、 本 doc が Sotto 用 current。

## form 項目対応表

| form Page / Q | 本 outline 内 section | source spec | Spice Sutra との差分 |
|---|---|---|---|
| Page 1 / Company section (7 項目) | § Company info | spec § 9 Developer Readiness 上段 | 同じ (user 確定済) |
| Page 2 / Previous dev experience | § Previous Development Experience | spec § 9 Developer Readiness | **narrative 全面書換** (engineer 痛み + memory-bridge dogfood) |
| Page 2 / Existing apps | § Existing Apps | spec § 9 Developer Readiness portfolio | pin 6 個同じ、 言及順序で even-memory-bridge を強調 |
| Page 2 / Tech stack (multi) | § Tech Stack | spec § 9 Tech Stack | Compose 同じ、 詳細に STT + Vertex AI Vector Search 追加 |
| Page 3 / Elevator pitch | § Elevator Pitch | spec § 9 Use Case + § 1 + § 2 | **全面書換** (engineer mentor narrative) |
| Page 3 / Upload supporting files | § Supporting Files | spec § 9 Supporting files | sotto-* PDF 3 本 + sotto-hud-overview.png |
| Page 3 / Category (multi) | § Category | spec § 9 Vertical Alignment | **Health & Wellness 外す、 Enterprise 追加** |
| Page 3 / Existing port link | § Existing Port | (該当無し: 新規開発) | 同じ |
| Page 3 / Development progress | § Development Progress | spec § 9 Developer Readiness | score 2 同じ、 **根拠が Even RAG 完成品所持 + Sotto PoC** に変化 |
| Page 3 / Target Launch Regions (multi) | § Target Launch Regions | spec § 9 Target Launch Regions | 同じ (Global) |
| Page 3 / Estimated launch date | § Estimated Launch Date | spec § 9 Timeline | 同じ (2027-04-30) |
| Page 3 / Hardware form factor | § Hardware Form Factor | spec § 9 Form Factor Selection | 同じ form factor、 **rationale が cooking → 商談 social fit に変化** |
| Page 4 / Grant amount | § Grant Amount | spec § 9 Funding Requirements | No grant 同じ、 **narrative に Even repo 流用率 60-70% を追加** |
| Page 4 / Acknowledgements | § Acknowledgements | (form 標準 2 checkbox) | 同じ |

---

## § Company info

**English (form 提出用):**

- **Company Name:** Yuhta Ihara
- **Company website:** https://github.com/YuhtaIhara
- **Primary Contact Name:** Yuhta Ihara
- **Primary Contact Email:** iharayuhta@gmail.com
- **Job title:** Indie Developer
- **Region:** APAC
- **Country:** Japan
- **Company Address:** `[REDACTED — 個人住所、 commit 対象外。 user が form 提出時に直接入力 (session 内英訳済、 別途管理)]`

**日本語 reference:**

- 会社名: `Yuhta Ihara` (個人 indie、 会社案件ではない、 開業届なし)
- サイト: https://github.com/YuhtaIhara (portfolio 主目的)
- 代表者名: Yuhta Ihara
- 代表メール: iharayuhta@gmail.com
- 肩書: Indie Developer
- Region: APAC
- 国: 日本
- 住所: user の住所

**根拠:**

form-structure-2026.md Page 1 全 7 項目。 Spice Sutra Task 4 で user 確定済 (2026-05-21)、 Sotto pivot でも個人情報は不変。 住所のみ機密扱いで `[REDACTED]` 維持。

---

## § Previous Development Experience

**English (form 提出用):**

Solo indie developer based in Japan. I build and ship software independently — design, implementation, and QA all sit with me, with no co-founders or team. I work daily across multiple client projects and personal initiatives, and the cognitive cost of context-switching between them is the personal pain that motivated this application.

My hands-on time with Kotlin and Android-adjacent technologies is under a year. I am applying with the explicit plan to use the nine-month post-acceptance window to ramp up on Jetpack XR SDK (DP4 → Beta) and Gemini multimodal APIs while porting and extending my prior conversational HUD work into a production Android XR release. The depth of design work already completed (see attached spec and plan) and the maturity of the reusable components from my prior project (60–70% of the MVP backbone — RAG pipeline, masking layer, intent classification, HUD state machine — already exists as battle-tested Python and TypeScript code, see attached component reuse document) are the leverage I bring against limited language experience.

On the XR side: I have been a daily user of EVEN Realities G2 display glasses since March 2026 — roughly two to three months of hands-on time with a heads-up display in real-world contexts, primarily Conversate (G2's flagship conversational HUD use case). Prior to that, I built and dogfooded `even-memory-bridge` (now frozen, public on GitHub), a personal XR HUD + life-log + retrieval experiment on the same G2 hardware, for approximately five months. That project taught me where audio-only HUDs work and where they reach physical limits — the G2 cannot render code snippets, decision logs as visual lists, or architecture diagrams. Sotto on Aura is the natural progression: take the engineer-specific retrieval pipeline I already built, and render it as visual context the G2 hardware never could.

On portfolio: I have not published a production app on Google Play. My open work is on github.com/YuhtaIhara — pinned public repositories are `even-memory-bridge` (the prior XR HUD experiment that informs Sotto's architecture) and `google-xr-ops` (this submission's design and application work), with SharePoint RAG implementations (Azure design / pgvector + FastAPI) linked from the profile README. The portfolio reflects a working approach: solid design specs, clean structure, solo-maintainable scope, and visible dogfood evidence.

Domain expertise: I am the primary user persona for Sotto. As a mid-career indie engineer running multiple parallel projects, I weekly hit the moment where someone asks "why did you choose X?" about a months-old decision and I cannot recall the reasoning fast enough to answer credibly. That is not a researched insight — it is my Tuesday afternoon. I am the dogfooder, and that is the reason I trust the premise enough to spend nine months on it.

**日本語 reference:**

日本在住のソロ indie 開発者。 設計・実装・QA を一人で担う。 複数 client PJ + 個人 PJ を並行運用、 多 project context switching の認知負荷が本応募の動機となった個人的痛み。

Kotlin / Android 触れて 1 年未満。 採択後 9 ヶ月 window を Jetpack XR SDK (DP4 → Beta) + Gemini multimodal API 習得 + 前 PJ の Kotlin 移植 + Sotto MVP 構築に充てる。 言語経験の浅さを補う leverage は、 (1) 既に完了している設計 (spec + plan、 添付参照)、 (2) **MVP backbone (RAG pipeline / masking layer / intent classification / HUD state machine) の 60-70% が既存の Python / TypeScript code として battle-tested で存在** (添付 component reuse doc 参照) の 2 点。

XR 経験: EVEN Realities G2 display glasses を 2026 年 3 月から毎日使用 (約 2-3 ヶ月)、 主に Conversate (G2 の flagship 会話 HUD)。 それ以前、 同 G2 hardware で `even-memory-bridge` (現在 frozen、 GitHub 公開) を約 5 ヶ月開発 + dogfood した経験あり (個人 XR HUD + life-log + retrieval 実験)。 G2 の audio-only HUD では code snippet / decision log の visual list / architecture diagram が出せない物理的限界に到達したのが、 Sotto を Aura visual HUD で実装する動機。

Android 経験: Google Play 公開実績なし。 GitHub: github.com/YuhtaIhara、 pinned は even-memory-bridge (Sotto の前身 XR HUD 実験) / google-xr-ops (本応募の設計 + application work) の 2 個、 SharePoint RAG 実装 (Azure 設計 / pgvector + FastAPI) は profile README から link。 portfolio 全体が「設計 spec + clean structure + solo-maintainable scope + visible dogfood evidence」 を反映。

ドメイン知識: 中堅 indie engineer 自身が Sotto の primary user persona。 複数 PJ 並行 + 多 client context switching で、 数ヶ月前の自分の決定について「なぜ X 設計を?」 と聞かれた瞬間に思い出せず credibility が落ちる経験を週単位で体感。 これは researched insight でなく user の火曜日午後そのもの、 dogfooder として 9 ヶ月の commitment を支える前提。

**根拠:**

form-structure-2026.md Page 2「Previous development experience」(必須・長文)、 Sotto 適用差分 section の Page 2 narrative 全面書換に対応。 spec § 9 Developer Readiness 表の Domain expertise + Concept validation 行を組込み。 Even repo 流用率 60-70% を「言語経験の浅さを補う leverage」 の中核 hook として使用、 添付 component reuse doc への参照で realistic backup。

---

## § Existing Apps

**English (form 提出用):**

Portfolio: github.com/YuhtaIhara. Solo indie portfolio on GitHub. No published production app on Google Play to date — Sotto is the first Play-targeted release. Pinned public repositories (in order of relevance to this application):

- `even-memory-bridge` — frozen prior project. Personal XR HUD + life-log + retrieval experiment on EVEN Realities G2 audio glasses. Five months of dogfood. Contains the RAG pipeline, embedding/chunking, masking layer, and HUD state machine that Sotto reuses (60–70% of the MVP backbone, see attached component reuse document).
- `google-xr-ops` — this submission's design specification, Catalyst application plan, and Even component reuse inventory.

Additional implementation work linked from the profile README:

- `sharepoint-rag-azure` — Azure RAG PoC with design docs, IaC, and architecture diagrams.
- `sharepoint-rag-lite` — SharePoint RAG implementation with pgvector + FastAPI + ACL.

**日本語 reference:**

Portfolio: github.com/YuhtaIhara。 Google Play 公開実績なし、 Sotto が初の Play target。 pinned 2 個 (Sotto への関連順) + README link 2 個:

- `even-memory-bridge` (pinned): frozen 前 PJ。 EVEN G2 audio glasses 上の XR HUD + life-log + retrieval 実験。 5 ヶ月 dogfood。 RAG pipeline / embedding / chunking / masking / HUD state machine を保有、 Sotto MVP backbone の 60-70% を流用 (添付 component reuse doc)
- `google-xr-ops` (pinned): 本応募の設計 spec + plan + Even 流用 inventory
- `sharepoint-rag-azure` (README link): Azure RAG PoC + 設計 doc + IaC + architecture diagram
- `sharepoint-rag-lite` (README link): SharePoint RAG (pgvector + FastAPI + ACL)

**根拠:**

form-structure-2026.md Page 2「Existing apps」(任意・自由記述 links)。 pin は 2026-06-07 に 2 個構成 (`even-memory-bridge` / `google-xr-ops`) に整理済、 sharepoint-rag 2 つは profile README link 経由 (delight-ihara org へ redirect、 public 200)、 `ai-driven-template` は private 化 404 のため削除 (2026-06-12 同期)。 `even-memory-bridge` 冒頭で「前 PJ → Sotto への natural progression」 narrative を強化。

---

## § Tech Stack

**English (form 提出用):**

**Tech stack (multi-select):**

☑ Android with Compose

**Details (for supporting context):**

- **Language / runtime:** Kotlin + Jetpack XR SDK (Developer Preview 4, targeting Beta when available)
- **UI:** Jetpack Compose Glimmer (Display Glasses), Stacks and Title Chips components for the three-zone HUD layout
- **Audio:** Android MediaRecorder for ephemeral PCM rolling buffer (16 kHz, no disk persistence)
- **Automatic speech recognition:** OpenAI Whisper API for v1 (cloud), on-device evaluated for v2
- **Multimodal LLM:** Gemini 2.x text via Vertex AI for intent classification, retrieval reranking, and HUD summarization
- **Vector search:** Vertex AI Vector Search for the user's personal corpus (design docs, PR comments, decision logs)
- **Auth:** Google OAuth 2.0 with the user's personal Google Cloud project (data never leaves the user's tenant)
- **Distribution target:** Google Play (Android XR)

**Unity-specific fields:** N/A — Compose-based stack, no Unity dependency.

**日本語 reference:**

Tech stack: ☑ Android with Compose

詳細:
- 言語 / runtime: Kotlin + Jetpack XR SDK (DP4、 Beta 利用可になり次第移行)
- UI: Jetpack Compose Glimmer、 DP4 新 component (Stacks / Title Chips) を 3 zone HUD layout に活用
- Audio: Android MediaRecorder で ephemeral PCM rolling buffer (16 kHz、 disk 書込なし)
- ASR: v1 は OpenAI Whisper API (cloud)、 v2 で on-device 検討
- LLM: Gemini 2.x text via Vertex AI、 intent classification + retrieval rerank + HUD summarization
- Vector search: Vertex AI Vector Search、 user 個人 corpus (design doc / PR / decision log) 用
- Auth: Google OAuth 2.0、 user 個人 Google Cloud project (data は user tenant 外に出ない)
- Distribution: Google Play (Android XR)

Unity-specific: N/A (Compose 経由)

**根拠:**

form-structure-2026.md Page 2「Tech stack」(必須・複数選択)、 Spice Sutra と同じ Compose 選択。 詳細部分は Sotto 用に拡張: STT (OpenAI Whisper) + Vector Search (Vertex AI Vector Search) + Privacy 文言 (user tenant 外に出ない) を追加。

---

## § Elevator Pitch

**English (form 提出用、 約 280-310 words):**

Engineers and tech founders carry too much technical context to recall on demand. Mid-conversation, when asked "why did you choose X over Y?" or "what was the trade-off in that architecture?", they fumble — not because they don't know, but because the past decision is buried in design docs, PR comments, and decision logs they wrote months ago. Phone lookup is socially impossible in a serious meeting; AI on a phone signals weakness.

Sotto captures the question via the glasses' microphone, classifies it as a technical retrieval request, runs hybrid RAG over the user's personal corpus, and renders the relevant past context — code snippets, decision logs, architecture diagrams — directly in the user's field of view. The user answers in their own voice, with their own authority. The phone stays in the pocket. The other party sees no device, no glance away, no hesitation.

The architecture is purpose-built for the Display & Audio glasses form factor: a three-zone HUD (summary list of relevant past decisions, inline code snippet with syntax highlighting, architecture diagram thumbnail) that no audio-only glasses platform can render. The personal corpus stays inside the user's own Google Cloud project. Recordings are ephemeral with no disk persistence. A masking layer scrubs personally identifiable information and client-specific identifiers before any text reaches the LLM. The brand name itself — *sotto voce*, "in a soft voice" — signals the product's design ethic: the AI whispers, never interrupts, and the user remains the answerer.

This combination — real-time visual HUD, personal-corpus retrieval, and engineer-specific intent classification — does not exist on any XR platform today. The MVP scope reuses 60–70% of a battle-tested prior project (see attached component reuse document), making a nine-month solo path to Google Play credible.

**日本語 reference:**

[要約のみ] engineer / tech founder の context switching dilemma → Sotto が会話の質問を listen して個人 corpus を retrieval、 Aura の HUD に code / decision log / diagram を表示 → user 自身が answer 主体、 phone 不要、 相手にバレない → 3 zone HUD は audio-only glasses 不可能 → privacy core (個人 Google Cloud / ephemeral / masking) + brand 名 sotto voce が design 哲学を signal → 流用率 60-70% で 9 ヶ月 solo Play 公開現実的、 という構成。

**根拠:**

spec § 1 一言定義 + § 2 Positioning + § 3 ユーザ体験 + § 7 privacy 設計 + § 9 Use Case の合成。 280-310 words に圧縮 (form の long-form 想定範囲)。 強み: (1) 「phone signals weakness」 で engineer reviewer 直撃、 (2) 「own voice / own authority」 で AI 主体表現回避 + authenticity 担保、 (3) Privacy core を 1 段落で集約 (mic 録音懸念に先回り)、 (4) brand 名解釈で design 哲学を 1 word 補強、 (5) 流用率 60-70% で indie 1 人 9 ヶ月の現実性 担保。

---

## § Supporting Files

**English (form 提出用、 リスト):**

Attachments (max 5 / 100 MB each):

1. `sotto-design.pdf` — Full design specification (architecture, data flow, component boundaries, privacy design, error handling, test strategy, application narrative). 11 sections, approximately 590 lines.
2. `sotto-catalyst-application.pdf` — Implementation plan (10 tasks from pitch outline through PoC through final submission). Demonstrates execution readiness beyond the idea stage.
3. `sotto-even-component-reuse.pdf` — Component reuse inventory from the prior `even-memory-bridge` project. Five-element matrix (audio listening, intent classification, corpus retrieval, HUD render, privacy UX) with reuse difficulty and effort estimates. Backs the 60–70% reuse claim with specific file-level evidence.
4. `sotto-hud-overview.png` — DP4 emulator screenshot of the Compose Glimmer three-zone mock HUD running on Android XR Headset (Google Play XR API 34, 2560×2558). Engineer-specific layout (summary list / inline code / architecture diagram). Completed 2026-MM-DD (T6).
5. (optional) `sotto-architecture.png` — Architecture diagram exported from spec section 4.

**日本語 reference:**

添付 (最大 5 / 各 100 MB):
1. `sotto-design.pdf`: 設計 spec PDF (~590 行 / 11 section、 architecture / data flow / privacy / error / test / 応募 narrative)
2. `sotto-catalyst-application.pdf`: 実装 plan PDF (T1-T10、 execution readiness 証拠)
3. `sotto-even-component-reuse.pdf`: Even repo 流用 component リスト PDF (5 要素マトリックス、 流用率 60-70% を file-level evidence で backup)
4. `sotto-hud-overview.png`: DP4 emulator screenshot (engineer 用 3 zone mock HUD)
5. (任意) `sotto-architecture.png`: spec § 4 architecture diagram

PDF 化作業: T9 (提出 24-48h 前) で pandoc 実行。 PNG: T6 (PoC 改修) 完了後。

**根拠:**

form-structure-2026.md Page 3「Upload supporting files」(任意・最大 5 / 各 100 MB)。 Spice Sutra と比較し、 sotto-even-component-reuse.pdf を 3 枠目に追加 (Sotto の Funding articulation で「流用率 60-70%」 主張の根拠 doc として form 内引用可能)。 これが Sotto pitch の重要な differentiator (Spice Sutra にはない強み)。

---

## § Category

**English (form 提出用、 multi-select 3 つ):**

☑ Productivity
☑ Enterprise
☑ Education

Rationale (for reference, not a form field):
- **Productivity** — Primary. Real-time technical context retrieval during conversations directly reduces the cognitive overhead of recalling past decisions, design rationale, and architecture choices.
- **Enterprise** — Engineers, tech founders, and technical leaders operate in enterprise contexts (client meetings, code reviews, architecture discussions, 1:1 mentoring). The retrieval workflow fits enterprise knowledge-management needs while keeping data inside the user's own Google Cloud project (no shared SaaS dependency).
- **Education** — Junior engineers in standups, code reviews, and onboarding sessions benefit from real-time terminology and context support without interrupting senior peers. Each retrieval session builds tacit understanding of team-specific patterns and decision history.

**日本語 reference:**

Category: ☑ Productivity + ☑ Enterprise + ☑ Education

根拠:
- Productivity (主軸): 会話中の technical context retrieval = 過去決定 / 設計理由 / architecture 選択を思い出す認知負荷を直接削減
- Enterprise: engineer / tech founder / 技術 leader は enterprise context (client meeting / code review / architecture 議論 / 1:1 mentoring) で運用、 retrieval workflow が enterprise knowledge management 需要に fit、 data は user 個人 Google Cloud に留まる (shared SaaS 依存なし)
- Education: junior engineer の standup / code review / onboarding で先輩を遮らずに用語 + context を real-time 補助、 各 retrieval session が team 固有 pattern + 決定履歴の tacit 理解を蓄積

**根拠:**

form-structure-2026.md Page 3「Category」(必須・複数選択)、 Sotto 適用差分 section の判断。 Spice Sutra から Health & Wellness を外し、 Enterprise を追加。 Productivity 主軸 + Enterprise + Education の 3 つで、 個人 indie 1 人でも「enterprise 文脈に届く」 narrative を構築 (個人 Google Cloud で完結する設計が enterprise compatible)。

---

## § Existing Port

**English (form 提出用):**

N/A — new development. Sotto is not a port of an existing app. However, the architecture and approximately 60–70% of the MVP backbone are derived from the prior `even-memory-bridge` project (frozen public repository on GitHub), which validated the retrieval pipeline, masking layer, and HUD state machine on EVEN Realities G2 hardware over approximately five months of dogfood. Sotto on Aura is the natural progression — taking proven components from an audio-only HUD context and extending them with visual capabilities (inline code, multi-line lists, diagrams) that the G2 hardware physically cannot render.

**日本語 reference:**

N/A (新規開発)。 ただし architecture + MVP backbone 60-70% が前 PJ `even-memory-bridge` (frozen 公開) から派生、 retrieval pipeline / masking / HUD state machine を G2 hardware 上で 5 ヶ月 dogfood 検証済。 Sotto on Aura は audio only HUD context で証明された component を G2 hardware が物理的に出せない visual (inline code / multi-line list / diagram) で拡張する natural progression。

**根拠:**

form-structure-2026.md Page 3「Existing port link」(任意・短文)、 Spice Sutra と同じ N/A、 ただし Sotto では prior project 関係を明示 (port ではなく「derived natural progression」 表現で Existing port 質問の意図を尊重しつつ、 Even repo 流用 evidence をここでも軽く埋め込む)。

---

## § Development Progress

**English (form 提出用、 0-10 scale):**

**2**

(Design specification complete — architecture, data flow, component boundaries, privacy design, error handling, test strategy. Mock HUD PoC complete on DP4: Compose Glimmer three-zone engineer-specific layout (summary list / inline code / architecture diagram) verified on Android XR Headset emulator (Google Play XR API 34, 2560×2558). Reusable components from prior project `even-memory-bridge` (frozen public repository) already exist as working Python and TypeScript code: hybrid RAG pipeline with cosine 0.7 + BM25 + LLM rerank, masking layer, embedding/chunking, intent classification. See `poc-screenshots/sotto-hud-overview.png`, `poc-notes.md`, and attached component reuse document. Kotlin porting and Aura SDK integration begin after acceptance.)

**日本語 reference:**

2

(設計 spec 完了 — architecture / data flow / components / privacy / error / test。 Mock HUD PoC 完了 on DP4: engineer 用 3 zone (summary list / inline code / architecture diagram) を Android XR Headset emulator で動作確認。 前 PJ `even-memory-bridge` (frozen 公開) から流用可能な component が Python / TypeScript 動作品として存在: hybrid RAG (cosine 0.7 + BM25 + LLM rerank) / masking / embedding / chunking / intent classification。 添付 component reuse doc 参照。 Kotlin 移植 + Aura SDK 統合は採択後着手。)

**根拠:**

form-structure-2026.md Page 3「Development progress」(必須・0-10 scale)。 Spice Sutra と同じ 2、 ただし根拠が「design + cooking PoC」 から「design + engineer PoC + Even RAG 完成品所持」 に変化。 score 2 維持で控えめ姿勢 (採用率 up)、 ただし根拠は厚い (Even repo 完成品があることで「即実装着手可」 を暗示)。

---

## § Target Launch Regions

**English (form 提出用、 multi-select):**

☑ Global

Engineers and tech founders working with technical context (design docs, code, decisions) exist in every geography. The retrieval workflow is language-agnostic at the architecture level; the MVP supports Japanese and English personal corpora, with additional language packs planned for post-MVP. Restricting to JAPAC would unnecessarily limit the audience for a globally distributed user need.

**日本語 reference:**

☑ Global

engineer / tech founder の technical context (design doc / code / 決定) は全 geography に存在。 retrieval workflow は architecture level で言語不可知、 MVP は日 + 英 corpus 対応、 追加言語 pack は post-MVP 計画。 JAPAC 限定は globally distributed user need の audience を不必要に制限。

**根拠:**

form-structure-2026.md Page 3「Target Launch Regions」(必須・複数選択)、 Spice Sutra と同じ Global。 narrative は cooking diaspora → globally distributed engineer に変更。

---

## § Estimated Launch Date

**English (form 提出用、 日付):**

**2027-04-30**

Nine-month timeline from hardware kit receipt (estimated 2026-08) through DP4 prototype, Even component porting (Python/TypeScript → Kotlin), intent classification + retrieval pipeline integration, real-device alpha, beta dogfood with two friend engineers, and Google Play submission. Detailed milestone schedule is in the attached plan document.

**日本語 reference:**

2027-04-30

採択判明 2026-07-15 → HW kit 受領 2026-08 → DP4 prototype → Even component 移植 (Python/TypeScript → Kotlin) → intent classification + retrieval pipeline 統合 → 実機 alpha → 友人 engineer 2 名 dogfood → Play 提出。 詳細 milestone は添付 plan 参照。

**根拠:**

form-structure-2026.md Page 3「Estimated launch date」(必須・日付)、 Spice Sutra と同じ 2027-04-30 (9 ヶ月 window 同じ、 Even component 移植が早期段階の core path に組込まれる前提)。

---

## § Hardware Form Factor

**English (form 提出用、 単一選択):**

☑ Display & Audio glasses

Rationale: Sotto's three core capabilities — heads-up display for the three-zone retrieval HUD, periodic microphone capture for question detection, and quiet audio cues for high-priority retrievals — map directly to the Display & Audio glasses hardware profile (display + microphone + speakers). The production form factor and the development target are the same device class, meaning the app ships without porting overhead.

Wired XR glasses (Project Aura) were not selected for a specific social reason: the primary use cases for Sotto are technical conversations (client meetings, code reviews, 1:1 mentoring, technical sales discussions). These contexts require that the device on the user's face be socially acceptable — close to the form factor of consumer eyewear, no tether, no immersive enclosure. A wired XR headset breaks this constraint. The Display & Audio glasses form factor is the only viable option for the target use case.

An immersive wired XR version of Sotto — with richer spatial context layout for solo focus sessions (deep code review, architecture brainstorming) — is a plausible future application, but out of scope for this submission.

**日本語 reference:**

☑ Display & Audio glasses

根拠: Sotto の 3 core capability (3 zone retrieval HUD / 質問検知 mic capture / 高優先度 retrieval の sotto voce audio cue) が Display & Audio glasses hardware (display + mic + speaker) に直接 map。 production form factor と development target が同じ device class、 porting overhead なく ship 可能。

Wired XR glasses (Project Aura) 非選択の理由 — social acceptability。 Sotto の primary use case は技術会話 (client meeting / code review / 1:1 mentoring / 技術商談)、 user の顔上 device が consumer eyewear に近い form factor で no tether / no immersive enclosure であることが要件。 Wired XR headset は破壊する。 Display & Audio glasses が唯一の viable option。

Immersive wired XR 版 (solo focus session 用、 deep code review / architecture brainstorming) は plausible future app だが本応募 scope 外。

**根拠:**

form-structure-2026.md Page 3「Hardware form factor」(必須・単一選択)、 Spice Sutra と同じ Display & Audio glasses。 rationale が cooking の hands-free 必要性 → 商談 social fit に変化、 同 form factor を選ぶ 2 つの異なる理由が両 PJ で偶然一致する好例。

---

## § Grant Amount

**English (form 提出用、 単一選択):**

☑ No grant required

The MVP scope — engineer-specific question retrieval HUD with hybrid RAG over the user's personal corpus — reuses approximately 60–70% of components from the prior project `even-memory-bridge` (frozen, public on GitHub): hybrid RAG pipeline (cosine 0.7 + BM25 + LLM rerank), masking layer, embedding and chunking utilities, intent classification framework, and HUD state machine patterns. See the attached component reuse document for the full file-level inventory. This reuse reduces the new-code surface area to Kotlin porting plus Aura SDK integration plus engineer-specific layer additions (inline code rendering, architecture diagram thumbnail) — work that is well within a nine-month solo timeline.

Estimated operational cost for development and initial production use — covering STT API (OpenAI Whisper), Gemini multimodal LLM via Vertex AI, and Vertex AI Vector Search for the personal corpus — is approximately USD 700–1,750 per year (approximately 100,000–250,000 JPY) for a solo developer running personal usage volumes. This is within personal budget for an indie project.

I am applying for hardware kit access and technical resources. Those are the inputs that cannot be replicated independently: early access to Display & Audio glasses hardware before consumer release, and direct technical guidance during SDK integration. Grant funding is not necessary to reach the Play Store milestone given the reuse leverage.

**日本語 reference:**

☑ No grant required

MVP scope は前 PJ `even-memory-bridge` から component 60-70% 流用: hybrid RAG (cosine 0.7 + BM25 + LLM rerank) / masking / embedding + chunking / intent classification / HUD state machine。 添付 component reuse doc で file-level inventory 提示。 新規 code surface は Kotlin 移植 + Aura SDK 統合 + engineer 特化 layer 追加 (inline code render / architecture diagram thumbnail) に限定、 9 ヶ月 solo timeline に well within。

operational cost 試算 (development + 初期 production、 STT API (OpenAI Whisper) + Gemini multimodal LLM via Vertex AI + Vertex AI Vector Search): solo dev の personal usage volume で年 USD 700-1,750 (~10-25 万円)、 indie project の personal budget 範囲内。

応募対象は HW kit access + technical resources、 これらは独自に replicate 不可: Display & Audio glasses HW の consumer release 前 early access + SDK 統合中の direct technical guidance。 reuse leverage により Play Store milestone 到達に grant funding 不要。

**根拠:**

form-structure-2026.md Page 4「Grant amount」(必須・単一選択)、 Spice Sutra と同じ No grant required。 narrative 強化 2 点: (1) Even repo 流用率 60-70% を冒頭 sentence で前面化、 添付 doc 引用で realistic backup、 (2) cost 試算を Sotto stack (STT + Gemini + Vector Search) で update (Spice Sutra: 5-15 万円 → Sotto: 10-25 万円)。 "Limited grants at each level exist" 文言を意識した控えめ姿勢で採用率 up を狙う。

---

## § Acknowledgements

**English (form 提出用、 2 checkbox 必須):**

☑ I understand that if selected, my team will be required to sign standard digital agreements.
☑ I understand that funding is milestone-based.

(Both checkboxes to be checked at time of form submission.)

**日本語 reference:**

両 checkbox を提出時に check。

**根拠:**

form-structure-2026.md Page 4「Program Acknowledgements」(必須・2 checkbox)。 form 標準項目、 内容変更不可。

---

## 関連

- 設計 spec (本 outline の根拠): `../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- Even repo 流用 component リスト (添付 #3 の source): `../../docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`
- 実装 plan: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- form 構造 + Sotto 差分: `form-structure-2026.md`
- 前身 outline (deprecated): `pitch-outline.md`
- form-final-draft 集約 (T8 で作成): `form-final-draft-sotto.md` (未作成)
- 個人情報 (T4 で改訂): `personal-readiness.md` (Sotto 用改訂未実施)
