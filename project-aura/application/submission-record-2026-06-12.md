# Catalyst Form 提出記録 (2026-06-12)

> **T10 完了**。 公式 form を `iharayuhta@gmail.com` で提出、 「回答を記録しました。」 確認済。
> 証跡: `portfolio-prep-screenshots/sotto-submission-confirm-2026-06-12.png`
> 締切 2026-06-30 の 18 日前に前倒し提出 (当初 schedule は 6-29〜30)。 結果通知 2026-07-15 まで。

## 提出内容の出典

- Page 1 (Company/Contact) / Page 2 (XR journey) / Page 3 (App) / Grant+Ack: `form-final-draft-sotto.md` の確定原稿どおり (2026-06-12 の pinned 表現同期修正を反映済)
- 住所: [REDACTED] 方針どおり form に直接入力のみ、 repo には残さない
- 添付: `sotto-design.pdf` (21p) + `sotto-even-component-reuse.pdf` (9p)。 pandoc 3.9 + typst (`-V mainfont="Yu Gothic"`) で当日生成、 禁止語 grep ゼロ + 日本語 glyph 描画確認済。 optional の architecture png は非添付 (時間優先、 PDF 内 § 4 図で代替)
- **新セクション (use cases & stack rank) は原稿が無く当日新規作成** — verbatim を下記に記録

## 原稿からの当日差分 (微修正)

- Previous development experience: G2 使用期間 「roughly two to three months」 → 「roughly three months」 (2026-03 開始、 提出時点の実態に合わせ更新)
- portfolio 段落 / Existing apps: pinned 2 個 + README link 構成 (同日の同期修正版)

## 新セクション回答 (verbatim、 原稿外)

### [Use Case #1] description (rank 1、 Display glasses、 Required for launch、 capability: Audio + UI framework + Notifications)

> Real-time retrieval of the user's own past technical context during live conversations (code reviews, client meetings, technical 1:1s).
>
> Example flow: a mid-career engineer is in a code review. A colleague asks "why did you choose event-sourcing here instead of CRUD?" — a decision made months ago. The glasses' microphone captures the question; an intent classifier recognizes it as a technical retrieval request; a hybrid RAG pipeline (cosine similarity + BM25 + LLM rerank) searches the user's personal corpus (design docs, PR comments, decision logs); and the relevant past context renders in the user's field of view as a three-zone HUD: (1) a summary list of the relevant past decisions, (2) an inline code snippet with syntax highlighting, (3) an architecture diagram thumbnail. End-to-end latency target is 3-5 seconds, so the context arrives while the question is still in the air. The user answers in their own voice, with their own authority — the phone stays in the pocket, and the other party sees no device interaction.
>
> Privacy is built in: recordings are ephemeral (rolling buffer, no disk persistence), a masking layer scrubs personally identifiable information and client-specific identifiers before any text reaches the LLM, and the retrieval HUD is visible only to the wearer. The personal corpus stays inside the user's own Google Cloud project.

### [Use Case #1] success monitoring

> Primary metric: "credible answer without device interaction" — the share of detected technical questions where the user answers without touching a phone. Supporting metrics: weekly active retrieval sessions, retrieval precision (was the surfaced context the right one — lightweight thumbs up/down on the HUD), end-to-end latency at or under 5 seconds, and dogfood volume (I am the primary user persona: 20+ live sessions before beta, then a 2-engineer external beta before Play submission).

### [Use Case #1] capabilities 必要理由

> Audio (microphone & speakers): microphone capture is the trigger for the entire pipeline — a periodic capture feeds an ephemeral rolling buffer (no disk persistence) for question detection and intent classification. Speakers deliver quiet audio cues when a high-confidence retrieval is ready, so the user does not need to glance away mid-sentence. UI framework: the three-zone HUD (summary list, inline code snippet with syntax highlighting, architecture diagram thumbnail) is the core differentiator versus audio-only glasses; it is built on Jetpack Compose Glimmer using Stacks and Title Chips. Notifications: low-intrusion signaling when retrieval results arrive — the product is named after "sotto voce" because it whispers rather than interrupts. Camera access is intentionally not required: Sotto's privacy posture excludes any visual recording of other people.

### [Use Case #2] description (rank 2、 Display glasses、 Future-looking 2+ years、 capability: Audio + UI framework + Notifications)

> The same retrieval HUD tuned for non-engineer tech founders and executives in technical sales, vendor, and due-diligence conversations.
>
> Example flow: a non-engineer CEO of a tech company is in an investor due-diligence meeting. A technical question lands — "what was the rationale for your multi-tenant architecture?". Sotto retrieves the CTO's design memo and the relevant decision log from the company's decision corpus, and renders a plain-language summary list plus the key architecture diagram in the wearer's field of view. The founder responds credibly without deferring the question or pulling out a device.
>
> Compared to use case #1, this variant emphasizes plain-language summarization over code rendering, and adds inline vocabulary support (term definitions surfaced when jargon is detected). The underlying pipeline — capture, classify, retrieve, render — is identical to use case #1, with a different corpus and summarization style. This is the commercial-expansion persona that follows the engineer-first MVP.

### [Use Case #2] success monitoring

> Same instrumentation as use case #1 (answer-without-device rate, retrieval precision, latency), segmented by persona. Additional metric for this variant: vocabulary-assist engagement — how often inline term definitions are surfaced and acknowledged during a session.

### [Use Case #2] capabilities 必要理由

> Same capability set as use case #1: microphone capture for question detection (ephemeral rolling buffer, no disk persistence), Compose-based HUD rendering for the summary list and diagram thumbnail, and low-intrusion notification cues. Camera access is again intentionally not required. The variant differs in software — summarization style, corpus, and vocabulary assist — not in required hardware capabilities.

### Stack Rank

| Use Case | Rank |
|---|---|
| #1 (engineer retrieval HUD) | 1 (most important) |
| #2 (founder/executive variant) | 2 |
| #3-#5 | N/A |

### Grant + Acknowledgements

- Grant amount: **No grant required**
- Acknowledgements: 2 checkbox とも ☑

## 採択後に効く注意点

- UC#1 priority は「Required for launch- H1 2026」 を選択 (選択肢が platform launch 基準の文言。 Sotto 自体の launch は 2027-04-30 で form Page 3 に記載済、 矛盾ではなく「この use case が MVP の核」 の意)
- UC 回答で **Camera access 不要を明示的に宣言** (privacy posture)。 採択後の機能拡張で camera を使う場合はこの宣言との整合に注意
- 結果通知: 2026-07-15 まで。 通知 channel は `iharayuhta@gmail.com`

## 関連

- form 構造 + 2026-06-12 差分: `form-structure-2026.md`
- 提出原稿: `form-final-draft-sotto.md`
- 添付 PDF 源: `../../docs/superpowers/specs/2026-05-23-sotto-design.md` / `2026-05-23-sotto-even-component-reuse.md`
