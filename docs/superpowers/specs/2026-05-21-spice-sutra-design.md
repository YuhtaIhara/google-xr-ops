# Spice Sutra — 設計仕様

> Indian home cooking conductor for Android XR

| 項目 | 値 |
|---|---|
| 作成日 | 2026-05-21 |
| status | draft (応募 pitch 用 base) |
| owner | YuhtaIhara (`y.ihara@delight-x.co.jp`) |
| 目的 | Project Aura Catalyst Program (締切 2026-06-30) 応募の根幹 + 採択後の実装 spec |
| 関連 | `../../2026-05-20-android-xr-catalyst-handoff.md` (前 session ハンドオフ) / `../../../project-aura/README.md` (Program 概要) / `../../google-xr-design.md` (ops 設計累積) |
| 後段 | 採択判明後 (2026-07-15+) に新 repo `~/work/google/spice-sutra/` を bootstrap、 本 doc が implementation plan の base になる |

---

## 1. 一言定義 と 北極星

スパイスカレー / インド家庭料理を、 Android XR グラスがカメラで見て指揮してくれるアプリ。 濡れた手・スパイス手で本もスマホも触らず、 視野の HUD と耳元の短い指示だけで複数の鍋を同時進行できる。

**北極星**: 「**Indian home cooking で誰よりも料理 conductor として信頼される XR app**」 になる。 mass market 狙わない、 vertical 一点突破。

---

## 2. Positioning (なぜこれが新しいか)

### 競合状況

| 層 | 既存 / 競合 | 状況 |
|---|---|---|
| スマホ読み上げレシピ | クックパッド / DELISH KITCHEN voice | 飽和 |
| スマートディスプレイ HUD | Google Nest Hub recipe mode | 飽和 |
| Meta Ray-Ban で「料理中質問」 | 既存 use case として大量に投稿 | 飽和 |
| EVEN Realities G2 で「レシピ視野表示」 | コミュニティ実装多数 (camera 無で限界) | 競合多 |
| HoloLens 系研究プロジェクト | 「HoloChef」 等の論文/PoC 2017〜 | PoC 止まり |
| **Android XR Display+camera+多並列+LLM** | **Aura/Display 未発売、 DP4 段階、 indie 実装見当たらず** | **空白** |
| **+ Indian / spice 特化 vertical** | **誰も embedded していない、 user 自身が dogfooder** | **強 moat** |

### スパイスカレー軸が moat な理由

- **テンパリング順が秒単位**: クミン → 玉葱 → ニンニク生姜 → トマト → スパイスパウダー → 主材料 の順序ミスで料理が壊れる。 conductor の必然性が「凝った和食」 や「フレンチ」 より突出
- **数十種類のスパイス**: 視覚記録 + camera で「あれ何 g 入れた?」 のトラッキング価値が高い
- **典型的並列構成**: curry + dal + sabzi + roti + rice。 並列調理が日常、 conductor のデモケースとして自然
- **濡れた手 + スパイス手**: 本・スマホ触りたくない personal pain が明確、 「自分が一番の検証者」 narrative
- **日本の indie が「スパイスカレー」 で出す異質性**: 米国査定者にとっても印象に残る、 ユニーク評価高い

### 削った 2 案

- **B. Conductor + 振り返りログ**: 終了後のレシピ完成度 / 写真 / 感想で「上達曲線」 を見せる。 学習 vertical により強くフィットだが scope +30%、 indie 厳しい → v2 以降
- **C. Conductor + 共有 (multi-user)**: 同じレシピを家族 / 友人とリレー調理、 進行共有。 differentiation 強いが sync インフラ重い → v3 以降

---

## 3. ユーザ体験 (Data Flow 物語版)

### Phase 1: レシピ取込 (5-30 秒)

1. グラス装着、 入力 tap (Aura button / voice) で「start」、 アプリ起動
2. 料理本 / スマホ画面 / 手書きメモを視野中央に置く
3. カメラが 1 枚撮影 → Gemini が材料 / スパイス / 工程 / 推定時間 / 並列 hint を JSON で返す
4. 複数品作る場合「次これも」 を繰り返して 2-5 件追加 (curry + dal + sabzi + rice 等)

### Phase 2: 計画 (3-10 秒)

