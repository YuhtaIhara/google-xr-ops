# Snapshot: Android XR Developer Catalyst — landing page

| 項目 | 値 |
|---|---|
| source id | catalyst-landing |
| URL | https://developer.android.com/develop/xr/catalyst |
| fetched | 2026-05-23 (初回) / 2026-06-12 (再 fetch) |
| method | WebFetch |
| 用途 | Sotto pitch の根拠 URL、 締切 / 配送地域 / 評価軸 / 提供物の正本 |

## 抽出情報

### 応募締切

**June 30, 2026 by 11:59 PM PDT** (= JST 2026-07-01 15:59)

### 結果通知

**July 15, 2026** (no later than)

### Hardware Distribution Regions

- 🇺🇸 United States
- 🇯🇵 Japan
- 🇬🇧 United Kingdom
- 🇪🇺 European Union

### Selection Criteria (評価軸)

1. **Vertical alignment** (Media & Entertainment, Gaming, Productivity & Learning など)
2. **Developer readiness** (開発準備状況)
3. **Clear articulation of funding requirements** (資金要件の明確性)

### 提供物 (Benefits)

| 項目 | 詳細 |
|---|---|
| Hardware | XREAL's Project Aura (wired XR glasses) / Audio glasses / Display glasses の開発キット |
| Grant | Non-recoupable grants (金額は個別決定、 milestone 達成時に分配) |
| Technical Resources | 専門技術サポート、 Google Play への公開支援 |

## 2026-05-21 確認時点との変更検知

- 確認できる範囲では変更なし (締切 / 評価軸 / 提供物 が前回確認時と一致)
- 但し WebFetch では timestamp 比較困難、 user が web で再 visit して subjective 差分検知すると確実

## 2026-06-12 再 fetch (提出後)

- **変更なし**: 締切 (6-30 11:59 PM PDT) / 結果通知 (7-15 まで) / 配送地域 (US/JP/UK/EU) / 評価軸 3 つ / 提供物、 全て 5-23 snapshot と一致。 cohort 2 / 締切延長 / FAQ 追加の記載なし
- **微差分 (form 側のみ)**: 応募 form の intro は配送対象に **CA (カナダ) を追加済** (「US, CA, UK, EU, and Japan」、 2026-06-12 提出時確認) だが、 本 landing page は US/JP/UK/EU のまま。 Japan が対象である事実に影響なし
- 同日、 応募 form 自体には構造変更あり (use case セクション新設等) → `../../../project-aura/application/form-structure-2026.md` の 2026-06-12 差分参照

## Sotto pitch への影響

- **Selection Criteria** が `Vertical / Readiness / Articulation` の 3 軸である事実は spec § 9 で既に反映済 (Sotto narrative は 3 軸全部に対応した構造)
- **Hardware Distribution に Japan 含む** → user の対象地域 APAC = OK
- **Non-recoupable grants** → "No grant required" 選択でも program 全体の grant 哲学に矛盾しない、 Sotto の funding articulation narrative は維持
