# CI 密钥与权限配置说明

此文档说明项目使用的 CI（GitHub Actions）需要哪些密钥/权限，以及如何在仓库中配置。请勿将任何密钥明文提交到仓库。

1) 使用内置 `GITHUB_TOKEN`（推荐）
- GitHub Actions 自动提供 `GITHUB_TOKEN`，大多数情况下用于提交与推送由 workflow 产生的变更（例如每日日志脚本产生的 `dev_logs` 文件）。
- 要求：workflow 的 `permissions` 需包含 `contents: write`（已在 `.github/workflows/daily-log.yml` 中配置）。

2) 使用自定义 Personal Access Token (PAT) / Bot Token（可选）
- 场景：若需要跨仓库推送或者使用特定 bot 账户提交，请创建一个带 `repo` 权限的 PAT。步骤：
  1. 登录 GitHub → Settings → Developer settings → Personal access tokens → Generate new token。
  2. 选择 `repo` 范围（或更精细的权限），生成后复制保存（仅显示一次）。
  3. 在目标仓库：Settings → Secrets and variables → Actions → New repository secret，添加名为 `BOT_TOKEN`（或其他名）的 secret，并粘贴 PAT。

3) 在 workflow 中使用 secret
- 在 workflow 中，用法示例：
  ```yaml
  env:
    BOT_TOKEN: ${{ secrets.BOT_TOKEN }}
  ```
- 在执行 git push 时，可用该 token 做认证，例如：
  ```bash
  git remote set-url origin https://x-access-token:${BOT_TOKEN}@github.com/OWNER/REPO.git
  git push
  ```

4) 权限与安全建议
- 最小权限原则：仅授予 workflow 所需的最小权限。
- 不要在仓库中提交 `.env` 或含有密钥的文件，确保 `.gitignore` 已列出这些文件。
- 为敏感操作设置审批流程（如使用 GitHub Environments / required reviewers）。

5) 本地测试说明
- 你可以在本地运行脚本并手动提交：
  ```bash
  node scripts/daily-log.js
  git add dev_logs/*.md
  git commit -m "chore(daily-log): local update"
  git push
  ```

6) 常见问题
- 如果 workflow 运行后未能提交变更，检查 Actions 日志中是否有 `git push` 的错误（通常是权限不足）。
- 若使用 `GITHUB_TOKEN` 出现权限问题，确认仓库 Settings -> Actions -> General -> Workflow permissions 是否允许 `Read and write permissions`。
