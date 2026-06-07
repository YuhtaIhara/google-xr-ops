# Sotto — Catalyst Form Final Draft (2026-05-26 確定)

> form 提出原稿 (Sotto 版)。 提出日 (2026-06-30) に user が各 field に copy-paste するだけの形。
> `form-structure-2026.md` の 4 page 順序に沿って並べる。
> 住所のみ意図的 [REDACTED]、 user が form 入力時に直接記入 (session 内で英訳済、 別途管理)。
> 提出 account: `iharayuhta@gmail.com`
>
> 前身 `form-final-draft.md` (Spice Sutra 版、 2026-05-22 確定) は historical 保持、 本 doc が Sotto 用 current。
> review-log-sotto.md の I-1 (elevator pitch 短縮) + I-2 (long sentence 分割) を反映。

---

## Page 1: Company / Contact / Region

### Company Name *

Yuhta Ihara

### Company website

https://github.com/YuhtaIhara

### Primary Contact Name *

Yuhta Ihara

### Primary Contact Email *

iharayuhta@gmail.com

### Job title *

Indie Developer

### Region *

☑ APAC

### Country *

Japan

### Company Address *

[REDACTED — 個人住所、 user が form 提出時に直接入力。 session 内英訳済、 別途管理]

---

## Page 2: Understanding XR Development Journey

### Previous Development Experience * (long-form)

Solo indie developer based in Japan. I build and ship software independently — design, implementation, and QA all sit with me, with no co-founders or team. I work daily across multiple client projects and personal initiatives, and the cognitive cost of context-switching between them is the personal pain that motivated this application.

My hands-on time with Kotlin and Android-adjacent technologies is under a year. I am applying with the explicit plan to use the nine-month post-acceptance window to ramp up on Jetpack XR SDK (DP4 → Beta) and Gemini multimodal APIs while porting and extending my prior conversational HUD work into a production Android XR release.

Two factors are the leverage I bring against limited language experience. First, the depth of design work already completed (see attached spec). Second, the maturity of the reusable components from my prior project: approximately 60–70% of the MVP backbone — RAG pipeline, masking layer, intent classification, HUD state machine — already exists as battle-tested Python and TypeScript code (see attached component reuse document).

