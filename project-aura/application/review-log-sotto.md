# Sotto Pitch Self-Review (2026-05-26)

> Catalyst form 提出前の最終 quality 確認 (plan T7)。 `pitch-outline-sotto.md` (2026-05-24 確定、 commit 8a79d76) を対象に、 13 項目 checklist + 6 角度査定者シミュレーション + 発見 issues + 修正反映方針 を集約。
>
> Spice Sutra 期の `review-log.md` (2026-05-22) の framework を流用、 内容は Sotto pivot 後の論点に書換。 外部 review (Step 3) は skip 判断 (理由 §「外部 review」 参照)。

## Checklist 結果 (Part 1)

各項目: ◯ (pass) / △ (要注意) / ✗ (不十分) + 一言根拠 / line reference は `pitch-outline-sotto.md` 内行番号。

| # | 項目 | 判定 | 根拠 |
|---|---|---|---|
| 1 | 各 form 項目が文字数制限内 | △ | Elevator pitch (line 165-171): 英文 4 段落で約 **315 words**、 outline コメント記載 target **280-310** を僅か超過 (5 words)。 form 上の hard limit は未確認だが、 余裕を持ちたい場合は 1 文短縮検討。 他全 section は short-answer / bullet / 単一段落で安全圏 |
| 2 | 英文が自然 | ◯ | spot-check で重複・不自然な構文なし。 line 64「The depth of design work already completed (see attached spec and plan) and the maturity of the reusable components ... are the leverage I bring against limited language experience」 がやや長文だが、 文意は明確 |
| 3 | Category が「Productivity + Enterprise + Education」 で一貫 | ◯ | § Category (line 216-218) + spec § 9 Vertical Alignment + elevator pitch 第 3 段落 (line 169) で「engineer-specific intent classification」 を Productivity 主軸の wording に統一。 Spice Sutra で外れた Health & Wellness の残骸なし |
| 4 | Elevator pitch が「engineer の dilemma + Sotto の介入 + Aura HW 優位」 3 要素全部入っている | ◯ | (a) dilemma: line 165 第 1 段落「carry too much technical context to recall on demand ... fumble ... phone lookup is socially impossible」 ✓ (b) 介入: line 167 第 2 段落「captures the question ... runs hybrid RAG ... renders ... user answers in their own voice」 ✓ (c) Aura HW 優位: line 169 第 3 段落「three-zone HUD ... no audio-only glasses platform can render」 ✓ |
| 5 | Developer Readiness 全て埋まっている (engineer 痛み + even-memory-bridge dogfood validation) | ◯ | § Previous Development Experience (line 60-86) で context switching 痛み + Kotlin <1y 正直開示 + G2 daily user + memory-bridge 5 months dogfood + portfolio + domain expertise 全て統合済。 personal-readiness.md § 3 + § 4 と完全 sync |
| 6 | Funding: No grant + Even repo 流用率 60-70% を強調 | ◯ | § Grant Amount (line 348-354): 冒頭 sentence で reuse 60-70% を前面化、 「Approximately 60–70% of components ... from the prior `even-memory-bridge` project」 と添付 doc 引用で realistic backup。 cost 試算 USD 700–1,750 / JPY 10–25 万円 明記 |
| 7 | Form Factor: Display & Audio glasses 排他選択 + 商談中装着 social 適合性 | ◯ | § Hardware Form Factor (line 318-336): 排他選択 + Wired 非選択の social 理由 + 「device on the user's face be socially acceptable」 明記。 immersive XR は scope 外と明示 |
| 8 | Tech Stack に Kotlin + Jetpack XR SDK DP4 + STT + Vertex AI Vector Search 明記 | ◯ | § Tech Stack (line 126-135) で全項目明記。 Whisper API (cloud, v1) → on-device (v2) の道筋も記載、 Auth Google OAuth 2.0 + 個人 Cloud project の privacy 設計も組込 |
| 9 | Timeline が「採択判明 → 9 ヶ月で Play 公開」 で書けている | ◯ | § Estimated Launch Date (line 300-308): 「Nine-month timeline from hardware kit receipt」 から alpha → beta dogfood → Play submission の経路を text で展開。 spec § 9 Timeline と整合 (2026-08 kit → 2027-04-30 Play) |
| 10 | Open source URL (github.com/YuhtaIhara) が動く、 even-memory-bridge が pin に含まれる | △ | URL は § Existing Apps (line 94) + § Previous Development Experience (line 68) で明示。 pin 構成は portfolio-prep.md § 2.4 で profile README 上 5 個確認済 (`even-memory-bridge` 含む)。 ただし **T5 manual step (profile README push + screenshot)** が未実施、 form 提出前に確認必須 |
| 11 | AI 痕跡 / 主体表現がない (CLAUDE.md 規約) | ◯ | grep で確認: 「AI-driven」 「AI-assisted」 等の主体表現は本文中ゼロ。 `ai-driven-template` は repo 名 (固有名詞、 変更不可)、 description は「workflow baseline starter (`.claude/` configuration patterns) reflecting solo-maintainable development practices」 で AI 主体表現を回避。 Spice Sutra 期 I-4 の問題 (「a personal AI-assisted development starter template」) は Sotto 版で既に clean |
| 12 | privacy / 社会受容 の説明が pitch 本文 + spec § 7 で揃っている (差別化 key) | ◯ | Elevator pitch 第 3 段落 (line 169) で 4 要素を 1 段落に集約: (a) personal corpus が user 個人 Google Cloud project 内、 (b) recordings ephemeral / no disk persistence、 (c) masking layer で PII / client identifier scrub、 (d) brand 名 sotto voce が design ethic を signal。 spec § 7 と完全 sync。 「録音されてる感」 への先回り済 |
| 13 | Spice Sutra との差分明示: portfolio + design doc に Spice Sutra 残骸が混ざっていない | ◯ | grep `spice\|sutra\|cooking\|recipe\|curry\|tempering\|cumin` で確認: 英文 form 提出用 block には残骸ゼロ。 ヒットは全て (a) 冒頭 metadata 注釈 (line 3, 5) (b) form 項目対応表の「Spice Sutra との差分」 列 (line 9, 11, 22) (c) 根拠 section の Spice Sutra との比較 (line 54, 114, 157, 204, 208, 236, 252, 272) — 全て内部 scaffolding、 form 提出英文には不出 |
| 14 | Supporting Files 5 個リストが realistic (PDF 化計画含む) | ◯ | § Supporting Files (line 188-202): sotto-design.pdf / sotto-catalyst-application.pdf / sotto-even-component-reuse.pdf / sotto-hud-overview.png / (optional) sotto-architecture.png の 5 構成、 PDF 化 timing は T9 で pandoc 実行と明記。 Spice Sutra にない `sotto-even-component-reuse.pdf` を 3 枠目に追加 (流用率 60-70% 主張の file-level evidence) は Sotto pitch の differentiator |
| 15 | Existing Port: N/A だが derived progression として Even repo 流用 evidence を軽く埋込 | ◯ | § Existing Port (line 244-248): 「N/A — new development」 で form 質問の意図を尊重しつつ、 「approximately 60–70% of the MVP backbone are derived from the prior even-memory-bridge project」 で reuse evidence を軽く再強調。 Spice Sutra 版より厚い narrative |

