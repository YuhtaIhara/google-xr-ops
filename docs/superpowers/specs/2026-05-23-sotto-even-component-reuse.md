# Sotto — Even repo 流用 component リスト

> Even bucket (`~/work/even/conversate-ops` active + `~/work/even/memory-bridge` frozen) から Sotto MVP に流用可能な component を 5 要素別に inventory。 user 自身の indie 個人著作物として倫理 OK (2026-05-23 user 確認)、 必要範囲で full 流用許可。

| 項目 | 値 |
|---|---|
| 作成日 | 2026-05-23 |
| status | 採択前 attachment 候補 (Catalyst form Page 3 supporting files、 任意 5 枠目) |
| owner | YuhtaIhara (`iharayuhta@gmail.com`、 個人 indie) |
| 関連 | `2026-05-23-sotto-design.md` (本 spec の根拠)、 `2026-05-23-sotto-catalyst-application.md` (実装 plan) |

---

## 1. 全体要約

| 流用度 | 工数 | 対象 |
|---|---|---|
| **そのまま (env 置換のみ)** | 0-1 week | STT / WAV / RAG pipeline / embedding / chunker / masking layer / token auth / 段階的 HUD UX |
| **改修要 (Aura SDK 適応)** | 1-2 weeks | PCM buffer / question_type enum / knowledge folder 構造 / 3-page HUD layout / safety-net templates / privacy schema |
| **新規開発** | 3-4 weeks | code display (inline snippet / architecture diagram) / engineer 特化 corpus ingest / Aura SDK adapter / consent / dismissal UX |

**MVP 全体工数試算 (採択後 9 ヶ月)**:
- 流用そのまま: 0-1 week
- 改修要: 1-2 weeks
- 新規開発: 3-4 weeks
- 統合 / dogfood / debug / Play 申請: 残 30-32 weeks

→ Even repo 流用率 60-70%、 ゼロから書く部分は 30-40% に抑えられる。 indie 1 人 9 ヶ月の Play 公開を現実可能にする最大の leverage。

---

## 2. 5 要素別の流用マトリックス

### 2.1 音声 listening / ASR

| component | source | 流用度 | 備考 |
|---|---|---|---|
| PCM rolling buffer | `memory-bridge/apps/even-plugin/src/buffer.ts` | 改修要 | rolling buffer 設計は再利用、 Aura SDK wrapper (Android MediaRecorder) は新規 |
| STT API wrapper | `memory-bridge/services/stt.py` | そのまま | OpenAI Whisper-1 API、 endpoint 置換のみ |
| WAV encoder | `memory-bridge/utils/wav.py` | そのまま | Pure utility |
| STT 誤訳 audit framework | `conversate-ops/scripts/audit-misrecognition.sh` | 設計知見のみ | 67 パターン定義 (IaC→医薬化 等) は engineer corpus に応用、 方法論を流用 |

### 2.2 意図抽出 (Intent Classification)

| component | source | 流用度 | 備考 |
|---|---|---|---|
| question_type enum | `memory-bridge/services/llm.py` | 改修要 | 既存 6 type (unknown_tech / term_recall / stack_inquiry / clarification_needed / phrasing_help / other) → engineer 特化 5 type (architecture-decision / debugging / code-review / clarification / general) に拡張 |
| LLM structured output schema | `memory-bridge/services/llm.py` | そのまま | Azure OpenAI strict mode JSON (3-page layout: clarify / substance / phrasing) は engineer 質問にも適用可能、 Gemini structured output に endpoint 置換 |
| 痛み P1-P6 mapping | `conversate-ops/docs/prep-notes-design.md` | 設計知見のみ | 仮説ベース、 engineer 痛み (E1-E5: 過去設計失念 / debugging 詰まり / code review 説明 / standup 用語追従 / 1:1 履歴想起) に再 mapping |

### 2.3 個人 corpus retrieval (RAG)

| component | source | 流用度 | 備考 |
|---|---|---|---|
| Hybrid RAG pipeline | `memory-bridge/services/rag.py` | そのまま | cosine 0.7 weight + BM25 + LLM rerank、 完成品、 corpus 追加のみ |
| Embedding wrapper | `memory-bridge/services/embedding.py` | そのまま | text-embedding-3-small / 互換 model、 endpoint 置換 (Vertex AI Embeddings API) |
| Markdown chunker | `memory-bridge/services/chunker.py` | そのまま | heading 単位 chunking、 metadata 保持の設計実装は再利用 |
| Knowledge folder 構造 | `conversate-ops/knowledge/` (personal / phrases / checklists / glossary / patterns) | 改修要 | engineer 特化 folder 追加 (design_docs / pr_comments / decision_logs / commit_messages / chat_logs)、 既存 5 folder は削除 or 別 vertical 用に temp 保持 |
| Masking layer | `memory-bridge/services/masking.py` | そのまま | YAML frontmatter ベース placeholder 置換、 audit log も同一 schema |

### 2.4 HUD render