1. アプリが並列 DAG 構築 (ガス口数 default 2、 圧鍋有無、 オーブン available)
2. 各 step の推定時間 (Gemini 提供) と並列 hint (tempering 中に別具材切る等) を統合
3. 視野に全体 timeline を 5 lane の帯グラフで表示
4. ユーザ確認 → 入力 tap で調理開始

### Phase 3: 調理中 loop (30-90 分、 core)

**毎秒**:
- HUD が残時間カウント / 次手順カード refresh

**30-60 秒ごと (周期 chk)**:
- カメラ 1 frame 撮影
- 現 step の monitoring hint 取得 (例: 「玉葱の色 確認、 飴色か?」「マスタード弾けたか?」)
- Gemini に画像 + hint を投げて判定
- 判定結果: ADVANCE (step 完了) / WARN (火力 / 焦げ / 水分異常) / WAIT (まだ早い)

**event 発生時**:
- HUD に表示 (次 step カード切替 / 赤 banner 警告)
- 高優先度 cue は audio で push (「卵今割って」「火止めて」)
- ユーザは入力 tap (Aura button / voice) で manual override 可能 (戻す / 進める / 警告無視)

**ad-hoc 質問**:
- 「これ何 g 入れた?」 を音声で聞ける (v1 は SpiceLog から軽実装)

### Phase 4: 完了 (10 秒)

- 全 lane 完了検知
- 完了 banner + 簡易サマリ (実時間 vs 推定、 警告回数)
- ログ保存のみ (本格的な振り返り機能は v2 以降)

---

## 4. Architecture

```
┌──────────────────────────────────────────────────────────┐
│  Android XR Glasses (Display + Audio + Camera)           │
│  ┌───────────────┐  ┌──────────────┐  ┌──────────────┐   │
│  │ Compose       │  │ SceneCore    │  │ Mic / Spk    │   │
│  │ Glimmer (HUD) │  │ (camera fr)  │  │ (cue/voice)  │   │
│  └───────┬───────┘  └──────┬───────┘  └──────┬───────┘   │
│          │                 │                  │           │
│  ┌───────┴─────────────────┴──────────────────┴───────┐  │
│  │  Spice Sutra app (Kotlin + Jetpack XR DP4)         │  │
│  │  ┌──────────────┐  ┌──────────────┐ ┌───────────┐  │  │
│  │  │ Recipe       │  │ Timeline     │ │ Vision    │  │  │
│  │  │ Reader       │→ │ Planner      │→│ Watcher   │  │  │
│  │  │ (一発撮影)    │  │ (並列 DAG)    │ │ (周期 chk) │  │  │
│  │  └──────┬───────┘  └──────┬───────┘ └─────┬─────┘  │  │
│  │         │                 │                │        │  │
│  │  ┌──────┴─────────────────┴────────────────┴─────┐ │  │
│  │  │ Gemini Bridge (multimodal API client)         │ │  │
│  │  └──────────────────────┬────────────────────────┘ │  │
│  └─────────────────────────┼──────────────────────────┘  │
└────────────────────────────┼──────────────────────────────┘
                             │ HTTPS (Vertex AI / Gemini API)
                             ▼
                  ┌─────────────────────┐
                  │ Gemini 2.x (multim) │
                  │ - レシピ画像 → JSON  │
                  │ - 周期 frame 判定    │
                  └─────────────────────┘
```

### 5 layer 役割

| Layer | 内容 |
|---|---|
| Compose Glimmer | 視野 HUD (残り時間 / 次手順 / 並列 task) |
| SceneCore + Camera | passthrough frame 取得 (起動時 1 枚 + 周期 1 枚) |
| Mic / Spk | 起動時音声入力 (オプション)、 cue 音 + 「卵割って」 push |
| Spice Sutra app | 3 module の orchestration |
| Gemini Bridge | Vertex AI / Gemini Direct API client、 認証は OAuth 2.0 (個人 Google Cloud project) |

### 核となる原則

- **camera frame は app 内で完結処理**、 Gemini へは base64 1 枚ずつ送信 (動画 stream しない、 cost / privacy 対策)
- **audio は OS 標準** (Spatial Audio 不要)
- **AI は advisory、 ユーザが最終判断者** (全 ADVANCE / WARN が input override 可能、 強制ロックなし)

### 入力 device の表記規約

