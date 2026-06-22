# Personal Readiness — Sotto (2026-05-26 確定)

> Catalyst form Page 1+2 の Developer Readiness 関連項目の **個人情報 / 自己記述** 正本。 pitch-outline-sotto.md (form 各項目の英文 draft 集約) と form-final-draft.md (提出 copy-paste 用、 T8 で Sotto 版に再構築予定) の **upstream source**。 spec `docs/superpowers/specs/2026-05-23-sotto-design.md` § 9 Developer Readiness と 1 対 1 整合。
>
> Spice Sutra 前身は `pitch-outline.md` 内に分散していた個人情報項目。 Sotto pivot に伴い、 cooking domain expertise を外し engineer 痛みの自己記述 + even-memory-bridge dogfood narrative に書換。 user 確定済の static fact (G2 着用開始 / Kotlin 経験 / pin 構成) は流用。

## 1. Static facts (Spice Sutra から流用、 Sotto pivot 影響なし)

| 項目 | 値 | 確定日 | 備考 |
|---|---|---|---|
| Company Name | `Yuhta Ihara` (個人 indie) | 2026-05-21 | form Page 1 |
| Primary Contact Name | Yuhta Ihara | 2026-05-21 | form Page 1 |
| Primary Contact Email | iharayuhta@gmail.com | 2026-05-21 | form Page 1、 Catalyst 提出 account |
| Job title | Indie Developer | 2026-05-21 | form Page 1 |
| Company website | https://github.com/YuhtaIhara | 2026-05-21 | form Page 1 |
| Country | Japan | 2026-05-21 | form Page 1 |
| Region | APAC | 2026-05-21 | form Page 1 |
| Address | `[REDACTED]` | 2026-05-21 | 機密扱い、 form 提出時に直接記入 (英訳済) |
| Team size | Solo (`YuhtaIhara` 1 名、 共同創業者なし) | 2026-05-21 | form Page 2 自由記述 |
| G2 着用開始 | 2026-03 (約 2-3 ヶ月) | 2026-05-21 | Conversate 主、 HUD UX を消費者として深く理解 |
| Kotlin / Android 経験 | 1 年未満 | 2026-05-21 | 採択後 9 ヶ月 window で習得 + Sotto MVP 構築 |
| Google Play 公開実績 | なし | 2026-05-21 | Sotto が初の Play target |

## 2. GitHub portfolio (Sotto 関連順、 pin 構成は Spice Sutra T5 完了済の流用)

pinned public repositories (`github.com/YuhtaIhara`、 Sotto narrative 順):

1. **`even-memory-bridge`** — frozen 前 PJ。 EVEN Realities G2 audio glasses 上の XR HUD + life-log + retrieval 実験。 5 ヶ月 dogfood。 RAG pipeline / embedding / chunking / masking layer / HUD state machine 保有、 Sotto MVP backbone の 60-70% を流用 (添付 `sotto-even-component-reuse.pdf` で file-level inventory 提示)。
2. **`google-xr-ops`** — 本応募の設計 spec + Catalyst plan + Even 流用 inventory + PoC 成果物 (本 repo)。

profile README「Pinned work」section からの追加 link (pin 外、 公開到達可能):

- **`sharepoint-rag-azure`** — Azure RAG PoC + 設計 doc + IaC + architecture diagram (`別 org` org へ redirect、 public 200)。
- **`sharepoint-rag-lite`** — SharePoint RAG 実装 (pgvector + FastAPI + ACL) (同上)。

> **2026-06-12 同期修正**: pin は 2026-06-07 に user 手動で 2 個構成 (`google-xr-ops` / `even-memory-bridge`) に整理済 (会社 org repo を pin から除去)。 `ai-driven-template` は org transfer + private 化で reviewer 404 のため全 reviewer-facing 文面から削除。 sharepoint-rag 2 つは README link 経由で到達可能なため「README link」 として言及を維持。 旧「pinned 5 個」 表現は form-final-draft-sotto.md / pitch-outline-sotto.md / spec § 9 とともに本日同期済。

## 3. Domain expertise (Sotto 用、 全面書換)

中堅 indie engineer 自身として、 多 client / 多 project の context switching に日常的に苦しんでいる。 過去の design 判断 / PR discussion / decision log を weekly に書き残しているが、 商談 / code review / 1:1 で 「あの時の理由は?」 と聞かれた瞬間に思い出せない経験は週 2-3 回起きる。 phone を取り出すと credibility が落ちる、 取り出さないと答えに詰まる、 という engineer の dilemma を user 自身が weekly に体感している。 Sotto はこの痛みを directly に解決する dogfood-grade な designed solution。

→ **dogfooder = primary user persona** であることが 9 ヶ月 commitment を支える前提。 researched insight でなく user 自身の火曜日午後そのもの。

### English (form 提出用 narrative core、 pitch-outline-sotto.md § Previous Development Experience に組込済)

> I am the primary user persona for Sotto. As a mid-career indie engineer running multiple parallel projects, I weekly hit the moment where someone asks "why did you choose X?" about a months-old decision and I cannot recall the reasoning fast enough to answer credibly. That is not a researched insight — it is my Tuesday afternoon. I am the dogfooder, and that is the reason I trust the premise enough to spend nine months on it.

## 4. Concept validation (Sotto 用、 全面書換)

