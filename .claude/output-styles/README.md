# Output Styles (案件で追加)

`.claude/output-styles/` は Claude Code の応答スタイル定義ディレクトリ。 **本テンプレでは空** ── 案件特有のスタイルは案件で追加する。

## 案件で output-style を追加するとき

`.claude/output-styles/<style-name>.md` 形式で作成:

```markdown
---
name: <style-name>
description: スタイルの説明 (例: 「結論先 + 最小ステップ + 用語定義」)
---

## 方針
- 応答の方針 (結論先 / 詳細後 / 質問形式 等)

## 禁止
- 避けるパターン (不確かな断定 / 冗長な一般論 等)
```

切替は session 中に `/output-style <style-name>` で。 スタイル追加後は本 README に listing 追加 (drift 防止)。

## 公式 docs

- Output Styles: <https://code.claude.com/docs/en/output-styles>
