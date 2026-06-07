# CLAUDE 项目协作说明

此文件为项目协作约定与关键文档索引。重要路径：

- 开发日志：dev_logs/
- 需求与验收：docs/requirements.md
- 架构说明：docs/architecture.md
- 技术栈：docs/tech_stack.md
- 设计规范：docs/design_guidelines.md
- 代码规范：docs/coding_standards.md
- 部署手册：docs/deploy_runbook.md
- Agent 指令：docs/agent_commands.md
- 新成员上手：docs/onboarding.md

日常流程：
- 每日在 `dev_logs/` 新建或更新当天日志。可使用 `scripts/daily-log.js`（跨平台）或 `scripts/daily-log.ps1`（Windows PowerShell）自动生成。 
- 每个 PR 要在描述中引用对应 `dev_logs` 条目与相关任务卡，维护变更记录。

密钥管理：所有 API Key / 私密信息须存放在本地 `.env`（列入 `.gitignore`）或 CI 密钥库，不得直接提交。
