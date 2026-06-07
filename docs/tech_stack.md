# 技术栈与第三方服务

- 客户端引擎：Unity (建议使用 LTS 版本)
- 实时音视频：Agora Unity SDK（或 Twilio/自建 WebRTC）
- 后端：Firebase Auth / Firestore / Storage 或 Supabase（按需）
- AI Agent：OpenAI（Chat API）或自托管 Llama2 + 向量数据库（Pinecone/Milvus）
- STT/TTS：Whisper / Azure Speech / ElevenLabs（按需）
- 模型/资产工具：Blender、Mixamo、Unity Asset Store、glTF/FBX

注意记录：每个服务的账号、API Key 不要提交到仓库，使用 `.env` 或 CI 密钥管理。
