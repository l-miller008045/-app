# 验证 Daily Log Workflow 指南

此文档指导如何在本地推送并在 GitHub 上手动触发与验证 `.github/workflows/daily-log.yml` 的运行。

1) 本地提交并推送（在项目根执行）：

```bash
cd "d:\情侣空间app"
git add .
git commit -m "chore(ci): add daily-log workflow and docs" || echo "no changes to commit"
git push origin main
```

2) 在 GitHub 手动触发 Workflow：
- 进入仓库 → Actions → 选择 `Daily Log` workflow → 点击 `Run workflow`（选择分支，点击 Run）。

3) 检查运行日志：
- 打开 Actions 运行记录，查看 `generate-log` job 的每一步输出，确认 `Run daily log script` 步骤没有报错。

4) 验证提交是否生效：
- Workflow 成功运行后，检查仓库 `dev_logs/` 目录是否新增当日文件或已更新内容。可在仓库页面或本地拉取查看。

5) 常见问题与排查：
- 无权限推送：确认仓库 Settings → Actions → Workflow permissions 为 `Read and write`，或使用自定义 PAT（参见 `docs/ci_secrets.md`）。
- `git push` 被拒绝：在本地执行 `git pull --rebase origin main`，解决冲突后再尝试推送。
- 脚本错误：在 Actions 日志查看 Node 输出，或在本地运行 `node scripts/daily-log.js` 复现并修复。

6) 额外：使用 GitHub CLI 触发 workflow（可在本地执行）：

```bash
gh workflow run .github/workflows/daily-log.yml --ref main
```
