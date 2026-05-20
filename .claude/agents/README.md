# Agents (案件で追加)

`.claude/agents/` は Claude Code の subagent 定義の正本ディレクトリ。 **本テンプレでは空** ── 案件特有 agent は案件で追加する。

## 案件で agent を追加するとき

`.claude/agents/<agent-name>.md` 形式で作成:

```yaml
---
name: <agent-name>
description: invoke 判断用 (Claude が delegate 判断に使う)
tools:
  - Read
  - Grep
  - Glob
---

# <agent-name> agent

目的: ...
方針: ...
権限ガード: read-only 既定、 破壊操作は main session に戻す
```

agent 追加後、 本 README に listing 追加 (drift 防止)。

## 公式 docs

- Subagents 公式: <https://code.claude.com/docs/en/sub-agents>
- 「Run agents in parallel」 (subagent / agent view / agent teams / worktrees 比較): <https://code.claude.com/docs/en/agents>
