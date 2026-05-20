# devices/warby-intelligent-eyewear/

購入予定端末「Warby Parker Intelligent Eyewear」 の use case + 設定 + retrospect。

## 製品概要 (Phase 1 = 未確定、 Phase 2 で公式 source 取得)

source: [warbyparker.com/intelligent-eyewear](https://www.warbyparker.com/intelligent-eyewear) (要 Cloudflare bot block 回避、 Phase 2 で確認)

| 項目 | 内容 |
|---|---|
| OEM | Warby Parker |
| OS / SDK | Google Android XR (Project Aura エコシステム上) |
| 発表日 | 2026-05-19 (Google Android XR Developer Catalyst Program と同日) |
| 発売予定 | 2026 秋 (具体日付未確定) |
| 価格 | 未確定 |
| spec | 未確定 (display / battery / 音声入出力 / Gemini 連携範囲 等) |

→ 詳細は Phase 2 で `knowledge/google-xr-official/snapshots/` に snapshot 取得後、 本 README を補強。

## 購入計画

- user 方針: **オールイン購入**、 発売開始時点で発注
- 海外 OEM、 日本発送 / 並行輸入 path は Phase 2 で確認 (Warby Parker の日本販売状況)

## 構成 (発売後 / 購入後に充填)

```
devices/warby-intelligent-eyewear/
├ README.md             # 本 file (概要)
├ setup/                # 初期設定 / アカウント連携 / 言語設定 等の手順 (anonymized)
├ use-cases/            # 想定 use case 別 (IT 業務 / 私生活 / 移動中 etc.)
└ retrospect/           # 使用後の振り返り (Even repo の meetings/<dir>/retrospect.md 同 pattern)
```

## Even との比較 (Phase 3 以降、 着弾後)

`docs/google-xr-design.md` に Even G2 (`~/work/even/`) との比較 section を Phase 3 で追加予定:

- 物理: frame / weight / fit / display 方式
- 機能: STT 品質 / AI cue / 言語対応 / プライバシー
- ecosystem: SDK 開放度 / 3rd party app / 公式 BP

→ ただし両 glasses は同時着用不可、 use case 棲み分け (= 「IT 客先面談は Even」 「私生活 / プロトタイピングは Warby」 等) を user 判断で確定する想定。

## 注意

- 端末 シリアル / アカウント / 個人 identifier は **絶対 commit しない** (`.gitignore` で除外、 Phase 2 で pattern 追加検討)
- 写真撮影機能 (camera 搭載なら) の使用は user 判断、 撮影データは repo 外保管
