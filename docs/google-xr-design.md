# Google XR 設計判断 (累積)

Google XR エコシステム ops (`google-xr-ops`) の設計判断記録。 `iterations/` 等で記録した個別改善の中から **再利用可能な原則** を抽出して残す。 even-conversate-ops の `docs/prep-notes-design.md` と同 pattern。

## 北極星 (Phase 1 時点)

Google Android XR エコシステムを 2 方向で運用:

1. **consumer 側**: Warby Parker Intelligent Eyewear を購入、 個人用途で活用
2. **developer 側**: Project Aura Catalyst Program で開発参加、 採択されたら Aura SDK / Android XR SDK で app 開発

→ Even (vendor `~/work/even/`) と並行運用、 統合しない。 Google bucket は **Big Tech ecosystem 内での乗っかり戦略**、 Even bucket は **個人 sole-maker への応援 + Conversate 活用** の異なる stance を持つ。

## 構成判断 (Phase 1 確定)

### 1. vendor 軸 wrapper (`~/work/even/` + `~/work/google/`) を local filesystem で採用

- 2026-05-20 user decision、 既存 Even 2 repo + 新 Google 1 repo を local 親 dir で grouping
- GitHub repo は分離維持 (`YuhtaIhara/even-memory-bridge` / `YuhtaIhara/even-conversate-ops` / `YuhtaIhara/google-xr-ops`)
- backward-compat symlink は不要として削除 (2026-05-20)

### 2. Google bucket は 1 repo `google-xr-ops` で開始

- Even の 2 repo 体制は「戦略 pivot で frozen + active」 の結果、 deliberate な分割じゃなく経緯
- Google bucket は **現状 1 戦略 phase** (all-in)、 consumer (Warby) + developer (Aura) は同戦略下の tactics
- 将来 freeze / pivot が起きたら自然に 2 repo に分岐 (Even 同様の pattern)

### 3. ai-driven-template 派生で bootstrap

- `~/work/ai-driven-template/` (GitHub `YuhtaIhara/ai-driven-template`、 isTemplate=true) から `gh repo create --template` で派生
- `.claude/rules/` (global / branching / permissions / security-secrets) + `.claude/hooks/pre-tool-use.sh` を継承
- AI 痕跡規約 (commit / PR で「AI 駆動」 等の主体表現を避ける) も継承

## 未確定 (Phase 2 以降で確定予定)

| 論点 | 当面の暫定 | Phase 2 確定 trigger |
|---|---|---|
| 公式 source URL set | 未収集、 sources.yml は empty | Phase 2 で web search + 主要 page WebFetch、 Cloudflare bot block 対応 |
| Android XR vs Project Aura の用語整理 | mixed mention | Phase 2、 公式 docs 読み込み後に整理 |
| Warby Parker の Cloudflare bot 回避 path | WebFetch 403 確認済、 curl + UA は未試行 | Phase 2、 even-conversate-ops の support 記事 fetch pattern (Zendesk API direct) と同様の direct API 経路を探る |
| Aura pitch 資料の骨子 | placeholder のみ | user の Android XR アプリ idea が具体化したら着手 (Phase 2、 締切 6-30) |
| Warby Parker 日本販売 path | 未確認 | Phase 2、 公式 page + 並行輸入チャネル調査 |

## Even からの借用方針 (確定済)

| 借用元 | 何を借りる | どう移植 |
|---|---|---|
| `.claude/rules/` | 機密 / branching / permissions のベースライン規範 | template に既に含まれる |
| `.claude/hooks/pre-tool-use.sh` | `.env*` 二重ガード + 破壊 cmd block + main 直 commit block | template に既に含まれる |
| `knowledge/even-official/sources.yml` schema | YAML 構造 (id / url / priority / fetch_cadence / fetch_method / snapshot_file / note) | Phase 2 で google-xr-official/sources.yml に流用 |
| `scripts/sync-even-official.sh` | 5 fetch method (zendesk-api / itunes-lookup-api / curl+textutil / git-clone / WebFetch) の sync script | Phase 2 で `scripts/sync-google-xr-official.sh` 派生作成、 source 差し替え |
| `docs/prep-notes-design.md` の v2 preset 設計知見 | CLAUDE.md + rules pattern の Prep Notes 設計 | **流用前提しない**、 Warby Parker の実 spec 確認後に「Prep Notes 相当の機構があるか」 個別判断 |
| even-conversate-ops の meetings/ retrospect cycle | session export + audit + retrospect | Phase 3 で Warby Parker の export 仕様判明後に判断、 そのまま流用できる保証なし |

## 関連

- 同 vendor 親 dir: `~/work/google/` (Google bucket)
- 別 vendor: `~/work/even/even-conversate-ops` (active Even ops)、 `~/work/even/even-memory-bridge` (frozen)
- ai-driven-template: [`YuhtaIhara/ai-driven-template`](https://github.com/YuhtaIhara/ai-driven-template)
- Project Aura 概要: `project-aura/README.md`
- Warby Parker 概要: `devices/warby-intelligent-eyewear/README.md`
