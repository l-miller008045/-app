const fs = require('fs');
const path = require('path');

const projectRoot = path.resolve(__dirname, '..');
const logsDir = path.join(projectRoot, 'dev_logs');
if (!fs.existsSync(logsDir)) fs.mkdirSync(logsDir, { recursive: true });

const today = new Date().toISOString().slice(0, 10);
const file = path.join(logsDir, `${today}.md`);
if (!fs.existsSync(file)) {
  const content = `# 开发日志 - ${today}\n\n- 完成事项：\n\n- 待办事项：\n\n- 风险/阻塞：\n\n- 次日计划：\n\n- 自动记录： ${new Date().toLocaleTimeString()}\n`;
  fs.writeFileSync(file, content, 'utf8');
  console.log('Created', file);
} else {
  fs.appendFileSync(file, `\n- 自动记录： ${new Date().toLocaleTimeString()}\n`, 'utf8');
  console.log('Updated', file);
}
