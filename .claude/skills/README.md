# Skills (案件で追加)

`.claude/skills/` は Claude Code の再利用可能な手順 (skill) の正本ディレクトリ。 **本テンプレでは空** ── 案件特有 skill は案件で追加する。

## 案件で skill を追加するとき

`.claude/skills/<skill-name>/SKILL.md` 形式で作成:

```yaml
---
description: skill が何をするか (Claude が invoke 判断に使う)
disable-model-invocation: true  # 副作用ありの skill は user 明示のみ
allowed-tools: Read Grep        # 必要な tool だけ列挙 (省略可)
---

# <skill-name>

skill の手順本体...
```

skill 追加後、 本 README に listing 追加 (drift 防止)。

## 公式 docs

- Skills 公式: <https://code.claude.com/docs/en/skills>
- frontmatter 仕様: 同 docs「Frontmatter reference」 section