On the XR side: I have been a daily user of EVEN Realities G2 display glasses since March 2026 — roughly two to three months of hands-on time with a heads-up display in real-world contexts, primarily Conversate (G2's flagship conversational HUD use case). Prior to that, I built and dogfooded `even-memory-bridge` (now frozen, public on GitHub), a personal XR HUD + life-log + retrieval experiment on the same G2 hardware, for approximately five months. That project taught me where audio-only HUDs work and where they reach physical limits — the G2 cannot render code snippets, decision logs as visual lists, or architecture diagrams. Sotto on Aura is the natural progression: take the engineer-specific retrieval pipeline I already built, and render it as visual context the G2 hardware never could.

On portfolio: I have not published a production app on Google Play. My open work is on github.com/YuhtaIhara — pinned public repositories include `even-memory-bridge` (the prior XR HUD experiment that informs Sotto's architecture), `google-xr-ops` (this submission's design and application work), `ai-driven-template` (workflow baseline patterns), and SharePoint RAG implementations (Azure design / pgvector + FastAPI). Pinned repositories reflect a working approach: solid design specs, clean structure, solo-maintainable scope, and visible dogfood evidence.

Domain expertise: I am the primary user persona for Sotto. As a mid-career indie engineer running multiple parallel projects, I weekly hit the moment where someone asks "why did you choose X?" about a months-old decision and I cannot recall the reasoning fast enough to answer credibly. That is not a researched insight — it is my Tuesday afternoon. I am the dogfooder, and that is the reason I trust the premise enough to spend nine months on it.

### Existing Apps (links, optional)

Portfolio: github.com/YuhtaIhara. Solo indie portfolio on GitHub. No published production app on Google Play to date — Sotto is the first Play-targeted release. Pinned public repositories (in order of relevance to this application):

- `even-memory-bridge` — frozen prior project. Personal XR HUD + life-log + retrieval experiment on EVEN Realities G2 audio glasses. Five months of dogfood. Contains the RAG pipeline, embedding/chunking, masking layer, and HUD state machine that Sotto reuses (60–70% of the MVP backbone, see attached component reuse document).
- `google-xr-ops` — this submission's design specification, Catalyst application plan, and Even component reuse inventory.
- `ai-driven-template` — a workflow baseline starter (`.claude/` configuration patterns) reflecting solo-maintainable development practices.
- `sharepoint-rag-azure` — Azure RAG PoC with design docs, IaC, and architecture diagrams.
- `sharepoint-rag-lite` — SharePoint RAG implementation with pgvector + FastAPI + ACL.

### Tech Stack * (multi-select)

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

### Unity-specific fields

N/A — Compose-based stack, no Unity dependency.

- Unity version: N/A
- Unity render pipeline: N/A
- Graphics API: N/A (Compose 経由)

### Opt-in Android XR dev updates *

☑ Yes

---

## Page 3: Tell Us About Your App

### Elevator Pitch * (long-form)

Engineers and tech founders carry too much technical context to recall on demand. Mid-conversation, when asked "why did you choose X over Y?" or "what was the trade-off in that architecture?", they fumble — not because they don't know, but because the past decision is buried in design docs, PR comments, and decision logs they wrote months ago. Phone lookup is socially impossible in a serious meeting; AI on a phone signals weakness.

Sotto captures the question via the glasses' microphone, classifies it as a technical retrieval request, runs hybrid RAG over the user's personal corpus, and renders the relevant past context — code snippets, decision logs, architecture diagrams — directly in the user's field of view. The user answers in their own voice, with their own authority. The phone stays in the pocket. The other party sees no device, no glance away, no hesitation.

The architecture is purpose-built for the Display & Audio glasses form factor: a three-zone HUD (summary list of relevant past decisions, inline code snippet with syntax highlighting, architecture diagram thumbnail) that no audio-only glasses platform can render. The personal corpus stays inside the user's own Google Cloud project. Recordings are ephemeral with no disk persistence. A masking layer scrubs personally identifiable information and client-specific identifiers before any text reaches the LLM. The brand name itself — *sotto voce*, "in a soft voice" — signals the product's design ethic: the AI whispers, never interrupts, and the user remains the answerer.

This combination does not exist on any XR platform today. The MVP scope reuses approximately 60–70% of a battle-tested prior project (see attached component reuse document), making a nine-month solo path to Google Play credible.

### Upload Supporting Files (max 5 / 100 MB each)

(form 提出時に下記 Attachments セクションのファイルを user が選択 upload)

1. `sotto-design.pdf`
2. `sotto-even-component-reuse.pdf`
3. (optional) `sotto-architecture.png`

### Category * (multi-select)

☑ Productivity
☑ Enterprise
☑ Education

### Existing Port Link (optional)

N/A — new development. Sotto is not a port of an existing app. However, the architecture and approximately 60–70% of the MVP backbone are derived from the prior `even-memory-bridge` project (frozen public repository on GitHub), which validated the retrieval pipeline, masking layer, and HUD state machine on EVEN Realities G2 hardware over approximately five months of dogfood. Sotto on Aura is the natural progression — taking proven components from an audio-only HUD context and extending them with visual capabilities (inline code, multi-line lists, diagrams) that the G2 hardware physically cannot render.

### Development Progress * (0-10)

**2**

Design specification complete — architecture, data flow, component boundaries, privacy design, error handling, test strategy. Mock HUD PoC implemented on the official DP4 sample base: Compose three-zone engineer-specific layout (summary list / inline code / architecture diagram), built and deployed to the Android XR emulator (Google Play XR API 34). Reusable components from prior project `even-memory-bridge` (frozen public repository) already exist as working Python and TypeScript code: hybrid RAG pipeline with cosine 0.7 + BM25 + LLM rerank, masking layer, embedding/chunking, intent classification. See the attached component reuse document. Kotlin porting and Aura SDK integration begin after acceptance.

### Target Launch Regions * (multi-select)

☑ Global

Engineers and tech founders working with technical context (design docs, code, decisions) exist in every geography. The retrieval workflow is language-agnostic at the architecture level; the MVP supports Japanese and English personal corpora, with additional language packs planned for post-MVP. Restricting to JAPAC would unnecessarily limit the audience for a globally distributed user need.

### Estimated Launch Date *

**2027-04-30**

Nine-month timeline from hardware kit receipt (estimated 2026-08) through DP4 prototype, Even component porting (Python/TypeScript → Kotlin), intent classification + retrieval pipeline integration, real-device alpha, beta dogfood with two friend engineers, and Google Play submission.

### Hardware Form Factor *

☑ Display & Audio glasses

Rationale: Sotto's three core capabilities — heads-up display for the three-zone retrieval HUD, periodic microphone capture for question detection, and quiet audio cues for high-priority retrievals — map directly to the Display & Audio glasses hardware profile (display + microphone + speakers). The production form factor and the development target are the same device class, meaning the app ships without porting overhead.

Wired XR glasses (Project Aura) were not selected for a specific social reason: the primary use cases for Sotto are technical conversations (client meetings, code reviews, 1:1 mentoring, technical sales discussions). These contexts require that the device on the user's face be socially acceptable — close to the form factor of consumer eyewear, no tether, no immersive enclosure. A wired XR headset breaks this constraint. The Display & Audio glasses form factor is the only viable option for the target use case.

An immersive wired XR version of Sotto — with richer spatial context layout for solo focus sessions (deep code review, architecture brainstorming) — is a plausible future application, but out of scope for this submission.

---

## Page 4: Glasses Innovation Grant + Acknowledgements

### Grant Amount *

☑ No grant required

The MVP scope — engineer-specific question retrieval HUD with hybrid RAG over the user's personal corpus — reuses approximately 60–70% of components from the prior project `even-memory-bridge` (frozen, public on GitHub): hybrid RAG pipeline (cosine 0.7 + BM25 + LLM rerank), masking layer, embedding and chunking utilities, intent classification framework, and HUD state machine patterns. See the attached component reuse document for the full file-level inventory. This reuse reduces the new-code surface area to Kotlin porting plus Aura SDK integration plus engineer-specific layer additions (inline code rendering, architecture diagram thumbnail) — work that is well within a nine-month solo timeline.

Estimated operational cost for development and initial production use — covering STT API (OpenAI Whisper), Gemini multimodal LLM via Vertex AI, and Vertex AI Vector Search for the personal corpus — is approximately USD 700–1,750 per year (approximately 100,000–250,000 JPY) for a solo developer running personal usage volumes. This is within personal budget for an indie project.

I am applying for hardware kit access and technical resources. Those are the inputs that cannot be replicated independently: early access to Display & Audio glasses hardware before consumer release, and direct technical guidance during SDK integration. Grant funding is not necessary to reach the Play Store milestone given the reuse leverage.

### Program Acknowledgements *

☑ I understand that if selected, my team will be required to sign standard digital agreements.
☑ I understand that funding is milestone-based.

(両 checkbox を提出時に check。)

---

## Attachments (form Page 3 Upload supporting files、 最大 5 / 各 100MB)

| # | ファイル名 | 内容 | 準備状況 |
|---|---|---|---|
| 1 | `sotto-design.pdf` | 設計 spec PDF (`docs/superpowers/specs/2026-05-23-sotto-design.md` から pandoc 生成、 11 section / ~590 行) | 要 PDF 化 (T9 提出 24-48h 前 pandoc 実行) |
| 2 | `sotto-even-component-reuse.pdf` | Even repo 流用 component リスト PDF (`docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`、 5 要素マトリックス + file-level inventory) | 要 PDF 化 (T9) |
| 3 | (optional) `sotto-architecture.png` | spec § 4 architecture diagram 画像 export | 任意、 T9 で時間に余裕あれば |

> `sotto-hud-overview.png` (emulator screenshot) は**添付しない判断** (2026-06-06): 作業機 (iGPU) では XR emulator の scene 描画がハードウェア未サポートで不可 (`poc-setup-guide-sotto.md` §11 に記録)。 PoC は DP4 sample base への実装 + XR emulator への build / deploy まで完了しており、 form 本文はその範囲のみ主張する文言に整合済。 dGPU 機材が用意できた場合は buffer 期間 (6-15〜22) に撮影して添付 + 本文再強化に戻してよい。

> 内部実装 plan (`docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`) は**意図的に添付しない** (T1-T10 は応募作業の内部 PM task であり、 reviewer-facing 価値が薄く、 内部過程を露出するデメリットが上回る判断。 2026-06-04)。

PDF 化作業: T9 (提出 24-48h 前) で pandoc 実行。 toolchain は 2026-06-07 検証済 (pandoc 3.9 + `--pdf-engine=typst`、 両 doc の試し変換成功。 日本語 glyph は user 目視確認)。

PDF 内 AI 痕跡 chk: 「Claude」 「AI 駆動」 等の主体表現が混入しないことを T9 で grep 確認 (CLAUDE.md project rule)。

---

## 最終 self-check (Sotto、 T9 提出 24-48h 前で再確認)

- [ ] 全項目に値が入っている (TBD / TODO がない、 住所のみ意図的 [REDACTED])
- [ ] 文字数全項目 OK
  - Elevator Pitch: 279 words (target 280-310、 review-log-sotto.md I-1 の短縮反映後の実測。 lower bound から 1 word 下振れ、 form の hard limit 不明だが密度高く実害なしと判断)
  - Previous Development Experience: long-form section、 6 paragraph (review-log-sotto.md I-2 の long sentence 分割を反映済)
- [ ] AI 主体表現がない (grep `AI 駆動\|Claude が\|AI-assisted\|AI-driven` → ゼロ確認)
- [ ] portfolio URL 動作 (https://github.com/YuhtaIhara)、 pinned 5 個 + profile README が live
- [ ] 添付ファイル PDF 準備
  - sotto-design.pdf / sotto-even-component-reuse.pdf: T9 で pandoc 実行 (内部 plan は意図的に非添付)
  - sotto-hud-overview.png は非添付判断 (2026-06-06、 添付表の注記参照)
- [ ] Spice Sutra 残骸ゼロ確認 (form 内で `spice\|sutra\|cooking\|recipe\|curry\|tempering\|cumin\|Indian` 単語 zero 確認、 grep で実行)
- [ ] 提出 account が `iharayuhta@gmail.com`
- [ ] T5 manual step 完了 (profile README Sotto 反映 push + before/after screenshot)
- [ ] T6 は PoC 実装 + XR emulator deploy まで完了扱い (screenshot 非添付判断 2026-06-06。 dGPU 機材が用意できた場合のみ buffer 期間に撮影 → 添付 + 本文再強化)
- [ ] Acknowledgements 2 checkbox 提出時 check 意思確認

---

## 関連

- form 構造: `form-structure-2026.md`
- pitch outline (英文 draft + 日本語 reference + 根拠の 3 重 doc): `pitch-outline-sotto.md`
- 個人情報 single source: `personal-readiness.md`
- portfolio prep + manual step tracker: `portfolio-prep.md`
- self-review (review-log-sotto.md の I-1 / I-2 を本 doc に反映済): `review-log-sotto.md`
- 設計 spec: `../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- Even repo 流用 component リスト: `../../docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`
- 実装 plan: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- Spice Sutra 期 form-final-draft (historical 保持): `form-final-draft.md`
