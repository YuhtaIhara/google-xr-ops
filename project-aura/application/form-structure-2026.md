# Catalyst Program 応募 form 実物の構造 (2026-05-21 確認)

> 公式 form (https://docs.google.com/forms/d/e/1FAIpQLSesZlBGg010S0K9Xm5ZvxTt2WMzHGnKtBUYEhBrzd0_uwmHEA/viewform) を `iharayuhta@gmail.com` で開いて確認した実物項目の正本。 設計 spec (`docs/superpowers/specs/2026-05-21-spice-sutra-design.md`) § 9 で行った推定との差分を末尾に記録。

確認日: 2026-05-21 / 確認 account: iharayuhta@gmail.com

---

## form 全体

- 4 page 構成 (順次切替)
- 言語: 英語
- 提出 account: 個人 Google アカウント (`iharayuhta@gmail.com` で開く前提)
- 添付: 最大 5 ファイル / 各 100MB / 形式制限不明
- 締切: **Applications close June 30, 2026, at 11:59 PM PDT** (= JST 2026-07-01 15:59)

公式 intro 引用:
> Welcome to the Android XR Developer Catalyst Program application! We are looking for innovative developers and studios ready to build the next generation of extended reality experiences for Android XR.
>
> The Benefits: Selected developers receive pre-release hardware development kits (including XREAL's Project Aura, display, or audio glasses) and technical resources.
>
> Eligibility: Open to developers planning to launch an Android XR app within the next 6–12 months. (Note: Hardware distribution is currently limited to the US, UK, EU, and Japan).
>
> Form Factors: If you are applying for both wired XR glasses (immersive experiences) and audio or display glasses (augmented experiences), please submit a separate application for each.

---

## Page 1: Company / Contact / Region

| Q | 必須 | 形式 | 選択肢 / メモ |
|---|---|---|---|
| Company Name | ✅ | 短文 | 個人 indie でも入力必須。 申請主体名 (法人名でなくても OK)。 → 確定: `Yuhta Ihara` |
| Company website | — | 短文 | — |
| Primary Contact Name | ✅ | 短文 | — |
| Primary Contact Email | ✅ | 短文 | `iharayuhta@gmail.com` 想定 |
| Job title | ✅ | 短文 | indie だと「Indie Developer」 「Founder」 等 |
| Region | ✅ | 単一選択 | North America / LATAM / APAC / EMEA / その他 → **APAC** |
| Country | ✅ | 短文 | Japan |
| Company Address | ✅ | 短文 | user の住所 |

---

## Page 2: Understanding XR development journey

| Q | 必須 | 形式 | 選択肢 / メモ |
|---|---|---|---|
| Previous development experience (XR and otherwise) | ✅ | 長文 | 質問説明: "Tell us more about your company! Have you previously published an app? Experience on an existing XR or AR platform? Want to brag a little?" → spec § 9 Developer Readiness の narrative がここに集約 |
| Existing apps | — | 自由記述 (links) | "Do you have an existing XR, mobile, or other application(s)? If so, please provide links" → portfolio URL / GitHub 等 |
| Tech stack | ✅ | 複数選択 | **Android with Compose** / Android with Views / Godot / Unity / Unreal / Native OpenXR / その他 → Spice Sutra は **Android with Compose** 選択 |
| Unity version | — | 短文 | Unity 選択時のみ、 Spice Sutra は N/A |
| Unity render pipeline | — | 単一選択 | Built-In / Universal / Custom / N/A / その他 → N/A |
| Graphics API | — | 単一選択 | Auto / OpenGL / Vulkan / Other / N/A → N/A (Compose 経由) もしくは Auto |
| Opt-in Android XR dev updates email | ✅ | yes/no | yes 推奨 |

---

## Page 3: Tell us more about your app

| Q | 必須 | 形式 | 選択肢 / メモ |
|---|---|---|---|
| Elevator pitch | ✅ | 長文 | "Please add an elevator pitch for the experience and use case(s) that you'd like to bring to Android XR" → spec § 9 Use Case + Vertical narrative |
| Upload supporting files | — | ファイル | **最大 5 / 各 100MB**。 pitch deck / design docs / trailer/demos 等。 → **設計 spec PDF + plan PDF + (Task 6) PoC 動画/screenshot** を添付候補 |
| Category | ✅ | 複数選択 | Media & Entertainment / Gaming / Sports / **Productivity** / Social / **Health & Wellness** / Messaging & Chat / Commerce & Payments / Navigation / **Education** / Enterprise / その他 → Spice Sutra は **Productivity + Health & Wellness + Education** の 3 つ |
| Existing port link | — | 短文 | "If you plan to port or adapt an existing app, please share a link" → Spice Sutra は新規、 空欄 |
| Development progress | ✅ | 0-10 scale | 0 (haven't started) 〜 10 (completed, ready to port)。 Spice Sutra は **1-2 想定** (design 完了 / PoC 着手前 〜 PoC 1 画面)、 plan Task 6 PoC 完了で **2** に bump |
| Target Launch Regions | ✅ | 複数選択 | North America / EMEA / **JAPAC** / LATAM / **Global** → Spice Sutra は **Global** (Indian cooking diaspora 含む) |
| Estimated launch date | ✅ | 日付 | **2027-04-30** (spec § 9 Timeline) |
| Hardware form factor | ✅ | 単一選択 | **Wired XR glasses** / **Display & Audio glasses** ← 排他、 両方なら別 form。 Spice Sutra は **Display & Audio glasses** 選択 |

---

## Page 4: Glasses Innovation Grant + Acknowledgements

| Q | 必須 | 形式 | 選択肢 / メモ |
|---|---|---|---|
| Grant amount | ✅ | 単一選択 | **No grant required** / $10,000 USD / $15,000 USD / $20,000 USD → Spice Sutra は **No grant required** 選択 (採用率上げる姿勢、 Gemini cost 自費賄える) |
| Program Acknowledgements | ✅ | 2 checkbox 必須 | (1) I understand that if selected, my team will be required to sign standard digital agreements. (2) I understand that funding is milestone-based. |

---

## spec § 9 推定との差分 (重要、 spec 改訂で吸収)

### 差分 1: **Form Factor は排他**

- spec § 9 で書いた「☑ Project Aura + Display + Audio **3 種**を 1 form で要求」 は **不可**
- 選択肢は **2 択** (Wired XR / Display & Audio)、 両方なら **別 form 2 通**
- **採用判断**: **Display & Audio glasses** (production form factor 同じ、 Spice Sutra core の Display+Audio+Camera と直接 fit、 MVP がそのまま製品に乗る)
- spec § 9 Form Factor Selection section を全面差し替え予定

### 差分 2: **Grant 金額は固定 4 択 (min $10,000)**

- spec § 9 で書いた USD 1,500-2,500 (≈ 22-37 万円) は **選択肢に無い**
- 選択肢: No grant required / $10K / $15K / $20K
- "Limited grants at each level exist" 文言、 $10K でも申請枠厳しい可能性
- **採用判断**: **No grant required** (HW kit + technical resources のみ、 indie の Gemini cost は自費 5-15 万円/年で十分賄える、 採用率上げる姿勢)
- spec § 9 Funding Requirements section + Milestone 表を全面差し替え予定

### 差分 3: **添付ファイル 5 個 / 各 100MB が pitch を補強できる**

- spec 推定では「elevator pitch 1 段落」 のみ想定だったが、 実物は **pitch deck / design docs / trailer/demos** のファイル添付欄あり
- → **設計 spec を PDF 化して添付** が大きな winning move (indie 1 人で「ここまで設計済」 を 30 秒で証明)
- 添付候補:
  1. `2026-05-21-spice-sutra-design.md` → PDF
  2. `2026-05-21-spice-sutra-catalyst-application.md` → PDF (plan、 「実行体制」 証拠)
  3. (Task 6) PoC screenshot / 動画
- AI 痕跡を残さない (CLAUDE.md 規約) → PDF 内も「AI 駆動」 主体表現避ける、 既存 spec / plan は規約準拠済

### 差分 4 (細部): **Vertical Category 名称**

- spec 推定: 「Productivity & Learning」 1 つ
- 実物: 「Productivity」 「Education」 別、 さらに「Sports」 「Enterprise」 個別あり
- Spice Sutra は **Productivity + Health & Wellness + Education** の 3 つ multi-select 推奨

### 差分 5 (細部): **Development progress 0-10 scale 必須**

- spec 未推定の軸。 PoC 状況で 1 → 2 に進む
- Task 6 (DP4 emulator で mock HUD) 完了が **本軸の説得力に直結**、 optional から **必須に格上げ** 推奨

### 差分 6 (細部): **Company section 7 項目必須**

- spec 推定無し
- indie でも Company Name / website / region / country / address 全て必須
- 申請主体は **個人 (Individual)** で確定 (会社案件ではない、 開業届なし、 副業申告なし)。 Company Name = `Yuhta Ihara`

---

---

## Sotto 適用時の項目別整合 (2026-05-23 追記、 Sotto pivot 反映)

> 応募 form 自体は同一 (2026-05-21 確認時点)、 本 section は Spice Sutra → Sotto pivot 後に「同じ form の各項目で値がどう変わるか」 を 1 対 1 で照合する正本。 spec § 9 の Sotto narrative と form 各項目の対応はここを base とする。

### form 自体の変更検知 (☑ 2026-06-12 実施、 構造変更あり → 下記差分)

- [x] 公式 form を `iharayuhta@gmail.com` で再 open し全 page 確認 (2026-06-12、 提出と同時実施)
- 変更検知 → 「2026-06-12 差分」 subsection に記録 (下記)

### 2026-06-12 差分 (提出時確認、 **構造変更あり**)

1. **新セクション「Glasses use cases & requirements」追加** (旧 Page 3 と Grant page の間)。 最大 5 use case、 use case ごとに 7 問:
   - 記述 (必須・長文、 例示 3 つ付き) / form factor 適合 (Audio / Display / Both) / launch 優先度 (Required for launch- H1 2026 / Nice to have / Future-looking 2+ years / Dream 4+ years) / 成功計測方法 (任意) / 必要 XR capability (必須 multi-select: Notifications / Audio / Camera access / UI framework / Scene understanding / VPS localization / Spatial Audio / その他) / capability 必要理由 (任意) / 「次の use case を追加?」 (Yes/No 分岐)
2. **新セクション「Use Cases: Stack Rank activity」追加**: use case #1-5 を 1-5 or N/A で順位付け (必須 grid)
3. eligibility 文言に **CA (カナダ) 追加** (「US, CA, UK, EU, and Japan」)
4. 旧 4 page (Company / XR journey / App / Grant+Ack) の項目・選択肢は変更なし

**提出時の対応 (2026-06-12)**: 原稿が無い新セクションは設計 spec の確定内容から英文を新規作成して回答 (UC#1 = core engineer retrieval HUD / UC#2 = expansion 経営者 persona、 rank 1-2 + N/A×3)。 全回答の verbatim 記録は `submission-record-2026-06-12.md` 参照。

### Page 1 (Company / Contact / Region) — Sotto 用変更なし

Spice Sutra と同じ値:
- Company Name: `Yuhta Ihara`
- Job title: `Indie Developer`
- Region: APAC / Country: Japan
- Primary Contact: Yuhta Ihara / iharayuhta@gmail.com

### Page 2 (XR Development Journey) — narrative 全面書換

| Q | Spice Sutra 値 | Sotto 値 | 差分理由 |
|---|---|---|---|
| Previous development experience (long-form) | Indian cooking domain expertise + G2 wet-hand HUD validation | even-memory-bridge dogfood 5 ヶ月 + engineer context switching の daily 痛み + Kotlin 1 年未満 (採択後習得) | domain pivot (cooking → engineer)、 concept validation 軸を G2 personal HUD experiment → memory-bridge frozen PJ に置換 |
| Existing apps (links) | Spice Sutra design 含む portfolio | 同じ URL set、 narrative の重心が `even-memory-bridge` (Sotto の前身) に移動 | pin 6 個は同一、 文中の言及順序のみ変更 |
| Tech stack | Android with Compose | Android with Compose | 同じ |
| Unity-specific fields | N/A | N/A | 同じ |
| Opt-in dev updates | Yes | Yes | 同じ |

### Page 3 (App overview) — Category + Elevator pitch + PoC が全面書換

| Q | Spice Sutra 値 | Sotto 値 | 差分理由 |
|---|---|---|---|
| Elevator pitch | "Indian home cooking demands precision on two axes..." (cooking conductor narrative) | "Engineers and tech founders carry too much technical context..." (memory extension narrative) | concept 完全 pivot |
| Upload supporting files | spice-sutra-design.pdf / spice-sutra-catalyst-application.pdf / hud-overview.png (cooking) / architecture.png | sotto-design.pdf / sotto-catalyst-application.pdf / sotto-even-component-reuse.pdf / sotto-hud-overview.png (engineer) / sotto-architecture.png (任意) | 添付 5 枠目に even-component-reuse.pdf 追加 (流用率 60-70% を可視化) |
| Category (multi-select) | Productivity + Health & Wellness + Education | **Productivity + Enterprise + Education** | Health & Wellness は cooking 専用、 engineer / 経営者 / 商談 context は Enterprise 軸 |
| Existing port link | N/A (新規) | N/A (新規) | 同じ (Sotto は新規開発、 ただし memory-bridge frozen を「概念的 prior art」 として narrative に組込み) |
| Development progress (0-10) | 2 (design + cooking PoC 完了) | **2** (design + Even RAG 完成品所持 + engineer PoC 完了) | 同じ score、 根拠が cooking PoC → engineer PoC + Even repo 完成品 (memory-bridge RAG pipeline) に変化 |
| Target Launch Regions | Global | Global | 同じ (engineer 需要は世界中) |
| Estimated launch date | 2027-04-30 | 2027-04-30 | 同じ (9 ヶ月 window) |
| Hardware form factor | Display & Audio glasses | Display & Audio glasses | 同じ (cooking の hands-free 必要性 → engineer の社交装着適合性、 結論は同じ form factor) |

### Page 4 (Grant + Acknowledgements) — 値変更なし、 narrative 強化

| Q | Spice Sutra 値 | Sotto 値 | 差分理由 |
|---|---|---|---|
| Grant amount | No grant required | No grant required | 同じ |
| Grant articulation narrative | Gemini cost 年 5-15 万円 自費賄える | STT + Gemini + Vector Search cost 年 10-25 万円 + **Even repo 流用率 60-70%** で開発工数を 3-4 倍 leverage | cost 試算微増 (STT + Vector Search 追加分)、 流用率の説得力で No grant の自信を強化 |
| Acknowledgements (2 checkbox) | 両方 ☑ | 両方 ☑ | 同じ |

### Sotto narrative の key 強み (Spice Sutra 比較)

1. **dogfood guarantee がより強固**: cooking は user が「daily 体感」 と書いたが engineer context switching は user 自身が中堅 indie として **daily に直接苦しんでいる**、 説得力が 1 段違う
2. **concept validation が PJ-backed**: G2 personal HUD experiment (Sutra の subjective evidence) → even-memory-bridge frozen PJ + 5 ヶ月 dogfood 実績 (Sotto の portfolio-backed evidence)
3. **Even repo 流用率 60-70%** = indie 1 人 9 ヶ月 で Play 公開する**現実性の最大根拠**、 No grant required の自信を後押し
4. **判定者刺さりやすい**: cooking は印象的だが reviewer が engineer = Sotto の use case は reviewer 自身が「私も欲しい」 と直感、 採用確度上
5. **privacy 先回り強化**: brand 名 Sotto (sotto voce) が「ささやく / 押し付けない」 を 1 word で示唆、 mic 録音の社会受容懸念に対する 先回り response

### Sotto narrative の risk (Sutra 比較)

1. **印象残り度**: 「日本 indie のスパイスカレー」 ほど印象的でない可能性。 mitigation: even-memory-bridge frozen PJ + 5 ヶ月 dogfood + Even repo 流用率の組合せで「実装力の indie」 印象を強化、 印象パワーは「実装証拠」 軸で勝負
2. **市場 crowded**: meeting AI (Otter / Fireflies / Granola 等) と並べると一見「また meeting AI?」。 mitigation: spec § 2 の差別化表 (real-time visual HUD × 個人 corpus × engineer 特化 の 3 軸交差) を pitch elevator で 2-3 行で叩き込む
3. **privacy 懸念で reviewer hesitate**: mic 録音は社会受容懸念高い領域。 mitigation: pitch + spec § 7 で privacy design (ephemeral / masking / user-only display) を先回り、 brand 名 Sotto で安心感 signal

---

## 関連

- 設計 spec: `../../docs/superpowers/specs/2026-05-23-sotto-design.md` (current、 § 9 と本 section が 1 対 1 で整合)
- 前身 spec (deprecated): `../../docs/superpowers/specs/2026-05-21-spice-sutra-design.md`
- Even repo 流用 component リスト: `../../docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`
- 応募 plan: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- 公式 source: `../../knowledge/google-xr-official/sources.yml` (catalyst-landing / catalyst-blog-2026-05 / jetpack-xr-dp4)
