# 情侣空间 App - 项目说明

这是校园智能体创作大赛的项目仓库（情侣空间 App）。本仓库包含 Unity 客户端模板、文档与日常开发日志脚本。

快速开始：
1. 克隆仓库。
2. 安装必备软件（见 `docs/onboarding.md`）。
3. 本地运行每日日志脚本：

```bash
node scripts/daily-log.js
# or (Windows PowerShell)
# .\scripts\daily-log.ps1
```

CI 自动化：项目包含一个 GitHub Actions 工作流 `/.github/workflows/daily-log.yml`，可按计划生成并提交 `dev_logs`。若希望 workflow 自动提交，请确认仓库 Actions 权限并启用令牌（通常 GITHUB_TOKEN 已足够）。