**Part 1 サマリ**: ◯ 13 / △ 2 / ✗ 0。

- ✗ ゼロ
- △ 2 は #1 (elevator pitch 315 words / target 310 を 5 超過) と #10 (T5 manual step 未実施)
- どちらも T8 (form-final-draft) または T9 (提出前 check) で吸収可能

## 査定者シミュレーション (Part 2)

仮想査定者として pitch を読み、 plan T7 Step 2 の 6 角度で評価。

| 角度 | 判定 | 根拠 |
|---|---|---|
| 1. 「engineer 向け memory extension HUD」 で 30 秒で印象残るか? | ◯ | Elevator pitch 第 1 段落の **"AI on a phone signals weakness"** が査定者 (技術 reviewer 想定) 直撃 phrase。 直後の "Phone lookup is socially impossible in a serious meeting" で問題の具体性が即視覚化。 Hook の強さは Spice Sutra の "spices, wet hands" 系より普遍的で多文化に通る (cooking pitch は北米 reviewer に「Japanese person Indian cooking」 という違和感を残したが、 engineer dilemma は地理依存なし) |
| 2. 「9 ヶ月で Play 公開」 が現実的に見えるか? (Even repo 流用 60-70% が key、 これが伝わっているか) | ◯ | § Previous Development Experience line 64 で「60–70% of the MVP backbone ... already exists as battle-tested Python and TypeScript code」 を明示、 添付 `sotto-even-component-reuse.pdf` 参照で file-level evidence。 § Grant Amount line 350 で「reuse reduces the new-code surface area to Kotlin porting plus Aura SDK integration」 と「9 ヶ月 well within」 を結論付け。 reuse 数字 (60-70%) が 3 箇所で繰返し reinforce されており「指南書通り 9 ヶ月で完成しなさそう」 印象を打ち消せる |
| 3. 「indie 1 人なのに完成度高そう」 と見えるか? (portfolio + PoC + even-memory-bridge dogfood evidence) | ◯ | (a) portfolio: § Existing Apps で even-memory-bridge を冒頭に置く言及順序が「prior project → Sotto natural progression」 narrative を強化、 (b) PoC: § Development Progress (line 262) で「Mock HUD PoC complete on DP4: Compose Glimmer three-zone engineer-specific layout」 を具体的に記述、 (c) dogfood: 5 months / 200+ self-dogfood が § Previous Development Experience + personal-readiness.md § 4 で繰返。 添付 spec PDF (11 sections, ~590 lines) + plan PDF (~920 lines) の規模感が完成度の物量証明 |
| 4. 「STT + Gemini cost が膨らんで途中で詰まる」 印象がないか? (cost 試算 + cost meter design で先回り) | ◯ | § Grant Amount line 352 で「Estimated operational cost ... approximately USD 700–1,750 per year (approximately 100,000–250,000 JPY) for a solo developer running personal usage volumes. This is within personal budget for an indie project.」 と USD + JPY 両方で具体額を提示。 JPY 単独表記より international 査定者にもわかりやすい (Spice Sutra 版から改善された point) |
| 5. 「mic 録音の privacy 懸念」 を pitch で先回りできているか? (sotto voce brand + spec § 7 privacy design) | ◯ | Elevator pitch 第 3 段落で 4 層 privacy 設計を 1 段落に圧縮: (a) personal Google Cloud project tenant 内、 (b) ephemeral recordings + no disk persistence、 (c) masking layer で PII scrub、 (d) **brand 名 sotto voce 自体が "the AI whispers, never interrupts, and the user remains the answerer" を signal**。 brand 名解釈で design 哲学を 1 word に圧縮できているのは Sotto pitch の独自強み (Spice Sutra にはない) |
| 6. 「Spice Sutra から pivot した」 こと自体は plus / minus どちらに映るか? (pivot 経緯は portfolio に残らない、 spec / plan の 2026-05-23 日付が古くないことが key) | ◯ | (a) pivot 経緯は pitch 本文 (form 提出英文) に一切露出していない (grep 確認済)、 (b) spec / plan の日付 2026-05-23 は応募締切 2026-06-30 まで 38 日、 「最近書いた」 印象で plus、 (c) portfolio: profile README が T5 manual step 経由で Sotto pivot 反映予定 (採択前は app 名「Sotto」 出さず "engineer memory extension HUD" 程度に留める stealth 方針)、 (d) `even-memory-bridge` repo の存在自体が「indie が 1 年以上 XR HUD を真剣に追ってきた」 証拠として機能、 pivot mature な意思決定として読まれる |

