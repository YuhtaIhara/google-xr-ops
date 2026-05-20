# ローカルフォルダ rename + メモリ引越し手順

派生案件 repo を作成後、 ローカルフォルダ名を案件名に揃えたい場合の手順。 Claude Code はプロジェクトごとに `~/.claude/projects/<エンコード済みパス>/` に長期メモリを保管するため、 フォルダ rename と同時にメモリディレクトリの引越しも必要。

## 前提

- Claude Code セッションが **完全に終了している** こと (セッション中の rename は CWD 破壊リスク)
- 派生 repo が GitHub 上に存在し、 remote が正しく設定されていること (`git remote -v` で確認)
- 未 commit の変更がない (`git status` で clean を確認)

## 手順 (PowerShell, Windows)

### 1. ローカル workdir を rename

```powershell
Move-Item C:\Users\user\Documents\work\<旧フォルダ名> C:\Users\user\Documents\work\<新フォルダ名>
```

### 2. Claude Code のプロジェクトメモリディレクトリも引越し

Claude Code はプロジェクトメモリを `~/.claude/projects/<エンコード済みパス>/memory/` に保管する。 パスエンコードは:

- `C:\` → `C-`
- `\` → `-`

例: `C:\Users\user\Documents\work\menter-glass\` → `C--Users-user-Documents-work-menter-glass`

```powershell
$old = "C--Users-user-Documents-work-<旧フォルダ名>"
$new = "C--Users-user-Documents-work-<新フォルダ名>"
Move-Item "$env:USERPROFILE\.claude\projects\$old" "$env:USERPROFILE\.claude\projects\$new"
```

### 3. 新フォルダで Claude Code 起動

```powershell
cd C:\Users\user\Documents\work\<新フォルダ名>
claude
```

### 4. 動作確認

新セッションで Claude に依頼:

```
> memory を読んで現状を要約して
```

過去メモリ (例: `project_<案件名>.md`, `feedback_*.md`) が読まれれば成功。

## 手順 (bash, Git Bash / WSL / macOS / Linux)

```bash
# 1. workdir rename
mv ~/Documents/work/<旧フォルダ名> ~/Documents/work/<新フォルダ名>

# 2. メモリ引越し (Windows パス用)
old="C--Users-${USER}-Documents-work-<旧フォルダ名>"
new="C--Users-${USER}-Documents-work-<新フォルダ名>"
mv "$HOME/.claude/projects/$old" "$HOME/.claude/projects/$new"

# 3. 新フォルダで Claude Code 起動
cd ~/Documents/work/<新フォルダ名>
claude
```

macOS / Linux のメモリディレクトリ名は OS のパス形式に応じて変わる (`Users/<user>/Documents/...` → `-Users-<user>-Documents-...` 等)。 まず `ls ~/.claude/projects/` で実際のディレクトリ名を確認するのが安全。

## トラブルシュート

### Q. メモリディレクトリの引越しを忘れた

次セッションで Claude が「過去メモリなし」状態で起動する。 後追いで上記 Step 2 を実行すれば復旧する。 セッションを起動済の場合は一旦 `/exit` してから引越し → 再起動。

### Q. Claude Code セッション起動中に rename してしまった

セッションが指している CWD が無効になる。 対処:

1. セッションを `/exit` で終了
2. もし可能なら 旧フォルダ名にロールバック (`Move-Item` で戻す)
3. セッションを clean に終了
4. 改めて手順 1-3 を実施

セッション中に強制的に作業を続けると CWD 不整合で以降の Tool 呼び出しが破綻する。

### Q. パスエンコードが想定と違う

`ls ~/.claude/projects/ | grep <案件名関連の文字列>` で実際のディレクトリ名を確認。 Claude Code のバージョンによってエンコード規則が変わる可能性あり。

## 関連

- リポジトリ初期セットアップ: `../../README.md` (Step 4 で本手順を参照)
- プロジェクトメモリ運用: `~/.claude/CLAUDE.md` の「auto memory」セクション (個人 user-scope)
