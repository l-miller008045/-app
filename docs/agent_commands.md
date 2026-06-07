# Agent 指令格式说明

Agent 返回 JSON 包含两部分：自然语言回复 `text` 与 `actions` 列表。

示例：
```
{
  "text":"已为你更换墙纸为春日主题，需要我同时播放背景音乐吗？",
  "actions":[
    {"type":"change_wallpaper","params":{"id":"spring_theme"}},
    {"type":"play_music","params":{"track_id":"track_01","volume":0.6}}
  ]
}
```

常见 action type：`change_wallpaper`, `play_music`, `pet_interact`, `send_notification`。