前身 PJ `even-memory-bridge` (EVEN Realities G2 用 HUD-based memory extension、 2026-01 〜 2026-05 / 約 5 ヶ月 / 現在 frozen、 GitHub 公開) で:

- **Personal corpus を Hybrid RAG (cosine 0.7 + BM25 + LLM rerank) で retrieval する pipeline** を Python + TypeScript で完成、 G2 audio HUD 上で 200+ 回の自己 dogfood を実施
- **G2 の audio-only HUD では code / 図 / multi-line context が出せない物理制約** に到達 → Sotto (Aura visual HUD) はこの制約を解除する natural progression
- 「engineer 質問 → 個人 corpus retrieval → HUD render」 の **3-5 秒 latency を Python 側で達成** (詳細は `docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md` 参照)、 Kotlin 移植で同等性能維持可能

→ Sotto は新規 use case の concept でなく、 **5 ヶ月の dogfood で validated された premise を Aura HW で完成形にする発展**。

### English (form 提出用 narrative core、 pitch-outline-sotto.md § Previous Development Experience / § Elevator Pitch / § Existing Port に分散組込済)

> Prior to Sotto, I built and dogfooded `even-memory-bridge` (now frozen, public on GitHub), a personal XR HUD + life-log + retrieval experiment on EVEN Realities G2 hardware, for approximately five months. That project taught me where audio-only HUDs work and where they reach physical limits — the G2 cannot render code snippets, decision logs as visual lists, or architecture diagrams. Sotto on Aura is the natural progression: take the engineer-specific retrieval pipeline I already built, and render it as visual context the G2 hardware never could.

## 5. Development Progress score (form Page 3、 0-10 scale)

**2** (控えめ姿勢で採用率 up)

**根拠 (Sotto 版):**

- 設計 spec 完了 (architecture / data flow / components / privacy / error / test、 11 section / ~590 行)
- Mock HUD PoC 完了 (DP4 emulator、 Compose Glimmer 3 zone: summary list / inline code / architecture diagram、 Android XR Headset API 34 / 2560×2558 で動作確認、 `poc-screenshots/sotto-hud-overview.png` + `poc-notes.md`)
- 前 PJ `even-memory-bridge` (frozen 公開) から流用可能な **動作品** が Python / TypeScript code として存在: Hybrid RAG (cosine 0.7 + BM25 + LLM rerank) / masking layer / embedding + chunking / intent classification framework / HUD state machine pattern
- Kotlin 移植 + Aura SDK 統合は採択後 (HW kit 受領 2026-08) 着手

> Spice Sutra と同じ score 2、 ただし根拠が「design + cooking PoC」 から「design + engineer PoC + Even RAG 完成品所持」 に変化。 score 2 維持で控えめ姿勢、 ただし根拠は厚い (Even repo 完成品があることで「即実装着手可」 を暗示)。

## 6. Spec § 9 Developer Readiness との整合確認

| spec § 9 行 | 本 doc 対応 section | 整合 |
|---|---|---|
| Company Name / Job title / Country / Region | § 1 Static facts | ✅ 同一 |
| Team size | § 1 Static facts | ✅ Solo indie developer |
| Prior XR experience (G2 daily user since 2026-03) | § 1 Static facts | ✅ 同一 |
| Prior Android experience (Kotlin <1y) | § 1 Static facts | ✅ 同一 |
| Domain expertise (engineer context switching dogfood) | § 3 Domain expertise | ✅ 同一 (詳細展開) |
| Open source / portfolio | § 2 GitHub portfolio | ✅ 同一 (Sotto 関連順) |
| Concept validation (memory-bridge 5 ヶ月 dogfood) | § 4 Concept validation | ✅ 同一 (詳細展開) |
| Development progress 2 | § 5 Development Progress | ✅ 同一 (根拠拡充) |

差分なし。 spec § 9 を後で update する必要なし。

## 7. T8 form-final-draft 反映方針 (memo)

T8 で `form-final-draft.md` を Sotto 版に書換する際、 本 doc から copy する範囲:

- **Page 1 個人情報 7 項目**: § 1 Static facts からそのまま (Spice Sutra 版 form-final-draft.md の Page 1 と同一なので最小変更)
- **Page 2 Previous development experience**: pitch-outline-sotto.md § Previous Development Experience の English ブロックを採用 (§ 3 Domain expertise + § 4 Concept validation のエッセンスを既に統合済)
- **Page 2 Existing apps**: pitch-outline-sotto.md § Existing Apps の English ブロック (本 doc § 2 と同期)
- **Page 3 Development progress**: pitch-outline-sotto.md § Development Progress の English ブロック (本 doc § 5 と同期)

→ 本 doc は **個人情報 + 自己記述の single source of truth**、 pitch-outline-sotto.md と form-final-draft.md は本 doc の subset を form 各項目向けに整形した downstream view、 と位置づける。

## 関連

- spec § 9 Developer Readiness: `../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- plan T4: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- form 各項目の英文 draft 集約: `pitch-outline-sotto.md`
- 提出 copy-paste 用 (T8 で Sotto 版に書換予定): `form-final-draft.md`
- form 構造: `form-structure-2026.md`
- 前身 doc (deprecated): なし (Spice Sutra 期は分散管理、 Sotto pivot で本 doc を新規 single source 化)
