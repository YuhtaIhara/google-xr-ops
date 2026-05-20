# Plugins (案件で追加)

`.claude/plugins/` は Claude Code plugin の配置場所。 plugin は team / org-level で skill / hook / agent / output-style / MCP server 等を bundle して配布する仕組み。 **本テンプレでは空** ── 案件特有 plugin は案件で追加する。

## 案件で plugin を追加するとき

公式 plugin marketplace から install、 or 案件で自作 plugin を作成:

```bash
/plugin install <plugin-name>@<marketplace-name>
```

設定は `.claude/settings.json` の `enabledPlugins` で有効化:

```json
{
  "enabledPlugins": {
    "<plugin-name>@<marketplace-name>": true
  }
}
```

## 公式 docs

- Plugins: <https://code.claude.com/docs/en/plugins>
- Plugin marketplaces: <https://code.claude.com/docs/en/plugin-marketplaces>
- Plugin reference: <https://code.claude.com/docs/en/plugins-reference>
