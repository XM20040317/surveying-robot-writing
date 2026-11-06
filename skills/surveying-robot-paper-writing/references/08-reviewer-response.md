# 审稿意见拆解与回复信

回复信的目标不是“说服审稿人”，而是让编辑和审稿人在最短时间内确认：每条意见都被理解、被处理、能在修改稿中定位。先拆解，再动笔；每条意见都要落到一个动作上。

## 先分类，再动笔

把每条意见拆成最小可执行单元。一条意见含多个要求时，分成 1.1、1.2，分别回复，不要合并成一段模糊表态。

| 类型 | 判断信号 | 做什么 | 不做什么 | 回复长度 |
|---|---|---|---|---|
| 事实错误 | 数字、引用、术语、图表标注确实有误 | 先核实；承认具体错误；给出更正后的数值或文献；标明位置 | 不要用“可能”“似乎”掩盖；不要顺带解释一堆无关背景 | 40–80 词 |
| 缺实验 | 要求补基线、补场景、补消融、补统计 | 评估可行性；能补就补并报告设置与结果；不能补就给替代证据并收窄结论 | 不要只写“we will add”；不要用无关实验充数 | 150–300 词 |
| 表述不清 | 审稿人把 A 理解成 B，或说某段难懂 | 重写原段；给修改前后对照；必要时加定义、流程图或例子 | 不要只说“we clarified”；不要把责任推给读者 | 60–120 词 |
| 观点分歧 | 方法选择、评价口径、贡献大小存在合理分歧 | 先复述对方关切；给证据和适用条件；可做敏感性分析；必要时软化声明 | 不要扣帽子；不要只靠“已有工作也这样做”辩护 | 120–220 词 |
| 无法完成 | 数据受许可限制、硬件不可得、野外窗口已过、伦理不允许 | 说明具体约束；给替代分析或边界讨论；明确修改了哪句声明 | 不要空头承诺；不要用“future work”代替处理 | 150–250 词 |

操作顺序：

1. 给每条意见编号 R1.1、R1.2，保留英文原文，不要转述后再回复。
2. 在表格里给每条意见填“类型 / 动作 / 修改位置 / 负责人 / 状态”，避免漏项。
3. 先处理会改变结论的意见，再处理文字和格式意见；否则页码和行号会反复变动。
4. 回复中只承诺已经完成或确定能完成的事；未完成的事写清约束和替代方案。

## 回复信的骨架

以下模板适用于多数英文期刊和会议。方括号内容全部替换；没有的内容删掉，不要保留占位符。

```text
Dear Dr. [Editor] / Dear Editor,

We thank you for handling our manuscript "[Title]" (Manuscript ID: [ID]) and for the reviewers' careful reading. We have revised the manuscript and respond to every comment below. Reviewer comments are quoted in italics, our responses follow, and the corresponding changes are listed with page and line numbers in the marked-up manuscript. Additions are shown in blue and deletions in red strikethrough.

General response
We appreciate the reviewers' constructive comments. The main changes are:
1. [Added experiment / analysis / section ...];
2. [Revised claim / scope ...];
3. [Improved presentation, figures, and reproducibility materials ...].
These changes are also summarized in the clean revised manuscript. We have been careful not to extend our claims beyond what the new evidence supports.

Reviewer 1

Comment 1.1
> [Quote the comment verbatim.]

Response:
We thank the reviewer for [specific point]. We agree that [restate the concern in our own words]. To address it, we [action: added experiment / re-analyzed data / revised text]. Specifically, [what was done, including settings and sample size]. The new results show [number or trend], which supports [bounded claim]. We also [additional check] to rule out [alternative explanation].

Changes:
- Page [X], lines [Y–Z]: "[new or revised sentence]".
- Fig. [N]([panel]): [what changed].
- Table [N]: [what changed].

Comment 1.2
> [Quote the comment verbatim.]

Response:
[Answer directly. If no new experiment is needed, say why and point to existing evidence.]

Changes:
- Page [X], lines [Y–Z]: [change].
- [If no change: "No textual change; clarification only."]

Reviewer 2

Comment 2.1
> [Quote the comment verbatim.]

Response:
[Same structure.]

Changes:
- [Location and exact change.]

Closing
We hope that the revisions address the reviewers' concerns. We would be glad to clarify any remaining point and to provide additional details where possible. Thank you for your time and consideration.

Sincerely,
[Authors]
[Affiliation]
[Email]
```

写作要点：

- Opening 只做三件事：致谢、说明修改幅度、说明阅读规则（引文、回复、修改位置、颜色标记）。
- General response 用 3–5 条概括“实质性改变”，不要重复逐条回复，也不要写成长篇诉苦。
- 每条回复的第一句直接回应，不要先铺陈背景；第二句给动作；第三句给证据或结果。
- Changes 只列可核对的位置和改动，不重复整段 Response。
- Closing 不引入新承诺，不写“we will definitely …”。

