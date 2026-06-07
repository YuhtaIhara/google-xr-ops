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

## 4. Manual steps → 実施記録 (2026-06-06、 Playwright + GitHub API で自動化)

- [x] **Step 1: before screenshot** → `portfolio-prep-screenshots/sotto-pivot-before-2026-06-06.png` (Playwright、 logged-out 視点 = reviewer 視点)
- [x] **Step 2: profile README push** → commit `e963410` "docs: profile narrative refresh for current XR project" (GitHub contents API 経由)。 § 2.2 / 2.3 / 2.4 の diff 反映 + **approved 追加修正**: `ai-driven-template` 行を削除 (delight-ihara org へ transfer + private 化済で reviewer には 404 のため。 user 承認 2026-06-06)。 Pinned work は 4 項目に
- [ ] **Step 3 (user 手動のまま、 重要度 UP): pin UI の整理**
  - **実態は想定と乖離**: 実際の pin は 3 つ (`google-xr-ops` + `delight-ihara/sharepoint-rag-azure` (archive badge 付) + `delight-ihara/sharepoint-rag-lite`)。 `even-memory-bridge` が pin されておらず、 会社 org repo が 2 つ並ぶ
  - 推奨: `google-xr-ops` / `even-memory-bridge` を上位 pin に追加 (narrative 上 even-memory-bridge は MVP backbone 60-70% の source で最重要)
- [x] **Step 4: after screenshot** → `sotto-pivot-after-2026-06-06.png` (profile page) + `sotto-pivot-after-repo-readme-2026-06-06.png` (repo page、 README render 証跡)
- [x] **Step 5: 同梱 commit** → 本 commit

### 4.1. Open issues (2026-06-06 発見) → 2026-06-07 までに ① ② 解消

1. ~~profile page に README が render されない~~ → **解消 (2026-06-07)**。 root cause は「repo page (owner 視点) の **Share to profile** button を手動 click する必要がある状態」 だった (要件充足 + special repository banner 表示でも自動 render されず。 repo 削除→再作成でも直らず、 button click で即 render)。 logged-out 視点で render 確認済 → `sotto-pivot-after-2026-06-07.png` が最終証跡
2. ~~Contributors に `delight-ihara` 混入~~ → **解消 (2026-06-06)**。 repo 削除 → `gh repo create` 再作成 → README を YuhtaIhara 単独 author の 1 commit (`eb90bef`) で push。 履歴から会社 account 消滅
3. ~~pin UI の整理~~ → **解消 (2026-06-07、 user 手動)**: pin を `google-xr-ops` / `even-memory-bridge` の 2 個に整理 (会社 org repo を除去)。 logged-out 視点で確認済 → `sotto-pivot-final-2026-06-07.png` が pin 反映後の最終証跡。 **残**: form / personal-readiness に「pinned 5 個」 表現が残っていれば buffer 期間に「pinned 2 個 + README 内 4 link」 へ同期修正
4. **(観察) profile の public activity に「docs(sotto): ...」 の commit / PR title が露出**: `google-xr-ops` が public repo のため、 README で Sotto 名を伏せても activity feed から名前は発見可能。 stealth 方針の精度を上げるなら repo private 化 or commit message 規約変更だが、 README link が repo を指す設計 (reviewer に見せる前提) と相反するため、 現状維持が妥当か buffer 期間に判断

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