| component | source | 流用度 | 備考 |
|---|---|---|---|
| 3-page layout (clarify / substance / phrasing) | `memory-bridge/src/hud.ts` | 改修要 | layout 概念は流用、 Aura Display & Audio glasses の画面 size に調整、 Compose Glimmer 書き換え |
| 短文化 + 出典表示 | `memory-bridge/src/hud-formatter.ts` | そのまま | 120-180 char で `file_path › heading_path` 形式の出典表示、 Sotto の summary list 3 行 (60 字) に転用 |
| Safety-net fallback templates | `conversate-ops/knowledge/phrases/safety-net.yml` | 改修要 | engineer 特化 fallback (「まず 技術スタック / チーム構成 / 決定権者 確認」 等) を新規追加、 cooking / business 系は削除 |
| 段階的 UX ([処理中…] → 本内容置換) | `memory-bridge/src/hud-state.ts` | そのまま | state machine と transition 設計はそのまま流用 |
| Inline code display | (新規開発) | 新規 | syntax highlight + 5-10 行 snippet 表示、 Compose の組合せで新規実装 (E2 phase) |
| Architecture diagram thumbnail | (新規開発) | 新規 | 既存 design doc 内の図を thumbnail 化 + tap で拡大、 新規実装 (E2 phase) |

### 2.5 listening UX / 同意 / プライバシー

| component | source | 流用度 | 備考 |
|---|---|---|---|
| Ephemeral buffer 設計 | `memory-bridge/apps/even-plugin/src/buffer.ts` | そのまま | raw audio 永続化なし、 trigger 後 clear pattern、 設計思想ごと流用 |
| Mask → 送信 経路 | `memory-bridge/services/pipeline.py` | そのまま | STT 結果を LLM 前に mask、 audit log 記録、 必須経路の設計をそのまま |
| Privacy schema (DB) | `memory-bridge/db.py` | 改修要 | mask_history / transcripts / audit_log の schema は同一、 Aura 側 Android Keystore + encrypted local storage に enforce 移植 |
| Token / API key 管理 | `memory-bridge/config/secrets.ts` | そのまま | build-time injection、 secret commit 回避 pattern |
| Consent / dismissal UX | (新規開発) | 新規 | HUD 内容に対する「参考にする / しない」 選択、 Even には未実装、 Sotto で新規追加 |

---

## 3. 推奨 integration 順序 (採択後 9 ヶ月)

| Phase | 期間 | 内容 |
|---|---|---|
| Phase 1 | 採択判明 〜 2026-09 | repo bootstrap (`~/work/google/sotto/`)、 Aura SDK adapter 着手、 Even repo の Python/TypeScript 構造を Kotlin に移植する設計 |
| Phase 2 | 2026-09 〜 2026-10 | memory-bridge RAG 層 (rag.py / embedding.py / chunker.py) を Kotlin 移植、 conversate-ops knowledge/ を engineer 特化に rebalance |
| Phase 3 | 2026-10 〜 2026-11 | question_type extend (5 type)、 IntentClassifier 実装、 Gemini prompt template 3 種確定 |
| Phase 4 | 2026-11 〜 2026-12 | Compose Glimmer 3 zone HUD 実装 (memory-bridge の 3-page layout を Aura size に書換)、 実機 alpha 動作 |
| Phase 5 | 2027-01 〜 2027-02 | Privacy / Masking / Session log 統合、 ephemeral buffer の Android Keystore 連携 |
| Phase 6 | 2027-02 〜 2027-03 | E2 phase: inline code display + architecture diagram thumbnail 新規実装 |
| Phase 7 | 2027-03 〜 2027-04 | dogfood (user 自身 + 友人 engineer 2 名)、 retrieval 精度 tuning、 Play 申請 |

---

## 4. リスク / 注意点

### 4.1 言語 / runtime mismatch

- Even repo は TypeScript (HUD layer) + Python (services) + Kotlin (Even-plugin の一部)
- Sotto は Kotlin 一本化 (Jetpack XR DP4 制約)
- → Python services を Kotlin 移植、 TypeScript HUD layer の構造を Compose Glimmer に書換
- 機械的移植不可、 「設計思想を持って書き直す」 工数を見積もる必要 (1 component あたり 2-3 日)

### 4.2 Even Vendor (Even Realities) との関係

- user の stance は「Even 応援 + 継続活用」、 公式 vendor competitor 化は避ける
- Sotto は「Aura visual HUD + engineer 特化」、 Even Conversate (G2 audio HUD + 汎用会話) と axis 違い + market 違い
- 採択 credibility 確保後に Even 公式へ「camera 無し版 audio only Sotto を G2 + R1 ring で実装」 提案 path も視野 (v3 以降検討)
- 流用元 repo (memory-bridge / conversate-ops) は user 個人著作物、 別 vendor 案件のためライセンス問題なし

### 4.3 corpus 初期 setup の onboarding 摩擦

- engineer の design doc / PR / decision log は personal Google Drive / GitHub / Notion / Slack 等に分散
- 初回 setup wizard で「どの source を ingest するか」 を user 自身が指定する必要
- Even の knowledge/ folder は markdown only、 Sotto は多 source (markdown + GitHub PR + Slack 等) 統合が必要 → 新規開発要素として scope
- MVP は markdown only (GitHub clone した design doc) に絞り、 多 source 対応は v2 以降

---

## 5. 関連

- 本 spec の根拠: `2026-05-23-sotto-design.md`
- 実装 plan: `2026-05-23-sotto-catalyst-application.md`
- 流用元 (active): `~/work/even/conversate-ops`
- 流用元 (frozen reference): `~/work/even/memory-bridge`