本 doc 内で **「input tap / input long-press / input dismiss」** と書く場合は Aura native input device を指す。 具体的には:

- **Aura hardware button** (本体側ボタン、 詳細仕様 DP4 段階で未確定)
- **voice command** (mic 経由、 「next」 「back」 「pause」 等)
- **簡易 gesture** (head nod / dwell、 SceneCore 経由)

3 つのうちどれが MVP で primary になるかは Aura HW kit 受領後 (2026-08) の人体工学検証で確定。 design 段階では「input」 と generic 表記。

なお **G2 R1 ring** は別 platform (EVEN Realities G2 専用) の入力 device、 本 spec の Aura input device ではない。 G2 fork 検討は section 10 follow-up 参照。

---

## 5. Components (責務境界)

### domain layer (Pure Kotlin)

#### RecipeReader

- **入力**: `ImageBitmap` (camera 1 frame)
- **出力**: `RecipeSpec[]` (材料 / スパイス / 工程 / 推定時間 / 並列 hint)
- **責務**: camera frame を Gemini に投げて構造化レシピを取得。 Indian-specific schema (tempering 順、 マサラ構成、 主材料区分)
- **境界**: 入力は ImageBitmap 1 つ、 出力は RecipeSpec data class。 vision-specific 処理は Gemini 任せ

#### TimelinePlanner

- **入力**: `RecipeSpec[]` (1+ 件)
- **出力**: `ExecutionTimeline` (時刻 + step + 監視 hint)
- **責務**: 並列 DAG 構築 (ガス口数 default 2 / オーブン / 圧鍋)、 critical path 抽出、 各 step の monitoring hint 抽出
- **境界**: pure function、 副作用なし。 設定値は引数で受ける

#### VisionWatcher

- **入力**: `ExecutionTimeline` + 周期 camera frame (30-60 秒毎)
- **出力**: `AdvanceEvent` (ADVANCE / WARN / WAIT)
- **責務**: 「現在の monitoring hint」 を Gemini に質問、 step 進行判定
- **境界**: timeline の現在 step を読み / 書き、 副作用は state 更新のみ

### presentation layer (Jetpack XR)

#### HudPresenter

- **入力**: `ExecutionTimeline` + `AdvanceEvent`
- **出力**: Compose Glimmer 描画
- **責務**: 視野 HUD 3 zone レイアウト
  - **上**: 並列 timeline overview (5 lane 帯グラフ)
  - **中**: 現在 step カード (材料 / 動作 / 残時間)
  - **下**: 警告 toast (赤線 + 振動)

#### AudioCue

- **入力**: 高優先度 `AdvanceEvent`
- **出力**: TTS + cue tone
- **責務**: 「卵今割って」 / 「火止めて」 push、 環境音邪魔しない短文

### infrastructure layer

#### GeminiBridge

- **prompt template 3 種**:
  - `parseRecipe (image → RecipeSpec, indian-specific schema)`
  - `planTimeline (RecipeSpec[] → ExecutionTimeline)`
  - `checkStep (image + hint → completion/warning)`
- **retry / rate-limit / cost meter** (1 月 5000 円上限 alert)
- **責務**: API 呼び出しを 1 箇所に集約、 cost monitor / API key 管理 / retry を一元化

### 5 個に絞った理由

- Reader / Planner / Watcher の 3 way 分割は責務軸 (入力 / 計画 / 監視) と一致、 後で「別 vertical (和食) 追加」 時も Planner だけ差し替え
- HUD と Audio を分離: Audio glasses 単体動作 (v2) で HUD 抜いて出荷可
- GeminiBridge を 1 箇所に集約: cost monitor / API key 管理 / retry を一元

### スパイスカレー特化部分の閉じ込め

vertical 依存は **`RecipeSpec` schema** と **`parseRecipe` prompt** の 2 箇所のみ。 他は generic、 将来「和食 / タイ料理」 追加時もここだけ差し替えで済む。

---

## 6. Data Flow (詳細)

