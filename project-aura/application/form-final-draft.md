# Spice Sutra — Catalyst Form Final Draft (2026-05-22 確定)

> form 提出原稿。 提出日 (2026-06-30) に user が各 field に copy-paste するだけの形。
> form-structure-2026.md の 4 page 順序に沿って並べる。
> 住所のみ意図的 [REDACTED]、 user が form 入力時に直接記入 (session 内で英訳済、 別途管理)。
> 提出 account: iharayuhta@gmail.com

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

Solo indie developer based in Japan. I build and ship software independently — design, implementation, and QA all sit with me, with no co-founders or team.

My hands-on time with Kotlin and Android-adjacent technologies is under a year. I am applying to this program with the explicit plan to use the nine-month post-acceptance window to ramp up on Jetpack XR SDK (DP4 → Beta) and Gemini multimodal APIs while building Spice Sutra as my first Android XR release. While my hands-on Kotlin/Android time is under a year, the depth of design preparation — an 11-section design specification and a 10-task implementation plan, both attached — demonstrates the leverage I bring against limited language experience.

On the XR side: I have been a daily user of EVEN Realities G2 display glasses since March 2026 — roughly two to three months of hands-on time with a heads-up display in real-world contexts, primarily Conversate (G2's flagship conversational HUD use case). That daily friction taught me where HUD UX works and where it breaks down. The G2 has no camera, which means recipe display is possible but step-advance and visual confirmation are not. That gap is exactly what Spice Sutra addresses.

On portfolio: I have not published a production app on Google Play. My open work is on github.com/YuhtaIhara — public repositories include SharePoint RAG (Azure design / pgvector + FastAPI implementation), and the Spice Sutra design itself is hosted in `google-xr-ops`. Pinned repositories reflect a working approach of solid design specs, clean structure, and solo-maintainable scope.

Domain expertise: I cook Indian and spice-based cuisine at home regularly. I have personally experienced the parallel-cooking, wet-hands, spice-residue problem that Spice Sutra solves. I am the primary dogfooder. That is not a talking point — it is the reason I trust the premise enough to spend nine months on it.

Internal milestones (for reviewer context; detailed schedule in the attached plan):
- 2026-08: Aura HW kit receipt + spice-sutra repo bootstrap
- 2026-12: Real-device alpha (Phase 1 recipe capture + Phase 2 parallel timeline, dogfood starts)
- 2027-03: Beta, friend dogfood with 3 participants
- 2027-04-30: Google Play release (MVP: 5 Indian recipes — curry, dal, sabzi, roti, rice)

### Existing Apps (links, optional)

Portfolio: github.com/YuhtaIhara. Solo indie portfolio on GitHub. No published production app on Google Play to date — Spice Sutra is the first Play-targeted release. Public repositories include:

- `google-xr-ops` — the Spice Sutra design specification and Catalyst application plan (this submission's source)
- `ai-driven-template` — a Claude Code workflow baseline (`.claude/rules` + hooks + settings patterns)
- `sharepoint-rag-azure` — Azure RAG PoC with design docs, IaC, and diagrams
- `sharepoint-rag-lite` — SharePoint RAG with pgvector + FastAPI + ACL

### Tech Stack * (multi-select)

☑ Android with Compose

Details (for supporting context):
- Language / runtime: Kotlin + Jetpack XR SDK (Developer Preview 4, targeting Beta)
- UI: Jetpack Compose Glimmer
- Scene / camera: Jetpack SceneCore (periodic single-frame capture)
- Multimodal AI: Gemini 2.x via Vertex AI (or Gemini Direct API)
- Auth: Google OAuth 2.0 (personal Google Cloud project)
- Distribution target: Google Play (Android XR)

### Unity-specific fields (Unity version / render pipeline / Graphics API)

N/A — Compose-based stack, no Unity dependency.

### Opt-in Android XR dev updates *

☑ Yes

---

## Page 3: Tell Us About Your App

### Elevator Pitch * (long-form)

Indian home cooking demands precision on two axes simultaneously: strict tempering sequence (cumin → onion → garlic-ginger → tomato → spice powders → protein, with no margin for misordering) and true parallel execution across three to five dishes at once — curry, dal, sabzi, rice, roti — each on its own timeline. The whole time, your hands are wet, spiced, and unusable. You cannot touch your phone. You cannot flip a page. Voice assistants answer questions but do not watch the pan. Every other recipe tool assumes you have a free hand.

Spice Sutra resolves this with three steps. First, point the glasses at your recipe — a cookbook, a handwritten note, a phone screen — and capture it with a single camera tap. Gemini parses the image into a structured recipe with ingredients, tempering order, timing, and parallel-execution hints. Second, the app builds a five-lane parallel timeline and displays it as a heads-up overlay in your natural field of view, no hand required to advance. Third, every 30–60 seconds, the glasses take one frame and ask Gemini a targeted question: "Has the onion caramelized? Did the mustard seeds pop?" The answer drives the next step — advance, hold, or warn — delivered as a brief audio cue or a HUD card change. You stay in flow. The app stays out of the way unless something needs your attention.

This combination — camera-based recipe capture, parallel-execution planning, and periodic vision-aware step checking — does not exist on any XR platform today. The Display & Audio glasses form factor is a direct fit: display for the HUD, camera for periodic checks, audio for cues. No other consumer XR device currently combines all three. Spice Sutra is scoped to a single vertical deep enough to dogfood every week, narrow enough for a solo developer to ship in nine months, and differentiated enough that no existing app comes close.

### Upload Supporting Files (max 5 / 100 MB each)

Attachment plan (4 files、 max 5 / 100 MB each):

1. `spice-sutra-design.pdf` — Full design specification (architecture, data flow, component boundaries, error handling, test strategy, application narrative). 11 sections.
2. `spice-sutra-catalyst-application.pdf` — Implementation plan (10 tasks from pitch outline through PoC through final submission). Demonstrates execution readiness beyond the idea stage.
3. `hud-overview.png` — DP4 emulator screenshot of the Compose Glimmer 3-zone mock HUD running on Android XR Headset (Google Play XR API 34, 2560×2558, XR environment with floating panel). Completed 2026-05-23.
4. `spice-sutra-architecture.png` — Architecture diagram (optional; exported from spec § 4).

> Note: PDF 化 (files 1, 2) は提出 24-48h 前 (T9、 2026-06-28〜29) に pandoc で実施。 file 3 (hud-overview.png) は実機完成済。

### Category * (multi-select)

☑ Productivity
☑ Health & Wellness
☑ Education

Rationale (for reference, not a form field):
- **Productivity** — Primary. Parallel cooking conductor reduces cognitive overhead, prevents tempering errors, and shortens active attention time during complex multi-dish preparation.
- **Health & Wellness** — Hands-free home cooking supports healthier eating habits. Reducing friction in complex recipe execution makes home-cooked meals more accessible.
- **Education** — Users learning new spices or unfamiliar Indian recipes benefit from guided, step-by-step execution with visual confirmation. Each session builds tacit cooking knowledge.

### Existing Port Link (optional)

N/A — new development. Spice Sutra is not a port or adaptation of an existing app. This is a greenfield application designed natively for the Android XR Display & Audio glasses form factor.

### Development Progress * (0-10)

2

(Design specification complete — architecture, data flow, component boundaries, error handling, test strategy. PoC complete on DP4: Compose Glimmer 3-zone mock HUD (parallel timeline / next step card / warning toast) verified on Android XR Headset emulator (Google Play XR API 34, 2560×2558). See `poc-screenshots/hud-overview.png` + `poc-notes.md`. Backend integration (Gemini multimodal, vision watcher, timeline DAG) starts after acceptance.)

### Target Launch Regions * (multi-select)

☑ Global

Indian home cooking is practiced across a wide diaspora — eligible markets (US, UK, EU, Japan), the Middle East, Southeast Asia, and beyond. Restricting to JAPAC would undercut the app's natural audience. Global is the appropriate selection for a vertically focused cooking app with a globally distributed user base.

### Estimated Launch Date *

2027-04-30

Nine-month timeline from hardware kit receipt (estimated 2026-08) through DP4 prototype, Gemini integration, real-device alpha, beta dogfood, and Google Play submission. Detailed milestone schedule is in the attached plan document.

### Hardware Form Factor *

☑ Display & Audio glasses

Rationale: Spice Sutra's three core capabilities — heads-up display for the parallel timeline, periodic camera capture for visual step-checking, and audio cues for hands-free alerts — map directly to the Display & Audio glasses hardware profile (display + camera + speakers). The production form factor and the development target are the same device class, meaning the app ships without porting overhead.

Wired XR glasses were not selected for a practical reason: cooking involves continuous movement around a stove, counter, and sink. A wired headset physically prevents that mobility. The use case requires untethered glasses.

A wired XR (immersive) version of Spice Sutra — with a richer visual environment for recipe presentation — is a plausible future application, but out of scope for this submission.

---

## Page 4: Glasses Innovation Grant + Acknowledgements

### Grant Amount *

☑ No grant required

The MVP scope — five Indian recipe templates with hybrid timer and periodic camera-based Gemini vision checks — can be self-funded. Estimated Gemini API cost for development and initial production use is approximately USD 350–1,050 per year (approx. 50,000–150,000 JPY) for a solo developer running personal usage volumes. This is well within personal budget for an indie project.

I am applying for hardware kit access and technical resources. Those are the inputs that cannot be replicated independently: early access to Display & Audio glasses hardware before consumer release, and direct technical support during SDK integration. The grant funding is not necessary to reach the Play Store milestone.

### Program Acknowledgements *

☑ I understand that if selected, my team will be required to sign standard digital agreements.
☑ I understand that funding is milestone-based.

(Both checkboxes to be checked at time of form submission.)

---

## Attachments List (form 提出時 user が選択して upload)

| # | ファイル名 | 内容 | 準備状況 |
|---|---|---|---|
| 1 | `spice-sutra-design.pdf` | 設計 spec PDF (`docs/superpowers/specs/2026-05-21-spice-sutra-design.md` から pandoc 等で生成) | 要 PDF 化 (提出前) |
| 2 | `spice-sutra-catalyst-application.pdf` | 実装 plan PDF (`docs/superpowers/plans/2026-05-21-spice-sutra-catalyst-application.md` から生成) | 要 PDF 化 (提出前) |
| 3 | `spice-sutra-poc-demo.mp4` | Task 6 emulator screen recording (30-60 秒) | Task 6 完了後 |
| 4 | `spice-sutra-poc-hud-screenshots.pdf` | Task 6 screenshot 3-5 枚を PDF merge | Task 6 完了後 |
| 5 | `spice-sutra-architecture.png` | spec § 4 architecture diagram 画像 export (任意) | 任意 |

PDF 生成コマンド例:
```bash
# pandoc が入っている場合
pandoc docs/superpowers/specs/2026-05-21-spice-sutra-design.md -o spice-sutra-design.pdf
pandoc docs/superpowers/plans/2026-05-21-spice-sutra-catalyst-application.md -o spice-sutra-catalyst-application.pdf
```

---

## 最終 self-check (提出前に確認)

- [ ] 全項目に値が入っている (TBD / TODO がない)、 住所のみ意図的 [REDACTED]
- [ ] 文字数全項目 OK (elevator pitch: 約 316 words / target 200-400、 他は short-answer or bullet list)
- [ ] AI 主体表現がない (grep "AI 駆動\|Claude が\|AI-assisted" — ゼロ確認)
- [ ] portfolio URL が動く (https://github.com/YuhtaIhara 訪問: `google-xr-ops` + `ai-driven-template` + `sharepoint-rag-azure` + `sharepoint-rag-lite` が PUBLIC 化済であること — Task 5 完了確認)
- [ ] 添付ファイルパス確認 (PDF 2 本は提出 24h 前、 動画 / screenshot は Task 6 完了後に準備)
- [x] Development progress: Task 6 PoC 完了で 2 に bump 済 (2026-05-23)
- [ ] 提出 account が iharayuhta@gmail.com であること (form を開く Google account を確認)
- [ ] 締切: 2026-06-30 23:59 PDT (= JST 2026-07-01 15:59) に余裕を持って提出 (目標: 2026-06-29 中)

---

## 関連

- Pitch outline: `pitch-outline.md`
- Form structure: `form-structure-2026.md`
- Self-review log: `review-log.md`
- Design spec: `../../docs/superpowers/specs/2026-05-21-spice-sutra-design.md`
- Implementation plan: `../../docs/superpowers/plans/2026-05-21-spice-sutra-catalyst-application.md`
