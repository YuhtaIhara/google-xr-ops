# Portfolio Prep — Sotto pivot 反映 (2026-05-26)

> GitHub portfolio (`YuhtaIhara/YuhtaIhara` profile README + pin 構成) の Sotto pivot 後 update 記録。 plan T5 に対応。 pin 候補は Spice Sutra T5 (2026-05-21 完了) から不変、 profile README の表現 3 箇所のみ engineer 向けに微調整。
>
> 採択前は具体的 app 名「Sotto」 を露出させない方針 (plan T5 Step 2 注意)、 "engineer-focused XR memory extension HUD" 程度の generic 表現に留める。 採択後 (2026-07-15 結果通知後) に Sotto 名を出す revision を別途実施。

## 1. 現状 (sotto-pivot-before、 2026-05-26 fetch)

`gh api repos/YuhtaIhara/YuhtaIhara/contents/README.md` で取得。 Spice Sutra 期 (2026-05-21 Task 5) で書かれた状態:

- ヘッダ description: generic XR developer 表現 (Sotto 適合、 変更不要)
- **「Currently building」 section: Spice Sutra (cooking) narrative 全体** ← 書換要
- 「Daily driver」 section: G2 + Conversate + camera-aware cooking design 言及 ← 書換要 (cooking 削除、 engineer memory friction に)
- 「Pinned work」 section: 5 個 list (google-xr-ops の説明文 "Spice Sutra design spec..." を更新要、 構成自体は変更なし)
- 「Reach me」: 変更不要

## 2. README diff (Spice Sutra → Sotto pivot 後 generic 表現)

### 2.1. Header description (変更なし)

```diff
# Yuhta Ihara

Indie developer based in Japan. Building wearable XR HUD experiences with Android XR, Jetpack Compose Glimmer, and Gemini multimodal APIs.
```

→ Sotto 適合、 そのまま keep。

### 2.2. 「Currently building」 section (全面書換、 app 名は伏せる)

```diff
- ## Currently building
-
- **Spice Sutra** — Indian home cooking conductor for Android XR.
- Hands-free, vision-aware cooking guidance for complex parallel recipes. Camera captures the recipe once, Gemini generates a parallel execution timeline, then watches each pan periodically (every 30–60 seconds) to advance steps and warn at critical moments. Design spec and Catalyst application plan in [`google-xr-ops`](https://github.com/YuhtaIhara/google-xr-ops).
+ ## Currently building
+
+ A real-time technical memory extension HUD for Android XR — for engineers and tech founders who carry too much past context (design decisions, PR discussions, decision logs) to recall on demand mid-conversation. The glasses listen, classify intent, retrieve from the user's personal corpus, and render relevant snippets (code, decision lists, architecture diagrams) directly in the field of view. Design spec and application plan in [`google-xr-ops`](https://github.com/YuhtaIhara/google-xr-ops).
```

**ポイント:**
- app 名「Sotto」 出さない (採択前 stealth)
- engineer / tech founder persona を明記
- 3 zone HUD (code / decision list / diagram) のうち generic 部分のみ言及
- 「個人 corpus retrieval」 を hook として残す (前 PJ memory-bridge との連続性を読者が natural に発見できる)

### 2.3. 「Daily driver」 section (cooking 削除、 engineer 軸に書換)

```diff
- ## Daily driver
-
- EVEN Realities G2 display glasses since March 2026. Primary use case: Conversate (live conversational HUD). Daily friction with a no-camera HUD shaped the camera-aware design behind Spice Sutra.
+ ## Daily driver
+
+ EVEN Realities G2 display glasses since March 2026. Primary use case: Conversate (live conversational HUD). Day-to-day friction recalling past technical decisions mid-conversation — and the audio-only HUD's inability to render code, multi-line lists, or diagrams — shaped the visual-HUD design behind the current project.
```

**ポイント:**
- G2 着用開始日 (March 2026) は static fact なので維持
- Conversate primary use case も維持 (G2 = audio HUD の連続体験 evidence)
- cooking/camera 言及を削除、 engineer memory friction + audio-only 物理制約への到達に書換 (前 PJ → Sotto natural progression narrative の伏線)

### 2.4. 「Pinned work」 section (構成変更なし、 google-xr-ops 説明文のみ update)