## 四类情形怎么写

### 同意并修改

思路：先确认对方指出的具体问题，再说明改了什么、改后结果如何，最后指出修改位置。不要用“感谢宝贵意见”代替实质内容。

```text
We thank the reviewer for this helpful comment. We agree that [specific issue]. In the revision, we [concrete action], using [data / setting / sample size]. As shown in [Table / Fig. / Section], [result or trend]. Accordingly, we revised [claim or sentence] to [new wording]. The changes are on Page X, lines Y–Z.
```

### 礼貌反驳

思路：承认关切合理，说明原设计的依据，补充透明性证据，并把声明收窄到证据支持的范围内。反驳的是“结论过强”，不是“审稿人不懂”。

```text
We appreciate the reviewer's concern about [issue]. Our original choice was motivated by [reason], and we agree that this point deserves clarification. [Evidence: theory, controlled test, or literature] shows that [bounded statement]. To make the comparison transparent, we now report [additional analysis] in [location] and state the condition under which our method is expected to hold. We have also revised [original claim] to [more cautious claim].
```

### 无法完成

思路：先给具体约束，再给替代证据，最后说明声明如何收窄。约束要可核验，例如数据许可、设备档期、野外季节、伦理审批，不要用“时间有限”一笔带过。

```text
We agree that [requested experiment] would be informative. Unfortunately, we cannot complete it within this revision because [specific constraint: licensed data unavailable / hardware not accessible / field campaign outside the season]. Instead, we [alternative: secondary dataset, simulation, subset analysis, or analytical bound], which addresses the underlying concern about [concern]. We have added this limitation to Section X and revised the claim from [strong claim] to [bounded claim]. The protocol is described in Supplementary Material so that the experiment can be repeated when [condition] becomes available.
```

### 审稿人误读

思路：先承认自己的表述制造了误读空间，再澄清原意，最后给出改写后的句子。不要写“The reviewer misunderstood”；写“our wording led to this reading”。

```text
We are sorry that our original wording led to this reading. The intended meaning was [X], but the reviewer's interpretation is understandable because [ambiguous phrase / undefined notation / missing scope]. We have rewritten the passage as [new text], defined [term] at first use, and added [figure / example] to make the scope explicit. We did not intend to claim [overclaim]; the revised text now says [bounded claim] (Page X, lines Y–Z).
```

## 测绘机器人领域高频意见 15 条

| 意见原话（英文） | 真实含义 | 该怎么回/补什么 |
|---|---|---|
| “The ground truth accuracy is insufficient to support the claimed centimeter-level accuracy.” | 审稿人怀疑真值本身的误差比论文声称的精度还大 | 报告真值获取方式、标定与时间同步、独立检核点和误差传播；把精度声明调整到真值不确定度支持的范围；补一张误差预算表 |
| “The evaluation is limited to a single dataset or scene.” | 结论可能只对一个场地成立 | 补跨场地、跨季节或跨平台数据；至少给逐场景结果和失败场景；讨论域偏移，不要只报平均值 |
| “The baselines are not tuned fairly.” | 怀疑对比方法和本文方法的调参预算不对等 | 用官方代码和推荐参数，统一输入、划分与评价脚本；说明搜索空间和预算；补调参敏感性或与作者确认的设置 |
| “The runtime is reported without hardware or implementation details.” | “实时”声明缺少可复现的计时口径 | 给 CPU/GPU 型号、线程、批量、输入分辨率、是否含预处理与 ROS 通信开销；报均值、P95/P99 和平台功耗（若适用） |
| “The ablation study is insufficient.” | 说不清哪个模块贡献了性能 | 做单因素消融，保持训练预算和评价协议一致；多随机种子；报告效应量和不升反降的结果 |
| “The evaluation metrics are not clearly defined.” | 指标口径模糊，结果无法复核 | 给公式、阈值、匹配规则、单位、平均方式和失败样本处理；说明与领域常用指标的区别；公开评测脚本 |
| “The contribution and experiments do not match.” | 贡献声明大于实验证据 | 做“贡献—实验—结论”映射表；每个贡献至少对应一个表或图；删掉没有证据支撑的贡献 |
| “The dataset is private and cannot be reproduced.” | 数据不可得，结果无法复现 | 能公开就公开；不能公开就给采集协议、传感器配置、划分文件、样例数据和申请方式；补公开数据上的结果 |
| “The code is not available.” | 可复现性不足 | 放代码、配置、随机种子和运行说明；能放权重就放；用匿名仓库或补充材料；说明依赖和硬件 |
| “The writing is unclear and hard to follow.” | 结构或术语增加了阅读成本 | 加路线图、符号表和贡献清单；重写长句；统一术语；请同行做一次“只看图表能否读懂”的检查 |
| “The claims are overstated.” | 标题、摘要或结论超出数据范围 | 把“first / always / robust”改成有条件表述；给适用场景和边界；让标题、摘要、结论三处口径一致 |
| “Failure cases are not analyzed.” | 方法弱点被隐藏，实用性存疑 | 给失败分类、触发条件、发生率和典型图；分析与本方法假设冲突的场景；说明可检测性和缓解措施 |
| “Comparison with existing surveying and mapping methods is missing.” | 没有放进测绘领域的基线体系 | 补 ICP、LiDAR-inertial、SfM/photogrammetry 或传统大地测量基线；统一坐标框架和评价口径；引用领域近五年的代表工作 |
| “Statistical significance is not established.” | 提升可能来自随机波动 | 多随机种子、均值±标准差、置信区间；配对检验并给效应量；说明样本独立性和多重比较处理 |
| “The figures are unreadable.” | 图在打印或缩放后无法获取信息 | 放大字体和线宽；改矢量图；检查色盲友好和灰度可读性；加比例尺、指北针、图例和自明图注 |

