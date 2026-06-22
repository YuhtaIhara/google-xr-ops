# Pitch Self-Review (2026-05-22)

## Checklist 結果 (Part 1)

各項目: ◯ (pass) / △ (要注意) / ✗ (不十分) + 一言根拠

| # | 項目 | 判定 | 根拠 / line reference |
|---|---|---|---|
| 1 | 各 form 項目が文字数制限内 | ◯ | Elevator pitch: 316 words (target 200-400)。 他全セクションは short-answer or bullet list で問題なし |
| 2 | 英文が自然 | △ | § Target Launch Regions (line 247) に "a broad diaspora — the broader Indian diaspora" と同義語重複あり → **修正済** |
| 3 | Vertical Alignment が Productivity + Health & Wellness + Education で一貫 | ◯ | § Category (line 185-197)、 elevator pitch 末段 (single vertical)、 spec § 9 全て 3 multi で一致 |
| 4 | Use Case 1 段落が「parallel + spices + wet hands + vision-aware」 4 要素全部入っている | ◯ | Elevator pitch 第 1 段落: "true parallel execution"、 "dozens of spices" (implied by tempering sequence)、 "your hands are wet, spiced"、 "periodic vision-aware step checking" (第 3 段落末) — 4 要素確認 |
| 5 | Developer Readiness の確定値反映済 | ◯ | solo indie / Kotlin <1 年 / G2 since 2026-03 Conversate / 住所 [REDACTED] — 全て反映 (line 60-84) |
| 6 | 住所は `[REDACTED]` プレースホルダ | ◯ | line 37: `[REDACTED — 個人住所、 commit 対象外...]` — commit 安全 |
| 7 | Funding が No grant required + rationale | ◯ | § Grant Amount (line 299-315): No grant required 選択、 "50,000–150,000 JPY per year" 試算で rationale 明記。 古い USD 1,500-2,500 表現は残存ゼロ |
| 8 | Form Factor が Display & Audio glasses 1 択 + rationale | ◯ | § Hardware Form Factor (line 277-295): Display & Audio glasses のみ選択、 wired 非選択の理由 (mobility) 明記。 旧 3 種同時要求の残存ゼロ |
| 9 | Tech Stack に Android with Compose 明記 | ◯ | § Tech Stack (line 113): "Primary selection: **Android with Compose**" (verbatim form 選択肢名) |
| 10 | Timeline 2027-04-30 Play 公開 | ◯ | § Estimated Launch Date (line 263): "**2027-04-30**" |
| 11 | Open source URL が動く | △ | `https://github.com/YuhtaIhara` は記載済 (line 32, 66, 92)。 ただし `google-xr-ops` と `ai-driven-template` の PUBLIC 化は Task 5 未完了のため、 form 提出前に確認要。 profile README の存在も Task 5 の作業項目 |
| 12 | AI 痕跡 / 主体表現がない | △ | § Existing Apps (line 95) の form 提出用英文に "a personal AI-assisted development starter template" という記述あり。 これは repo の事実上の名称・説明 (`ai-driven-template`) であり、 「この pitch が AI 生成」 という主体表現ではないため致命的ではない。 ただし form 提出時は "a development starter template for AI-assisted coding workflows" 等の言い換えを検討 |
| 13 | 会社名 `(会社名)` / `(会社ドメイン)` 露出ゼロ | ◯ | grep ヒットなし — クリーン |
| 14 | Category 3 multi | ◯ | line 185-197: Productivity + Health & Wellness + Education |
| 15 | Target Region Global | ◯ | line 244-250: Global 選択 + rationale |
| 16 | Development progress 1 (current) → 2 (Task 6 完了想定) | ◯ | line 222-229: current 1/10、 target 2/10 (Task 6 gating)、 re-evaluation note 付き |
| 17 | Acknowledgements 2 checkbox 確認意思明記 | ◯ | § Acknowledgements (line 319-334): 両方の checkbox 内容を転記し "will be checked" 明記 |
| 18 | Page 1-4 全項目 section に存在 | ◯ | form-structure-2026.md の全必須項目が pitch-outline.md の各 § に対応。 form 項目対応表 (line 6-23) で明示 |

**Part 1 サマリ**: ◯ 15 / △ 3 / ✗ 0。 ✗ ゼロ。 △ のうち実害あるのは #11 (Task 5 依存) のみ。

---

## 査定者シミュレーション (Part 2)

仮想査定者として pitch を読み、 5 角度で評価。