```diff
  ## Pinned work

- - [`google-xr-ops`](https://github.com/YuhtaIhara/google-xr-ops) — Spice Sutra design spec + Catalyst application plan
+ - [`google-xr-ops`](https://github.com/YuhtaIhara/google-xr-ops) — Design spec + Catalyst application work for the current Android XR project
  - [`ai-driven-template`](https://github.com/YuhtaIhara/ai-driven-template) — Claude Code starter template (`.claude/rules` + hooks + settings baseline)
  - [`sharepoint-rag-azure`](https://github.com/YuhtaIhara/sharepoint-rag-azure) — Azure RAG PoC (design docs, IaC, diagrams)
  - [`sharepoint-rag-lite`](https://github.com/YuhtaIhara/sharepoint-rag-lite) — SharePoint RAG with pgvector + FastAPI + ACL
  - [`even-memory-bridge`](https://github.com/YuhtaIhara/even-memory-bridge) — Personal XR HUD + life-log experiment (G2/R1/Pixel/Mac mini, development frozen, kept as reference)
```

**ポイント:**
- pin 候補 5 個は変更なし (Sotto narrative にも全て適合、 plan T5 Step 3 通り)
- google-xr-ops の description のみ Spice Sutra → 「current Android XR project」 で generic 化
- pin GitHub UI 上の表示順序は変更検討の余地あり (下記 § 3 参照)

### 2.5. 「Reach me」 section (変更なし)

```diff
## Reach me

`iharayuhta@gmail.com`
```

## 3. Pin 表示順序 (任意、 plan は pin 候補不変のみ規定)

pitch-outline-sotto.md § Existing Apps と personal-readiness.md § 2 では `even-memory-bridge` を **言及順序の冒頭** に置いている (「前 PJ → Sotto natural progression」 narrative 強化)。

GitHub pin UI 上も同様に並べると application narrative と一貫性が出る (任意、 user 判断):

**推奨順 (Sotto narrative 反映):**

1. `google-xr-ops` — 本応募 hub
2. `even-memory-bridge` — 前 PJ、 component reuse 60-70% の source
3. `ai-driven-template` — workflow baseline
4. `sharepoint-rag-azure` — RAG 技術蓄積
5. `sharepoint-rag-lite` — RAG 技術蓄積

→ 現状 README list は上記順序、 GitHub pin UI の物理順序も合わせると最も整合。 ただし pin UI 操作は user 手動。

## 4. Manual steps (user 手動、 Claude 実行不可)

- [ ] **Step 1 (manual): screenshot 取得 (before)**
  - 対象: `https://github.com/YuhtaIhara` (profile page)
  - 保存先: `project-aura/application/portfolio-prep-screenshots/sotto-pivot-before-2026-05-26.png`
  - dir 作成: `mkdir -p project-aura/application/portfolio-prep-screenshots`

- [ ] **Step 2 (manual): profile README push**
  - 対象 repo: `YuhtaIhara/YuhtaIhara`
  - 編集: 上記 § 2.2 / § 2.3 / § 2.4 の diff を反映
  - push: `git push` (個人 repo、 main 直 push 可、 commit message 例 `docs: profile narrative refresh for current XR project`)
  - **AI 痕跡注意**: commit message に「Sotto」 「AI 駆動」 等の主体表現を入れない (CLAUDE.md project rule)

- [ ] **Step 3 (manual、 任意): pin 順序を § 3 推奨順に変更**
  - `https://github.com/YuhtaIhara` → Customize your pins
  - 5 個の順序を `google-xr-ops` / `even-memory-bridge` / `ai-driven-template` / `sharepoint-rag-azure` / `sharepoint-rag-lite` に調整

- [ ] **Step 4 (manual): screenshot 取得 (after)**
  - 対象: 同上 profile page (push 反映後)
  - 保存先: `project-aura/application/portfolio-prep-screenshots/sotto-pivot-after-2026-05-26.png` (日付は実施日に合わせる)

- [ ] **Step 5 (Claude 実行可): portfolio-prep.md + screenshot 同梱 commit**
  - 本 doc + before/after screenshot の 2 ファイルを 1 commit に
  - `git commit -m "docs(sotto): T5 GitHub portfolio Sotto pivot 反映"` (plan T5 Step 5 通り)

## 5. 採択後 (2026-07-15 結果通知後) の follow-up

- 採択判明後、 profile README で **app 名「Sotto」 を解禁** する revision を実施 (現在の generic 表現 → 具体名露出)
- catalyst 採択 badge / announcement 追加 (program 規約 / NDA 確認後)
- `even-memory-bridge` の reference link 強化 (Sotto MVP backbone 60-70% の source として明記)
- 本 doc に「accepted update」 section を追記

## 関連

- plan T5: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- personal-readiness.md § 2 GitHub portfolio (本 doc と同期)
- pitch-outline-sotto.md § Existing Apps (本 doc と同期)
- Spice Sutra 期 portfolio prep: 別 doc なし (本 doc が Sotto 用 single source)