```
[T0]  ユーザ調理開始準備
       │
       ▼
  ┌──────────────────────────────────────────┐
  │ Phase 1: レシピ取込 (5-30 秒)              │
  │                                           │
  │  user: 本 / スマホ画面を視野中央に置く     │
  │  user: input tap (Aura btn / voice) start │
  │  RecipeReader: camera 1 frame capture     │
  │  GeminiBridge: parseRecipe(image)         │
  │   prompt: "これは Indian recipe の画像。  │
  │           材料 / スパイス / 工程を JSON で。│
  │           tempering 順 + 並列可能 step も" │
  │  → RecipeSpec[] (1+ 件)                   │
  │                                           │
  │  user: "次これも" で 2-5 件追加可能        │
  │  (curry + dal + sabzi + rice 等)          │
  └──────────────────────────────────────────┘
       │
       ▼
  ┌──────────────────────────────────────────┐
  │ Phase 2: timeline 計画 (3-10 秒)           │
  │                                           │
  │  TimelinePlanner.plan(RecipeSpec[])       │
  │   - gas 口数 default 2 (設定可)           │
  │   - 圧力鍋 / オーブン available 1/0       │
  │   - 各 step の推定時間 (Gemini 提供)      │
  │   - 並列 hint (tempering 中に別具材切る等)│
  │  → ExecutionTimeline (5 lane DAG)         │
  │                                           │
  │  HudPresenter: 全体 timeline 視覚化        │
  │  user 確認: input tap で start cooking    │
  └──────────────────────────────────────────┘
       │
       ▼
  ┌──────────────────────────────────────────┐
  │ Phase 3: 調理中 loop (30-90 分、 core)     │
  │                                           │
  │  every tick (1s):                         │
  │    HudPresenter.update(currentTime)       │
  │     - 残時間カウント                       │
  │     - 次手順カード refresh                  │
  │                                           │
  │  every 30-60s (周期 chk):                  │
  │    VisionWatcher.check(currentStep)       │
  │     1. camera 1 frame capture              │
  │     2. monitoring hint 取得                │
  │        (例: "玉葱の色 確認、 飴色か?")     │
  │     3. GeminiBridge.checkStep(image,hint) │
  │     4. AdvanceEvent 判定                   │
  │        - ADVANCE (step 完了)               │
  │        - WARN (火力 / 焦げ / 水分異常)     │
  │        - WAIT (まだ早い)                   │
  │                                           │
  │  on event:                                │
  │    HudPresenter.show(event)               │
  │    AudioCue.play(event) if HIGH priority  │
  │     (例: "火 弱めて" / "卵 今割って")      │
  │    user: input tap で manual ADVANCE 可   │
  │                                           │
  │  on user request ("これ何 g 入れた?"):    │
  │    SpiceLog.recall() (v1 で軽実装)        │
  └──────────────────────────────────────────┘
       │
       ▼
  ┌──────────────────────────────────────────┐
  │ Phase 4: 完了 (10 秒)                      │
  │                                           │
  │  全 lane 完了検知                          │
  │  HudPresenter: 完了 banner + 簡易サマリ    │
  │   (実時間 vs 推定、 警告回数)              │
  │  v1 はログ保存のみ (振り返り機能は v2)     │
  └──────────────────────────────────────────┘
```

### 重要設計判断

- **Gemini 呼出は 3 種類のみ**、 prompt template 化、 cost 予測しやすく。 1 調理 = 平均 30-60 calls (Phase 3 の周期 chk が大半)
- **camera frame は必要時のみ撮影** (連続 stream 無し)。 battery + privacy
- **user の manual override を全箇所で可能**に (AI 過信は事故、 input tap で「先進める」 / 「警告無視」 が常時できる)
- **Phase 3 の Audio cue は高優先度のみ**。 喋りすぎは料理体験を壊す

---

## 7. Error / Edge cases

