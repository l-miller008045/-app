# 新成员上手指南

必装软件：
- Unity Hub + Unity Editor (LTS)
- Visual Studio 或 Rider
- Android Studio（构建 Android）
- Blender（必要时修改模型）
- Git、GitHub CLI

配置步骤：
1. 克隆仓库并按照 `docs/` 中说明配置 API keys（在本地使用 `.env` 或系统环境变量）。
2. 运行 `scripts/daily-log.js` 以初始化 `dev_logs` 文件（需要 Node.js）。

请勿将 API Key 提交到仓库，使用 `.gitignore` 规则忽略本地密钥文件。
