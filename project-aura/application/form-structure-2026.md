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

## 関連

- 設計 spec: `../../docs/superpowers/specs/2026-05-21-spice-sutra-design.md` (§ 9 改訂対象)
- 応募 plan: `../../docs/superpowers/plans/2026-05-21-spice-sutra-catalyst-application.md`
- 公式 source: `../../knowledge/google-xr-official/sources.yml` (catalyst-landing / catalyst-blog-2026-05)
