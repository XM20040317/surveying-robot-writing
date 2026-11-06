# 安装说明

技能遵循 [Agent Skills](https://agentskills.io) 开放标准：每个技能是一个目录，目录里必须有 `SKILL.md`，YAML 头部含 `name` 和 `description`。

```
skills/
├── surveying-robot-paper-writing/
│   ├── SKILL.md
│   └── references/
└── surveying-project-report/
    ├── SKILL.md
    └── references/
```

---

## 一、按平台安装

| 平台 | 全局目录 | 项目级目录 |
|---|---|---|
| DSH | `~/.dsh/skills/` | 项目内 `.dsh/skills/`（若平台支持） |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Codex | `~/.agents/skills/` | `.agents/skills/` |
| Kimi Code | `~/.config/agents/skills/` | — |
| Cursor | `~/.cursor/skills/` | `.cursor/skills/` |

### Windows PowerShell

```powershell
$dest = "$env:USERPROFILE\.dsh\skills"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Recurse -Force .\skills\* $dest
```

### macOS / Linux

```bash
mkdir -p ~/.dsh/skills
cp -r skills/* ~/.dsh/skills/
```

装完目录应该是：

```
~/.dsh/skills/surveying-robot-paper-writing/SKILL.md
~/.dsh/skills/surveying-project-report/SKILL.md
```

**注意**：不要把两层目录压平。`SKILL.md` 必须在技能目录里面，`references/` 与它同级。

---

## 二、验证

新开一个会话，问：

```text
你现在有哪些技能？分别在什么情况下用？
```

能报出两个技能名、并说清触发条件，才算装好。

再做一个触发测试：

```text
我在写隧道 SLAM 的论文，帮我看看精度这块会被审稿人怎么打。
```

应该自动进入论文技能，并开始问「哪条分支 / 投哪本刊 / 真值是什么」。

---

## 三、排错

| 现象 | 原因 | 处理 |
|---|---|---|
| 报不出技能名 | 只是让 AI 读了 README，没真正落盘 | 确认文件在 `skills/` 下 |
| 报得出名字但回答很泛 | 只读了 SKILL.md，`references/` 没带上 | 整个目录一起复制 |
| 不自动触发 | `description` 被改写或删了 | 恢复原文，别改一个字 |
| 触发到错误技能 | 两个技能描述重叠 | 确认论文技能描述含"写论文/投稿/返修"，报告技能含"设计书/技术总结/验收" |
| 升级后行为没变 | 旧目录残留 | 先删旧目录再复制 |
| 中文乱码 | 编码不是 UTF-8 | 另存为 UTF-8（无 BOM） |

---

## 四、卸载

```bash
rm -rf ~/.dsh/skills/surveying-robot-paper-writing
rm -rf ~/.dsh/skills/surveying-project-report
```

---

## 五、自定义

想加自己的内容，推荐两种方式，**不要直接改 `SKILL.md` 正文**（升级会覆盖）：

1. **加参考文件**：放进 `references/`，在 `SKILL.md` 的路由表里加一行。
2. **加分支手册**：复制 `references/branches/slam-lio.md` 改成你的方向，并在路由表登记。

改 `name` 或 `description` 会让技能失效，除非你同步改所有引用。