**Part 2 サマリ**: ◯ 6 / △ 0 / ✗ 0。

- 全 6 角度 ◯ (Spice Sutra Part 2 が ◯ 3 / △ 2 / ✗ 0 だったのと比べて改善)
- Spice Sutra で △ だった角度 2 (「9 ヶ月現実的か」) と 5 (「solo 完成しなさそう」) は、 Even repo 流用 60-70% narrative + memory-bridge dogfood evidence の追加で完全に解消
- Sotto pitch の独自強み: brand 名解釈 (sotto voce → 「whisper, never interrupts」) が privacy 設計と design 哲学を 1 word に圧縮、 査定者の「録音されてる感」 懸念に対する最強の先回り

## 発見した issues

| # | 内容 | Severity | 対応 |
|---|---|---|---|
| I-1 | Elevator pitch 英文 4 段落で約 315 words、 outline コメント target 280-310 を 5 words 超過 | Minor | T8 form-final-draft 段階で 1 文短縮検討 (e.g. 最終段落「This combination — real-time visual HUD, personal-corpus retrieval, and engineer-specific intent classification — does not exist on any XR platform today」 を「This combination does not exist on any XR platform today」 に圧縮可)。 form 上の hard limit が未確認のため、 form 構造再確認時に limit 値を取れたら判断 |
| I-2 | § Previous Development Experience line 64 が長文 (1 paragraph 約 90 words、 leverage 説明部分)、 査定者の読み疲労 risk | Minor | T8 段階で 2 文に分割検討。 ただし content は適切、 構造改修は scope を見て判断 |
| I-3 | T5 manual step (profile README push + before/after screenshot) が未実施、 form 提出前 (T9) までに完了必須。 # 10 △ の根拠 | External dep | T9 (提出 24-48h 前 check) で確認、 portfolio-prep.md § 4 Manual steps の checklist で track |
| I-4 | T6 manual step (Sotto 用 mock HUD PoC、 emulator 起動 + screenshot) が未実施、 § Supporting Files 4 番目 `sotto-hud-overview.png` が form 提出前に必要 | External dep | T9 までに T6 完了必要。 plan T6 で予定済、 別途 commit で対応 |
| I-5 | pitch-outline-sotto.md § Existing Apps の pin 5 個 list と「pin 6 個」 (plan / Spice Sutra T5 context) の数の不一致 (6 個目は profile README repo `YuhtaIhara/YuhtaIhara` 自体を pin として数えていた可能性) | Trivial | profile README repo は GitHub UI 上「pinned work」 として実用上 list せず、 profile page 上部に常時 expand される仕組み。 「pin 5 個 + profile README」 で運用上は問題なし、 表記の統一のみ後日 portfolio-prep.md § 3 で「5 個」 に揃える程度 |

