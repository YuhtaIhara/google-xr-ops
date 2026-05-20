# knowledge/google-xr-official/

Google XR エコシステムの **公開情報** 一次資料 snapshot 集約。 Android XR / Project Aura / Warby Parker / XREAL の仕様 nuance を user の頭の中 / 過去 memory と diff するための reference layer。

even-conversate-ops の `knowledge/even-official/` と同じ pattern (Phase 2 で sync 基盤 + script 流用予定)。

## 構成 (Phase 2 で充填)

- `sources.yml`: 監視対象 URL の registry (id / URL / priority / fetch_cadence / snapshot_file)
- `snapshots/`: WebFetch / curl / git-clone で取得した markdown snapshot。 1 URL = 1 file

## Phase 1 (bootstrap) 時点での既知 source 候補

(Phase 2 で精査 + URL 確定後 `sources.yml` 登録、 現状は memo)

| source | URL 候補 | 種別 | priority 仮 |
|---|---|---|---|
| Android XR 公式 docs | developers.google.com の Android XR セクション (要 URL 確認) | dev docs | 1 |
| Project Aura Developer Catalyst Program | 公式 page (要 URL 確認、 moguravr 記事から辿る) | program 概要 + 応募 form | 1 |
| Google for Developers Blog (5-19 announcement) | (要 URL 確認) | 一次 announcement | 1 |
| Warby Parker Intelligent Eyewear | warbyparker.com/intelligent-eyewear | product page (要 bot block 対応、 WebFetch で 403、 curl + UA 試す) | 1 |
| XREAL Aura developer site | (要 URL 確認) | HW kit spec | 2 |
| mogura VR 記事 (日本語 2 次資料) | moguravr.com/android-xr-developer-catalyst/ | 報道、 1 次 link 抽出済み | 3 |

## 取得方針

even-conversate-ops から `scripts/sync-even-official.sh` を Phase 2 で借用 + 改修して `scripts/sync-google-xr-official.sh` 作成予定。 fetch method 候補:

- **Cloudflare bot block 対応**: Even の Zendesk Help Center で `https://support.<domain>.com/api/v2/help_center/...` に直接当てる pattern 流用可能性
- **SPA (Nuxt 等) は llms.txt → なければ WebFetch (lossy summary) or GitHub canonical → curl + UA**
- **iTunes lookup API**: Warby Parker / Google XR app の release notes 用 (Even で実証済)
- **git-clone**: 公式 GitHub repo がある場合 (everything-evenhub 同様の pattern)

## 正本との関係

| layer | 役割 |
|---|---|
| 公式 web (本 dir) | 公開された仕様の真値 (granular さは限界あり) |
| user 実機観察 / FB (Phase 3) | nuance 補正の真値 (公式に書かれない挙動) |
| `docs/google-xr-design.md` | 上 2 つを照合した設計判断の正本 |
| `devices/warby-intelligent-eyewear/` / `project-aura/` | 反映先 (実 work) |

## 取得しないもの (Phase 1 段階の anti-scope)

- 公式 Discord / X 投稿 (ノイズ多すぎ、 投資対効果薄い)
- 第三者 review / unbox 記事 (信頼性まちまち、 Phase 3 で必要時のみ)
- Meta Quest / Samsung Galaxy XR 等 別 vendor 情報 (Google bucket scope 外)