| 分類 | ケース | 対処 |
|---|---|---|
| **入力** | レシピ画像がブレ / 暗い / 一部しか写ってない | Gemini 信頼度低下 → HUD「もう一度撮影」、 retry 上限 3 回 |
| | レシピが Indian 以外 (誤撮影 / 和食) | parseRecipe で vertical 判定、 「対応外、 v2 で対応予定」 表示。 強制続行 input で可 |
| | レシピ複雑すぎ (10 件並列) | Planner で「ガス口数 / 人手 から並列上限 5」 適用、 user に「3 件に絞って」 提案 |
| **判定 (Phase 3)** | camera frame 暗い / 蒸気で曇る | Gemini「判定不能」 を返す → ADVANCE 保留、 timer 単独継続、 HUD に「目視確認推奨」 amber 表示 |
| | Gemini 誤判定 (まだなのに完了判定) | user 常時 input で manual override 可、 「戻す」 操作対応 |
| | Gemini 誤警告 (火止めて と言うが正常) | input dismiss、 学習 v2 (今期は単純 dismiss のみ) |
| **API** | Gemini API 落ちる / network 切れる | timer ベース fallback、 vision watch skip、 HUD 上に「AI 観察停止中」 amber、 復旧で自動再開 |
| | rate limit / cost 上限到達 | cost meter で月 5000 円 alert → vision watch 周期 60s → 120s 段階劣化 |
| **device** | battery 残少 (<20%) | vision watch 周期 60s → 180s に自動延長、 HUD 通知 |
| | glasses 外す / 視線外れ | camera frame 取得 fail → 「装着確認」 toast、 timer は継続 |
| | passthrough 解像度低下 | 周期 chk frame で再評価、 N 連続 fail で「目視確認推奨」 |
| **user** | 途中で中断 (電話 / 来客) | input long-press で「一時停止」、 全 timer 停止、 復帰で再開 |
| | 並行で別アプリ (Spotify 等) | OS multi-app 想定、 background でも timer 継続、 重要 cue は通知優先 |
| **安全** | 過熱検知 (煙 / 焦げ色) | HIGH priority cue「火止めて」 + 振動 + 赤 banner、 user dismiss まで持続 |
| | 油はね危険 step (テンパリング) | 該当 step 開始時に「顔離して」 advisory、 確認 input で進行 |

### 設計原則

- **AI は advisory、 user が最終判断者**。 全 ADVANCE / WARN が input override 可能、 強制ロックなし
- **degraded mode を多段** (full → vision skip → timer only → manual only)、 完全停止しない
- **cost meter は app 内に常時表示** (画面下に「今月: 1,240円 / 5,000円」)、 indie が課金事故防止

---

## 8. Testing strategy

| Layer | 何を / どう | 目標 |
|---|---|---|
| **Unit (Kotlin)** | RecipeSpec parser / TimelinePlanner DAG 構築 / cost meter / input event handler | JUnit5 + MockK、 80% line cov |
| | Planner: 並列 hint で critical path 短縮、 ガス口数違いで再計画、 圧鍋有無で分岐 | 各 5+ test cases |
| | VisionWatcher 状態機械 (WAIT/ADVANCE/WARN/SKIP) の transition | 全 transition exhaustive |
| **Integration** | GeminiBridge: 3 prompt template を recorded fixture で再生 | VCR pattern、 API key 不要、 CI で回せる |
| | fixture: スパイスカレー本写真 5 種 / 調理途中 frame 30 種 (玉葱 飴色 before/after、 マスタード 弾ける before/after 等) | 自前撮影、 repo 内 `tests/fixtures/` |
| | エラーパス: rate-limit / timeout / 不正 JSON / 部分応答 を mock で再現 | 全 error case retry / fallback 検証 |
| **Emulator** | HUD layout (Compose Glimmer): 並列 5 lane が視野内収まる / dark mode / 視野角境界 | Studio preview + emulator screenshot diff |
| | camera mock (静止画 stream)、 周期 chk pipeline 通る | 各 phase 通過確認 |
| **実機 (Aura HW kit、 受領後)** | passthrough frame 取得 latency、 周期 30/60/120s 各で battery 消費測定 | 30s で 90 分連続調理が battery 持つこと |
| | 視野 HUD の実環境視認性 (蒸気 / コンロ周りの明るさ / 油はね) | 「読める」 を 3 シナリオで定性確認 |
| | 「マスタード弾けた?」 判定実測精度 (10 試行で正答率) | ≥80%、 < なら hint prompt 改善 |
| | Aura native input (hardware button / voice / 簡易 gesture) で manual override が全フェーズ可能 | manual override 道が常時開通 |
| **End-to-end dogfood** | user 自身が週 1+ 回スパイスカレー実調理、 各回録画 + 改善点ノート | retrospect log を `apps/` 配下 (採択後 repo) で蓄積 |
| | 友人 1-2 名で「料理しない人」 デモ、 30 分で完成体験 | onboarding UX 計測 |
| **Catalyst 提出前** | DP4 → DP5 / Beta 切替で破壊変更チェック | Catalyst 期間中 (2026-08 〜 2027-04) で 2-3 回想定 |

