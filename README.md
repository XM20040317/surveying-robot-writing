# 测绘机器人论文写作 · Agent Skill

面向**移动测量、SLAM / 激光雷达惯性建图、无人机摄影测量、变形监测**四条分支的中文学术论文写作技能包。

它不是通用写作提示词。它把"这个领域审稿人到底会问你什么"写成了可执行的规则：真值够不够、指标口径对不对、基线公不公平、贡献和实验对不对得上。

```
📄 论文写作   surveying-robot-paper-writing
📋 项目报告   surveying-project-report
```

---

## 为什么需要它

测绘机器人论文的退稿理由高度集中，而且几乎都不是英语问题：

| 审稿人原话 | 真实病灶 | 本技能怎么治 |
|---|---|---|
| "The ground truth is not sufficiently accurate." | 拿 RTK 当真值报毫米级 | 真值分级 + 1/3 规则（`03`） |
| "The evaluation protocol is unclear." | 对齐方式、分母、粗差规则没写 | 指标三件套 + 口径表（`04`） |
| "The novelty is limited." | 只是精度涨了，说不出第二层 | 贡献四层 + 伪创新清单（`01`） |
| "Baselines are not fairly compared." | 版本、参数、硬件没交代 | 公平性协议四栏（`03`） |
| "The paper reads like an engineering report." | 只有结果没有机制 | 主—证—解—收 段落模板（`02`） |

通用写作技能教你怎么把句子写顺；这个技能教你怎么让**数字站得住**。

---

## 两个技能

### 1 · `surveying-robot-paper-writing`（主技能）

| 模块 | 内容 |
|---|---|
| `00` 选刊 | 三类刊物画像、选刊决策树、反向工程四步法 |
| `01` 贡献 | 一句话贡献公式、创新四层、七种伪创新、贡献-实验映射表 |
| `02` 章节 | 标题/摘要/引言/相关工作/方法/实验/结果/讨论/结论逐节写法 |
| `03` 实验 | 真值分级、1/3 规则、场景矩阵、公平性协议、消融、统计 |
| `04` 指标 | 中误差与 RMSE、ATE/RPE、C2C/M3C2、CE90、有效数字、12 个常见错误 |
| `05` 图表 | 十种图型规范、点云图与轨迹图专章、三线表、15 个常见问题 |
| `06` 术语 | 八大类中英术语表、15 组最易写错的词 |
| `07` 语体 | 中文 AI 味 20 个信号、英文 overclaim 清单、时态语态 |
| `08` 返修 | 意见五分类、回复信骨架、本领域高频意见 15 条 |
| `09` 自查 | 六阶段投稿清单 + 一页纸速查 |
| `10` 实例 | 摘要 / 实验设置 / 结果 / 审稿回复 四段完整改稿对照 |
| `branches/` | 四条分支各自的贡献惯例、必做实验、基线、数据集、雷区 |

### 2 · `surveying-project-report`（项目报告）

技术设计书（CH/T 1004 体系）、技术总结（CH/T 1001 体系）、结题/验收报告、质检报告。含精度指标分配表、考核指标对照表、常见退回原因。

> 标准号以现行有效版本为准；技能只给骨架与写法，不复述条款原文。

---

## 安装

技能遵循 [Agent Skills](https://agentskills.io) 标准（`<技能名>/SKILL.md`）。

| 工具 | 安装目录 |
|---|---|
| DSH | `~/.dsh/skills/` |
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.agents/skills/` |
| Kimi Code | `~/.config/agents/skills/` |

```bash
# 方式一：直接复制
cp -r skills/* ~/.dsh/skills/

# 方式二：用打包好的 zip（dist/ 下）
#   surveying-robot-paper-writing.zip  ——  主技能，解压到 skills/
#   surveying-project-report.zip        ——  报告技能
#   surveying-robot-writing-suite.zip   ——  两个一起

# 方式三：让 AI 自己装（把下面整段发给它）
```

```text
请读取 https://github.com/XM20040317/surveying-robot-writing ，
把 skills/ 下的两个技能分别安装为独立技能，不要合并：
· surveying-robot-paper-writing
· surveying-project-report
先确认每个目录下有 SKILL.md 且 YAML 头部含 name 和 description，
name 与 description 保持原样不要改，references/ 一并带上。
装完告诉我技能名、安装位置、以及什么情况下会自动触发。
```

详细步骤与排错见 [INSTALL.md](INSTALL.md)。

---

## 快速上手

**写论文**——开场先给三件事，技能才知道该走哪条分支：

```text
我在写一篇隧道环境下的激光惯性里程计论文，目标 ISPRS J。
数据是 3 段隧道 + 1 段城市道路，真值用全站仪控制点。
帮我判断贡献点够不够，再搭引言骨架。
```

**报精度**——把现在的报法贴进去：

```text
我现在写的是"定位精度达到 2 cm，RMSE 为 0.0213 m"，
真值是 RTK 固定解。帮我看看哪里会被审稿人打。
```

**返修**：

```text
这是 R1 的意见（粘贴原文）。帮我分五类，标出哪条必须补实验，
哪条可以礼貌反驳，再给回复信骨架。
```

---

## 八条硬规则

技能内部反复引用这八条，也是它能拦住"看起来没问题"的稿子的原因：

1. **精度不能超过真值**——真值不确定度应小于目标精度的 1/3
2. **指标三件套**——定义、口径、单位，缺一不算报过
3. **对比必须公平**——版本、参数、硬件、输入，四栏齐全
4. **贡献与实验一一对应**——画不出映射表就别写引言
5. **不编造**——数据、文献、标准条款、审稿意见，缺就标 `[待补：…]`
6. **只批注不改写**——作者定内容，技能管结构和表达
7. **易变信息守时效**——分区、影响因子、截稿日、标准年号，一律以官方为准
8. **去 AI 味、忌 overclaim**——成稿必须过一遍语体检查

---

## 设计来源

组织方式参考了 [sci-writing-geors](https://github.com/Xiangyu-Ge/sci-writing-geors)（地理/遥感 SCI 四件套）的"分支 + 章节"双轴结构，以及 [embodied-ai-paper-writer](https://github.com/OpenGHz/embodied-ai-paper-writer) 对机器人会议论文贡献陈述的拆解。正文全部按测绘机器人的实验体系重写：真值、精度评定、点云质量、测绘成果规范，这部分在通用写作技能里是空白。

---

## 边界

- 不代写、不编数据、不替作者下结论
- 不复述标准条款原文，标准号与年号以官方现行版本为准
- 期刊分区、影响因子、截稿日期等易变信息，一律以官网为准
- 通用语法润色请配合通用写作技能使用

---

## 版本

当前 `1.0.0`（2026-11）。变更见 [CHANGELOG.md](CHANGELOG.md)。

## 许可

MIT，见 [LICENSE](LICENSE)。
