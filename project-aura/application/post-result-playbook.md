# 結果通知後 Playbook (採択 / 不採択 両 branch)

> Catalyst 応募 (2026-06-12 提出済、 `submission-record-2026-06-12.md`) の結果通知 (2026-07-15 まで、 `iharayuhta@gmail.com`) を受けて即起票するための事前 playbook。
> 通知が来たら該当 branch の task をそのまま issue / plan 化する。 calendar reminder は 7-13 / 7-15 に設定済。

## 通知の確認

- 確認先: `iharayuhta@gmail.com` (受信 + 迷惑メール)、 Gmail 検索例: `from:google.com (Android XR OR Catalyst)`
- 「7-15 まで」 が太平洋時間の可能性があるため、 未着なら JST 7-16 朝に再確認
- 7-16 を過ぎても未着の場合: サイレント不採択の可能性を考慮しつつ、 form 確認 page / 公式 source (`knowledge/google-xr-official/sources.yml`) を再 fetch して通知方式の記載を確認

---

## Branch A: 採択

起票順 (依存関係順):

| # | task | 期限感 | 備考 |
|---|---|---|---|
| A-1 | 採択記録 (通知内容の要点 + 提供内容 + 条件を doc 化、 commit) | 即日 | 通知 mail は repo に貼らない (個人情報 / 機密注意)、 要点のみ |
| A-2 | digital agreements 署名 | 通知の指示どおり | acknowledgement で同意済。 署名前に条件 (IP / 公開義務 / milestone 報告) を通読 |
| A-3 | **開発機材判断** | 1 週間以内 | ⚠️ 現機材 (Iris Xe / RAM 16GB) は XR emulator の scene 描画不可と確定済 (2026-06-06、 `poc-setup-guide-sotto.md` § 11)。 9 ヶ月開発で emulator は必須級 → dGPU 機 (デスクトップ or eGPU) 投資 vs 実機中心開発の判断が最初の blocker |
| A-4 | sotto repo bootstrap (`~/work/google/sotto/`) | agreements 完了後 | spec § 10-1。 `google-xr-ops/project-aura/apps/` placeholder は "see sotto repo" 1 行に置換 |
| A-5 | Jetpack XR SDK 習得 plan (DP4 → Beta 追従) | HW kit 受領前 | form 提出時の宣言どおり 9 ヶ月 window の前半に集中 |
| A-6 | Even component porting 計画 (Python/TS → Kotlin) | HW kit 受領前 | `2026-05-23-sotto-even-component-reuse.md` の 5 要素マトリックスを porting backlog に変換 |
| A-7 | HW kit 受領 (est 2026-08) | 配送待ち | 配送先 = form 記載の自宅住所。 受領後に実機 smoke test → A-3 の判断を再評価 |
| A-8 | **設計整合 2 件の反映** | spec 改訂時 | (1) UC 回答で **Camera access 不要を明示宣言済** → camera を使う機能拡張はこの宣言との整合確認を必須化 (spec に制約として明記)。 (2) Even との positioning 整理 (spec § 10-2: G2 = audio HUD / Sotto = visual HUD の axis 違い) |
| A-9 | milestone 報告要件の確認 | program 指示どおり | No grant required 選択のため funding milestone は対象外の想定だが、 program 側の進捗報告義務は別途あり得る |

提出済 form との整合 anchor (開発中に矛盾させない宣言):

- Estimated launch: **2027-04-30** (Google Play)
- MVP scope: engineer 特化 retrieval HUD (UC#1 = rank 1)、 経営者 expansion (UC#2) は 2+ years 先と申告済
- capability: Audio + UI framework + Notifications のみ、 **Camera 不使用**
- beta 体制: 友人 engineer 2 名 dogfood

## Branch B: 不採択

**前提の再確認**: 応募時の本音は「HW kit + 経歴、 ship 自体は必須でない」 (2026-05-23 確定)。 採択は加速装置であって前提ではない。 失うのは早期 HW / 技術 support / Google 接点のみで、 設計 spec / Even 流用 component / portfolio / 提出物一式は全て資産として残る。

起票順:

| # | task | 備考 |
|---|---|---|
| B-1 | 結果記録 (不採択の事実 + 通知文面の要点を doc 化、 commit) | 振り返りは感情が落ち着いてからで可 |
| B-2 | **Warby Parker 路線へ pivot** | 本 repo のもう片輪。 Intelligent Eyewear (2026 秋発売) は consumer 端末だが同じ Android XR → Sotto は Catalyst なしで開発可能、 時期が数ヶ月後ろにずれるだけ。 `devices/warby-intelligent-eyewear/` を主戦場に切替、 発売日 / 予約開始の watch task を起票 |
| B-3 | 開発継続の機材判断 | Branch A-3 と同じ制約 (Iris Xe で emulator 不可)。 Warby Parker 実機入手までは dGPU 機が無いと検証手段が無い点に注意 |
| B-4 | 再応募 watch | Catalyst 次 cohort / 類似 program の有無を `knowledge/google-xr-official/` sync で watch。 提出物一式 (form 原稿 / PDF / UC 回答) でほぼ即応募可能 |
| B-5 | (任意) Even G2 での部分先行 | retrieval pipeline 自体は G2 で動く範囲あり。 ただし visual HUD が差別化の核のため、 やるなら「pipeline の Kotlin 移植素振り」 目的に限定 (spec の G2/Aura positioning を崩さない) |

不採択時にやらないこと (anti-scope):

- 他 vendor (Meta / Samsung) への横展開検討 — README の anti-scope どおり Google bucket に絞る
- 設計 spec の全面書き直し — Warby Parker 向けでも spec の大半 (pipeline / privacy / HUD 構成) はそのまま使える。 差分は HW profile 章のみ

---

## 共通 (どちらでも)

- memory (`project_sotto_2026_05_23.md`) に結果と次 phase を記録
- calendar の 7-13 / 7-15 reminder は消化後そのまま (履歴として残してよい)
- 本 playbook は結果判明後、 該当 branch を実 plan に昇格させた時点で historical 扱いに変更

## 関連

- 提出記録: `submission-record-2026-06-12.md`
- 設計 spec (§ 10 採択後 follow-up): `../../docs/superpowers/specs/2026-05-23-sotto-design.md`
- Even 流用 component: `../../docs/superpowers/specs/2026-05-23-sotto-even-component-reuse.md`
- emulator 制約の記録: `poc-setup-guide-sotto.md` § 11
- Warby Parker 側: `../../devices/warby-intelligent-eyewear/README.md`
