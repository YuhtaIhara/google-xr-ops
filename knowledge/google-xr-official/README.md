# knowledge/google-xr-official/

Google XR エコシステム公式 source の管理。 `sources.yml` が source 一覧の正本、
`snapshots/` 配下に各 source の取得スナップショット (markdown 化済) を置く。

## 運用

- 応募 / pitch 作成中 (Phase 2): `sources.yml` を編集して URL 追加 / 削除
- 採択後 (Phase 3+): `scripts/sync-google-xr-official.sh` で月次 sync (TBD、 even-conversate-ops から派生予定)
- 今期 (応募までの 5 週間) は手動 fetch で snapshots を必要時のみ取得

## 参考

- even-conversate-ops の `knowledge/even-official/` が schema と sync script の origin
- 設計判断: `../../docs/google-xr-design.md`