### MVP の品質ゲート (Play 公開 2027-04-30 の条件)

1. 5 テンプレ (curry/dal/sabzi/roti/rice) で **dogfood 20 回以上** + crash-free
2. vision 判定 **平均正答率 ≥ 75%** (主要 5 step、 user 評価)
3. battery: **90 分調理で残 ≥ 40%**
4. cost: **1 調理あたり Gemini ≤ 50 円**
5. onboarding: **「初回起動 → 1 つ目のレシピ完成」 を 30 分未満**で達成

### 意図的に削ったもの

- 自動 UI test (Espresso / UI Automator) は HUD + camera 依存で fragile、 indie scope 外
- 多言語 (日 + 英 のみ、 ヒンディー / タミルは v2 以降)
- 負荷試験 (single-user app、 不要)
- セキュリティ pen test (Play 標準 + 個人 OAuth で十分)

---

## 9. 応募 narrative (Catalyst form 落とし込み)

### App 名 (working title)

**Spice Sutra** — Indian home cooking conductor for Android XR

- *Sutra* = 経 / 糸 (サンスクリット)、 「複数調理を 1 本の糸で繋ぐ」 暗喩
- 候補別案: Curry Conductor / Tadka HUD / Mise (mise en place 由来)

### Vertical Alignment

- **Primary**: Productivity & Learning
- **Secondary**: Health & Wellness (家庭料理 → 健康な食生活への adoption)

> "Hands-free, vision-aware cooking guidance for complex parallel recipes (Indian home cooking) — a category currently unaddressed on any XR platform."

### Use Case (one paragraph)

> Indian home cooking requires strict tempering order, dozens of spices, and 3–5 dishes cooked in parallel — all while hands are wet, spiced, and cannot touch a phone or book. Spice Sutra captures the recipe via the glasses' camera once, generates a parallel execution timeline using Gemini, then watches each pan periodically (every 30–60 seconds) to advance steps and warn at critical moments — all hands-free, in the cook's natural field of view.

### Developer Readiness

> 注: 下表の `[TODO: ...]` は design spec の foggy さではなく、 **応募 form 提出時に user 自身が埋める個人情報 work item**。 design 全体の整合性には影響しない。

| 質問 | 回答 |
|---|---|
| Team size | Solo indie developer (`YuhtaIhara` / `delight-x.co.jp`) |
| Prior XR experience | EVEN Realities G2 daily user since [TODO: 着用開始日を埋める]、 HUD UX を消費者として深く理解 |
| Prior Android experience | [TODO: Kotlin / Android 経験年数 / 公開実績を埋める] |
| Domain expertise | Daily home cook of Indian / spice-based cuisine (dogfood guarantee) |
| Open source / portfolio | https://github.com/YuhtaIhara ([TODO: pinned repo 整理]) |
| Concept validation | Wet-hand recipe access is a personal pain validated for years on G2 (HUD only, no camera) |

### Funding Requirements (Clear Articulation)

**Request**: USD 1,500–2,500 (≈ 22–37 万円) non-recoupable grant、 milestone 配分

| Milestone | 配分 | 使途 |
|---|---|---|
| 契約締結 (8 月) | 30% | Vertex AI / Gemini API 初期 quota、 Play Console 登録 |
| 技術設計完了 (11 月) | 40% | Gemini API runtime cost (DP4-Beta 期間の prototype 回転)、 fixture 撮影費 |
| Play 公開 (4 月) | 30% | リリース後 1 ヶ月間の Gemini cost buffer + dogfood テスター謝礼 |

> "Funding will primarily cover Gemini API costs during iterative vision-prompt tuning (the core differentiator), where each test cycle through 5 templates × 30 vision checks adds up quickly for a solo developer."

### Form Factor Selection

要求 HW:

- ☑ **Project Aura** (XREAL prototype) — primary dev target
- ☑ **Display glasses** (production design) — final form factor validation
- ☑ **Audio glasses** — degraded-mode (HUD なし環境) で audio-only conductor 動作確認

### Tech Stack

