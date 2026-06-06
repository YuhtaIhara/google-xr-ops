# knowledge/google-xr-official/

Google XR エコシステム公式 source の管理。 `sources.yml` が source 一覧の正本、
`snapshots/` 配下に各 source の取得スナップショット (markdown 化済) を置く。

## 運用

- 応募 / pitch 作成中 (Phase 2): `sources.yml` を編集して URL 追加 / 削除
- 採択後 (Phase 3+): `scripts/sync-google-xr-official.sh` で月次 sync (TBD、 even-conversate-ops から派生予定)
- 今期 (応募までの 5 週間) は手動 fetch で snapshots を必要時のみ取得

## 2026-05-23 update (Sotto pivot)

応募 app を Spice Sutra (Indian cooking conductor) から **Sotto (engineer mentor real-time HUD)** に pivot。 sources.yml の URL set は変更なし (program 自体は同じ)、 ただし pitch narrative の重心が cooking vertical → engineer vertical に移動。 source の活用観点も「Indian recipe vertical の defense」 から「engineer memory extension の market gap」 に再 mapping。

本日 priority 1 source 3 件 (catalyst-landing / catalyst-blog-2026-05 / jetpack-xr-dp4) の snapshot を取得済、 `snapshots/` 配下に保存。 各 snapshot の末尾に「Sotto への影響」 section を追記、 pitch 起草時の根拠引用源として利用する。

- 詳細: `../../docs/superpowers/specs/2026-05-23-sotto-design.md` (Sotto design spec)
- pivot 経緯: `~/.claude/projects/-Users-yuhtaihara-work-google-xr-ops/memory/project_sotto_2026_05_23.md`

## 参考

- even-conversate-ops の `knowledge/even-official/` が schema と sync script の origin
- 設計判断: `../../docs/google-xr-design.md`