## 修正反映方針

本 review で pitch-outline-sotto.md 本体への直接 edit は **行わない** (Spice Sutra T7 では I-1 の 1 文修正のみ反映したが、 Sotto pitch には致命的修正が不要)。

- I-1 (word count) / I-2 (long sentence): T8 form-final-draft.md (Sotto 版) を新規作成する段階で吸収。 form-final-draft.md は実際に form に copy-paste される最終 doc、 そこで限定的に短縮編集する方が安全 (pitch-outline-sotto.md の「英文 draft + 日本語 reference + 根拠」 3 重構造を維持できる)
- I-3 (T5 manual) / I-4 (T6 manual): plan task として既に track 済、 T9 で再確認 checklist 通過必須
- I-5 (pin 5 vs 6 表記): trivial、 portfolio-prep.md § 3 を後日 1 行更新で対応

## 外部 review (Step 3)

**skip 判断** (Spice Sutra T7 と同じ理由 + Sotto 固有事情を追加):

理由:
- 締切まで 35 日 (2026-06-30) — 外部 review の往復に 1-2 週間取れる余裕はあるが、 内容より優先度高い未完了 task (T6 / T8 / T9 / T10) があり trade-off で不利
- self-review + 査定者シミュ 6 角度評価で **◯ 13 + ◯ 6 / 致命的弱点なし** を確認、 marginal な改善のために外部依頼の overhead を払う費用対効果が低い
- 機密度の問題: pivot 直後の draft、 漏洩は致命でないが unnecessary risk を取らない方針
- pivot 経緯 (Spice Sutra → Sotto) を 外部 reviewer に説明する overhead が、 純粋な英文 / 内容 review より大きい

代替 quality 確保:
- T8 form-final-draft.md 作成時に **再度 self-review** (2 周目)、 ここで limit 値が分かれば word count 最適化
- T9 (提出 24-48h 前) で **3 周目 self-review** + 全添付 PDF 化済の最終 chk

採択判明後 (2026-07-15+) の post-mortem で「もし外部 review してたら何が変わったか」 を retrospect 候補に追加 (Spice Sutra review-log.md と同じ方針)。

## Summary

- ✗ ゼロ、 致命的弱点なし
- △ 2 (word count 5 超過 / T5 manual 未実施) は T8 / T9 で吸収可能
- pivot の説得力: Spice Sutra T7 (◯ 15 + ◯ 3) から Sotto T7 (◯ 13 + ◯ 6) で **Part 2 (査定者シミュ) が全 ◯ に改善**、 reuse 60-70% narrative + brand 名 sotto voce 解釈 + Privacy 1 段落圧縮が key
- 次 step: **T8 form-final-draft Sotto 版**、 本 review の I-1 / I-2 を反映しつつ form 投入順 doc に集約

## 関連

- plan T7: `../../docs/superpowers/plans/2026-05-23-sotto-catalyst-application.md`
- 対象 doc: `pitch-outline-sotto.md` (commit 8a79d76、 2026-05-24)
- 個人情報 source: `personal-readiness.md`
- spec § 9 Developer Readiness: `../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- Spice Sutra 期 review (framework source): `review-log.md`
- 次 task (T8 form-final-draft Sotto 版): 未作成、 本 review 反映予定
