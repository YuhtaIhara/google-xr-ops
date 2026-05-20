# project-aura/

**Google Android XR Developer Catalyst Program** への応募 + (採択後) Aura SDK 上での app 開発 work。

## Program 概要

source: [mogura VR 記事 (2026-05-19 報道)](https://www.moguravr.com/android-xr-developer-catalyst/) 、 公式 source は Phase 2 で確定

| 項目 | 内容 |
|---|---|
| 正式名称 | Google Android XR Developer Catalyst Program |
| 発表日 | 2026-05-19 (太平洋夏時間) |
| 提供 HW | XREAL Project Aura 有線 XR グラス HW kit + オーディオグラス + ディスプレイグラス |
| 提供サポート | 技術リソースアクセス + 助成金 + mentoring |
| 対象地域 | 北米 / 英国 / EU / **日本** |
| 対象開発者 | 今後 **6-12 ヶ月以内に Android XR アプリリリース予定** の開発者 |
| 応募方法 | プログラム公式サイトのフォームに必要情報 + pitch 資料を登録 |
| **応募締切** | **2026-06-30** (太平洋夏時間、 JST 7/1 中) |
| 結果通知 | 2026-07-15 まで |

## 進行状況

- [x] Program 認知 (2026-05-19)
- [x] 本 repo (`google-xr-ops`) 立ち上げ (2026-05-20)
- [ ] 公式 source URL 確定 + sync 基盤投入 (Phase 2)
- [ ] application pitch 資料 draft (要 user 入力、 Phase 2)
- [ ] application submission (締切 6-30 まで)
- [ ] 結果待ち (7-15 まで)
- [ ] (採択後) HW kit 受領 + SDK 開発開始

## 構成

```
project-aura/
├ README.md            # 本 file
├ application/         # pitch 資料 draft + submission 控え
└ apps/                # (採択後) 開発成果物
```

## application/ の中身 (これから埋める)

- `pitch-outline.md` (Phase 2): pitch 資料の骨子 (user の Android XR アプリ idea + 6-12 ヶ月リリース計画 + 既存実績 + チーム体制)
- `submission-record.md` (応募後): submission の控え (送信 form の主要回答、 deadline 直前の最終版)

## 採択後の構成 (placeholder)

採択結果次第で `apps/<app-name>/` に Vite / TypeScript / React 等の標準 Android XR app を配置予定。 ai-driven-template の `.claude/` 規約に従う。

## 採択されなかった場合の代替 path

- HW kit なしで Android XR エミュレータ + Warby Parker 実機で開発継続
- 翌期 Catalyst Program (もしあれば) に再応募
- Google for Developers の standard channel から SDK access 申請
