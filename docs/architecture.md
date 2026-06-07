# 系统架构概述

客户端：Unity 引擎（Android / iOS / Windows），负责渲染 3D 大厅、播放本地音乐、接入实时音视频 SDK（Agora）并与后端同步事件。

后端：建议使用 Firebase（Auth、Firestore/Realtime、Storage）作为 MVP 后端；Agent 服务使用 OpenAI（或自托管 LLM），通过 REST/WS 提供对话与结构化命令。

实时音视频：首选 Agora SDK（Unity 插件），或后期迁移到自托管 mediasoup + coturn 架构。

同步与事件：使用 WebSocket 或 Firebase Realtime 实时同步宠物状态与房间事件，照片存储至云 Storage。