## 页码行号与修改标记

- 固定一份“marked-up manuscript”：连续行号、修改处高亮；所有页码行号都以这份文件为准，避免反复排版后错位。
- 每条修改用唯一编号（如 R1.2-C1），在回复信和修改清单中使用同一编号。
- 新增写“Page X, lines Y–Z: ‘…’ (added)”；删除写“Page X, lines Y–Z: ‘…’ was deleted”；替换写“replaced ‘old’ with ‘new’”。
- 图表写“Fig. 4(b)”或“Table 2, last row”，并说明是重绘、补数据还是改图注；不要只写“Fig. 4 updated”。
- 长段重写不要整段粘贴，给首句、尾句和修改位置，其余用 tracked changes 呈现。
- 中文期刊统一用“第 X 页第 Y 行”“图 N(b)”“表 N”，并与编辑部模板一致。
- 在回复信开头给一次颜色和标记说明；不要每段重复解释。

```text
R1.2-C1 | p. 7, ll. 145–152 | Added the ground-truth error budget (Table 3).
R2.1-C2 | Fig. 4(b) | Replotted with 95% confidence intervals; caption updated.
R3.3-C1 | Table 2, rows 4–6 | Added per-scene results and failure counts.
```

## 冲突意见怎么处理

两位审稿人要求相反时，不要二选一，也不要表面顺从、实际只改一边。用三段式：

1. **共同关切**：把两种要求翻译成同一个科学问题，例如“都要保证比较公平”，而不是“一个要加实验、一个要删实验”。
2. **裁决依据**：说明你依据什么做取舍，例如研究问题、数据许可、评价口径、篇幅限制；给可核对的理由。
3. **折中方案**：主文放核心结果，补充材料放扩展分析；或同时报告两种设置并说明差异；最后请编辑确认优先级。

```text
We note that Reviewer 1 recommends [A], whereas Reviewer 2 recommends [B]. We read both comments as concerns about [shared issue]. To address the shared concern, we [action that satisfies the underlying need]. This keeps [A's requirement] in the main text, while [B's concern] is addressed by [supplementary analysis / additional discussion]. If the editor prefers [B], we can move [material] to the supplementary and shorten [section] accordingly.
```

不要把矛盾意见原样丢给编辑；先给出自己的处理方案，再请编辑裁定。

落笔前先做三个判断：

- 两种要求是否真的互斥？有时只是审稿人看到了不同侧面，补一段跨设置分析即可同时满足。
- 冲突是否触及核心贡献？若只是篇幅或呈现顺序，优先服从编辑和期刊格式。
- 哪种选择更符合证据？不要按审稿人资历或语气做决定，按数据、协议和可复现性做决定。

## 禁忌

| 禁忌 | 常见表现 | 替代做法 |
|---|---|---|
| 争辩 | “The reviewer is wrong”“This is standard practice” | 复述关切，给证据，说明适用条件 |
| 情绪化 | 讽刺、反问、强调自己“花了几个月” | 只写事实、动作和结果 |
| 承诺做不到的实验 | “We will collect a new dataset in the revision”却没有数据来源 | 说明约束，给替代证据，收窄声明 |
| 只回一半 | 一条意见有 3 个问题，只答 1 个 | 拆成子问题逐项编号，逐项给 Changes |
| 推给未来工作 | 全部用“We leave this to future work”收尾 | 现在能做的分析先做；未来工作只用于确实超出范围的部分 |

定稿前做一次“反向阅读”：把回复信当成审稿人，只看 Comment 和 Changes，确认每个问题都能在修改稿里找到对应位置。找不到，就说明还没回完。