| 角度 | 判定 | 根拠 |
|---|---|---|
| 1. 「日本の indie がスパイスカレーアプリ」 で 30 秒で印象残るか? | ◯ | Elevator pitch 第 1 段落の "strict tempering sequence (cumin → onion → garlic-ginger → tomato → spice powders → protein, with no margin for misordering)" が非常に具体的で記憶に残る。 "your hands are wet, spiced, and unusable" も pain が即視覚化できる。 北米査定者にとって「日本人が Indian cooking 特化 XR」 は異質だが、 dogfood guarantee が説得力でそれを補う |
| 2. 「6-12 ヶ月で Play 公開」 が現実的に見えるか? | △ | 「Kotlin/Android <1 年」 を正直に開示しており誠実だが、 その弱点に対する counterweight が "the depth of design work already completed" 1 文で止まっている。 spec + plan が添付される想定だが、 text だけ読む査定者には「設計が終わっているから実装できる」 論理が不十分に見える可能性がある。 § Developer Readiness に "11-section spec" と "10-task plan" の規模感を 1 行加えると補強になる |
| 3. 「indie 1 人なのに完成度高そう」 と見えるか? | ◯ | "see attached spec and plan" の言及あり (line 62)。 § Supporting Files (line 161-177) で spec PDF + plan PDF + PoC demo の 5 ファイル構成が明示されており、 添付の存在感は十分。 portfolio の repo 名が具体的で読める |
| 4. 「Gemini API cost が膨らんで途中で詰まる」 印象がないか? | ◯ | § Grant Amount の "50,000–150,000 JPY per year for a solo developer running personal usage volumes" が具体的な金額根拠として機能している。 JPY 表記は一部査定者にはわかりにくい可能性があるが、 "well within personal budget" の宣言で十分カバー |
| 5. 「solo indie で 9 ヶ月で完成しなさそう」 印象を打ち消す要素があるか? | △ | Elevator pitch 末段に "narrow enough for a solo developer to ship in nine months" はあるが、 これは宣言であって根拠ではない。 § Developer Readiness に "design complete → PoC → alpha → beta dogfood → Play" の milestone を 1 行で示せると、 「計画ベースの主張」 から「実行経路のある主張」 に変わる。 § Estimated Launch Date に "Detailed milestone schedule available in the supporting plan document" があるので添付依存ではあるが、 text 単独でもう一押しある方が安全 |

**査定者シミュ サマリ**: ◯ 3 / △ 2 / ✗ 0。 2 つの △ はいずれも「text 単独の説得力不足、 添付 PDF で補完されるが text だけ読む場合の弱点」 パターン。

---

## 発見した issues

| # | 内容 | Severity | 対応 |
|---|---|---|---|
| I-1 | § Target Launch Regions (line 247): "a broad diaspora — the broader Indian diaspora" — 同義語重複、 英文品質低下 | Minor | **修正済** ("a wide diaspora — eligible markets (US, UK, EU, Japan)..." に変更) |
| I-2 | § Previous Development Experience: Kotlin <1 年の弱点に対して "depth of design work" 1 文の counterweight のみ。 spec 規模 (11 sections / 約 530 行) を明示すると添付依存を下げられる | Minor | T8 final-draft 段階で 1 文追加を推奨 |
| I-3 | § Estimated Launch Date: milestone が "Detailed milestone schedule available in the supporting plan document" 1 文のみ。 key milestone を 3-4 個箇条書きで示すと text だけで timeline 説得力が出る | Minor | T8 final-draft 段階で追加を推奨 |
| I-4 | § Existing Apps: "a personal AI-assisted development starter template" — repo の事実的説明だが form 提出時には "development starter template (`.claude/` workflow patterns)" 程度の言い換えが無難 | Minor | T8 final-draft 段階で検討 |
| I-5 | GitHub portfolio PUBLIC 化 (google-xr-ops + ai-driven-template + profile README) は Task 5 の作業項目のため、 form 提出前に確認必須 | External dep | Task 5 / Task 9 で確認 |

---

## 修正反映

- **I-1 のみ pitch-outline.md に直接反映** (微修正、 scope は最小限)
  - 変更: § Target Launch Regions の英文 1 文を修正
  - diff: "a broad diaspora — the broader Indian diaspora across eligible markets" → "a wide diaspora — eligible markets"
- I-2 / I-3 / I-4 は T8 (form-final-draft.md) 段階での追記・調整を推奨。 pitch-outline.md の構造変更は行わない

commit SHA: (本 commit で付与)

---

## 外部 review (Step 3)

skip。

理由: 5 週間制約 (2026-06-30 締切)、 機密度の問題 (採用前提の draft、 漏洩は致命でないが軽い注意が必要)、 self-review + 査定者シミュでの 5 角度評価で十分な quality 確認ができたと判断。 ✗ ゼロ、 致命的弱点なし。

採択判明後 (2026-07-15+) の post-mortem で「もし外部 review してたら何が変わったか」 を retrospect 候補に追加。

---

## Conclusion

Task 7 完了。 T8 (form-final-draft.md) に進む準備整った。

**T8 implementer へ引き継ぎ事項:**

1. **I-2 対応**: § Previous Development Experience に "The attached spec runs to 11 sections covering architecture through testing strategy; the plan to 10 tasks." 程度の 1 文を追加し、 添付なしでも設計規模感が伝わるようにする。
2. **I-3 対応**: § Estimated Launch Date に key milestone 3-4 個を箇条書きで追加 (例: "2026-08 hardware receipt → 2026-10 DP4 prototype → 2027-01 real-device alpha → 2027-04 Play submission")。
3. **I-4 対応**: § Existing Apps の `ai-driven-template` 説明文を form 提出用として "development starter template (`.claude/` workflow patterns)" に言い換え。
4. **I-5 確認**: T8 / T9 で GitHub profile の PUBLIC 化状態を確認してから form-final-draft に URL を確定。
5. **JPY 表記**: § Grant Amount の "50,000–150,000 JPY" は form 提出者 (日本人) の視点では明快だが、 final-draft では "approx. USD 350–1,050 per year" 等の併記も検討可。
