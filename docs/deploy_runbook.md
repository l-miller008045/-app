# 构建与部署运行手册

本手册列出常用构建命令与注意事项（仅示例，实际以 Unity 版本与项目配置为准）。

Android 打包（Unity）：打开 Unity，File -> Build Settings -> Android -> Build；或使用 Unity CLI：

`/path/to/Unity -batchmode -projectPath . -executeMethod BuildScript.PerformAndroidBuild -quit`

Windows 构建同理，参考 Unity 文档。

上传与发布：将构建产物上传到 Google Play / App Store / Windows 存储，记得管理签名与证书。