- **Primary**: Kotlin + Jetpack XR SDK (DP4 → Beta)
- **UI**: Jetpack Compose Glimmer
- **3D / Scene**: Jetpack SceneCore (camera frame 取得)
- **AI**: Gemini 2.x multimodal via Vertex AI (or Gemini Direct API)
- **Auth**: Google OAuth 2.0 (個人 Google Cloud project)
- **Distribution**: Google Play (Android XR target)

### Timeline (6-12 ヶ月 Play 公開逆算)

```
2026-07-15  採択判明
2026-08     HW kit 受領、 spice-sutra repo bootstrap
2026-08-09  DP4 で UI prototype (HUD layout、 emulator)
2026-10-11  Gemini integration (parseRecipe + planTimeline)
2026-12     実機 alpha (Phase 1+2 完成、 dogfood 開始)
2027-01-02  VisionWatcher 実装 + 周期 chk 精度 tuning
2027-03     beta、 友人 dogfood 3 名
2027-04-30  Play 公開 (MVP: 5 テンプレ Indian recipes)
```

### AI 痕跡対応

- pitch 本文に「AI 主体表現」 入れない (CLAUDE.md 規約)
- 「AI-driven development」 等は不使用、 「solo indie developer」 で統一

---

## 10. 将来拡張 / 採択後 follow-up

### v2 以降の roadmap (pitch では 1-2 行触れる程度)

- **Recipe library expansion**: 他複雑並列料理 (Thai curry / Japanese kaiseki / 中華大皿) への展開
- **振り返り / 学習機能**: 終了後の完成度評価 / 写真 / 感想ログ、 上達曲線可視化 (削った案 B)
- **Shared cooking sessions**: 同レシピを家族 / 友人とリレー調理、 cloud sync (削った案 C)
- **Cross-platform partnership**: audio-glass / camera 無し XR vendor (EVEN Realities G2 + R1 ring 等) との SDK 連携検討

### 採択後 follow-up (今 session では作業しない、 ここに記録)

#### 1. repo 分離 (2026-07-15+ 採択判明後)

採択判明と同時に新 repo `~/work/google/spice-sutra/` を `ai-driven-template` から bootstrap:

```
~/work/google/spice-sutra/  ← 新 repo
  ├ app/                    ← Kotlin Android app
  ├ .claude/                ← ai-driven-template から派生
  ├ docs/
  └ README.md
```

`google-xr-ops/project-aura/apps/` placeholder は削除 or "see spice-sutra repo" 1 行に置換。 ops 側は pitch / design doc / 振り返り保管に専念。

#### 2. G2 / EVEN 協業 path 検討 (2026-07-15+ 採択判明後)

採択判明後に「EVEN コンタクト検討」 task を以下のどこかに起票:

- `google-xr-ops/issues/` (GitHub Issues)
- or `even-conversate-ops/` 側 (EVEN bucket の方が文脈近い)

検討事項:

- EVEN の公式 SDK / Developer Program 確認 (2026 時点で未公開だが要再調査)
- G2 + R1 ring を入力 device として使う技術調査 (BLE protocol、 公式 SDK 待ち)
- 「camera 無し版」 = timer 強化版 + R1 操作 として成立するか PoC
- EVEN 窓口へ cold contact (Catalyst credibility = Google 採択された事実を持参) → メール / LinkedIn / X
- 「Indian cooking conductor は Android XR ネイティブ、 G2 sister app を partner 開発で出したい」 提案

**戦略的順序**: Aura 採択 (Google credibility) → EVEN にアプローチ。 逆順 (今 EVEN cold contact) は反応時間読めず Aura 締切を脅かす risk あり。

#### 3. Catalyst pitch では「multi-platform vision」 1 行のみ言及

- pitch 本文 (Section 8 既載) に "future expansion to audio-glass / camera-less XR vendors" として軽く触れる
- focus 散漫印象を避けるため、 1st version Android XR フォーカスは死守

---

## 11. 関連 docs

- 前 session ハンドオフ: `../../2026-05-20-android-xr-catalyst-handoff.md`
- Catalyst Program 概要: `../../../project-aura/README.md`
- ops 設計累積: `../../google-xr-design.md`
- 公式ランディング: https://developer.android.com/develop/xr/catalyst (短縮 `g.co/dev/catalyst`)
- 応募フォーム: https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform
- 応募締切: **2026-06-30 23:59 PDT** (= JST 2026-07-01 15:59)
- 結果通知: 2026-07-15 まで
