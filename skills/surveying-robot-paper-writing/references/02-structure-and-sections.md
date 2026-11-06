# 章节写法

一篇论文的每一节只回答一个问题。答不上来就是这一节没写好，跟文笔无关。

| 章节 | 只回答这一个问题 | 常见失败 |
|---|---|---|
| 标题 | 这篇论文是什么 | 形容词堆叠、写"novel" |
| 摘要 | 问题—做法—结果，能否独立读懂 | 只有背景没有数字 |
| 引言 | 为什么非做不可，为什么现在没人做好 | 背景铺太长、缺口不具体 |
| 相关工作 | 别人做到哪，差在哪 | 按时间罗列、每篇一句"提出了" |
| 方法 | 怎么做，为什么这么做 | 只有公式没有动机、符号不自洽 |
| 实验设置 | 凭什么相信你的结果 | 真值不明、基线不公 |
| 结果 | 发生了什么 | 逐图描述、不给结论 |
| 讨论 | 为什么、什么时候不成立 | 重复结果、不敢认局限 |
| 结论 | 一句话带走什么 | 引入新内容 |

---

## 标题

**公式**：`〈方法特征〉+〈对象/场景〉+〈可验证的性质〉`

| 差 | 好 | 为什么 |
|---|---|---|
| A Novel Deep Learning Framework for Robust SLAM | LiDAR-Inertial Odometry with Explicit Degeneracy Detection for Long Tunnel Mapping | 去掉了 novel/robust，换成了可检验的具体机制与场景 |
| 基于深度学习的点云配准方法研究 | 顾及结构约束的隧道点云配准 | "研究"是废话，"顾及结构约束"是信息 |

三条纪律：

- 不写 `novel`、`robust`、`efficient`、`advanced`——这些词在标题里等于没写。
- 方法名可以造，但要在摘要里解释它指什么。
- 中文标题不用"研究""初探""浅析"，除非是综述。

---

## 摘要

**五句结构**，缺一句都会被要求改：

1. **场景与难点**（一句，具体到条件）
2. **现有做法的不足**（一句，点到具体假设）
3. **本文做法**（一到两句，机制级）
4. **关键结果**（必须带数字，且数字在正文可查）
5. **意义或结论**（一句，不要喊口号）

```text
Mapping in long tunnels remains difficult because geometric degeneracy
along the tunnel axis causes LiDAR odometry to drift severely.
Existing methods either rely on external aids or detect degeneracy
only after the estimate has already diverged.
We propose <method>, which <mechanism>, together with <second mechanism>.
On <N> tunnel sequences totalling <L> km, the proposed method reduces
the translational drift from <A>% to <B>% and keeps <metric> below <C>,
while running at <rate> on <hardware>.
These results indicate that <takeaway>.
```

中文：

```text
长隧道环境下的建图长期受困于沿轴向的几何退化，激光里程计漂移显著。
现有方法或依赖外部辅助，或在估计已经发散后才判定退化。
本文提出〈方法〉，通过〈机制一〉与〈机制二〉……。
在〈N〉段共〈L〉km 的隧道数据上，平移漂移由〈A〉% 降至〈B〉%，
〈指标〉保持在〈C〉以内，在〈硬件〉上以〈速率〉实时运行。
结果表明〈可推广的结论〉。
```

**自检**：把摘要单独发给一个没看过论文的人，他能否说出"这篇解决了什么、怎么做的、好多少"。说不出，重写。

---

## 引言

**五段漏斗**，段数可以±1，顺序不能变：

| 段 | 功能 | 长度 | 禁忌 |
|---|---|---|---|
| P1 | 这个场景为什么重要、为什么难 | 3–4 句 | 不要从"随着城市化进程"开始，直接进场景 |
| P2 | 现有方法分成 2–3 条技术路线 | 5–8 句 | 不要逐篇罗列，按路线归并 |
| P3 | **具体缺口**（≤3 条） | 4–6 句 | 只写"精度不够"不算缺口，要写清在什么条件下失效 |
| P4 | 本文思路（一句话讲清） | 2–3 句 | 不要在这里展开公式 |
| P5 | 贡献三条 + 结构预告 | 5–8 句 | 贡献不要与 P4 重复 |

**P3 是全篇最值钱的一段。** 写法：

```text
However, these approaches share a common assumption: <assumption>.
This assumption breaks down when <condition>, because <mechanism>.
As a result, <observable failure>, as reported in <evidence>.
```

三条缺口最好分别对应三条贡献——**读者读到这里就应该能猜到你的贡献**。

结构预告只用一句：`The remainder of this paper is organized as follows.`

---

## 相关工作

**按技术路线分组，不按时间。** 每组一段，段内三件事：这组在做什么 → 代表工作 → 共同的局限。

```text
<Group name> methods <approach> by <core idea> [refs].
Representative works include <A>, which <one clause>, and <B>, which <one clause>.
Despite their differences, these methods assume <shared assumption>,
which does not hold when <condition>.
```

四条纪律：

1. 一段只讲一条路线，末尾必须有一句"但"。
2. 每篇文献最多一句，不要复述摘要。
3. 与本工作最接近的 2–3 篇要单独一段，明确说"区别在哪"，否则审稿人会替你找。
4. 相关工作不是文献综述，**不要追求全**，追求"把缺口围出来"。

反面例子（典型 AI 生成句式，必须改）：

```text
X et al. proposed A. Y et al. proposed B. Z et al. proposed C.
```
——这是列表，不是论证。

---

## 方法

### 必备三件套

1. **系统框图**：输入 → 模块 → 输出，标清数据流与频率。
2. **符号表**：所有符号、含义、维度，一张表。
3. **坐标系定义**：世界系 `W`、机体系 `B`、雷达系 `L`、相机系 `C`、IMU 系 `I`，以及它们之间的变换写法 `T_WB`。**符号不自洽是本领域最常见的低级错误。**

### 每小节的四步

```text
动机（为什么需要这一步）→ 形式化（输入输出与公式）→ 实现要点（离散化/初始化/异常处理）→ 复杂度或代价
```

只有公式没有动机，会被批"engineering detail without justification"；只有文字没有公式，会被批"not reproducible"。

### 三条禁忌

- **不要贴代码**。要贴就贴伪代码，且不超过 15 行。
- **不要出现未定义的符号**。写完通读一遍，每个下标都要能在符号表里找到。
- **不要隐藏超参**。关键阈值、窗口长度、迭代次数，要么给值，要么给确定方法。

### 方法章节的自检

- [ ] 只看方法和图，别人能复现吗？
- [ ] 每个模块都回答了"不用它会怎样"吗？
- [ ] 复杂度分析有吗？实时性有依据吗？

---

## 实验设置

这一节决定审稿人信不信你。**四个表，缺一不可。**

**表 1 · 平台**

| 项 | 型号/参数 |
|---|---|
| 激光雷达 | 型号、线数、频率、测距精度、FoV |
| IMU | 型号、频率、零偏稳定性 |
| 相机 | 分辨率、帧率、镜头 |
| 轮速/其他 | … |
| 计算平台 | CPU/GPU 型号、内存 |
| 时间同步方式 | 硬同步/PTP/软同步，同步误差 |

**表 2 · 场景**

| 场景 | 地点 | 长度 | 速度 | GNSS | 天气/光照 | 特点 |
|---|---|---|---|---|---|---|

**表 3 · 真值**

| 真值来源 | 设备 | 标称精度 | 采样方式 | 覆盖范围 |
|---|---|---|---|---|

**表 4 · 基线与参数**

| 方法 | 版本/commit | 关键参数 | 是否原参数 | 运行硬件 |
|---|---|---|---|---|

表 4 最容易被攻击。**"是否原参数"这一列，是公平性的自证。**

---

## 结果

**每个结果小节的三段式**：

```text
结论句（这一小节证明了什么）→ 证据（表/图里的数字）→ 解释（为什么会这样）
```

反面写法（逐图描述，信息量为零）：

```text
图 5 展示了场景 A 的轨迹。图 6 展示了场景 B 的轨迹。图 7 展示了场景 C 的轨迹。
```

正面写法：

```text
The proposed method maintains sub-decimetre accuracy across all three
tunnel sequences (Table 3), whereas all baselines exceed 1 m drift
after 400 m. The gap widens with tunnel length, consistent with the
accumulation of the unobservable axial error discussed in Sec. IV-C.
```

**必须有一张总表**：行是方法，列是场景×指标，最优加粗。审稿人先看这张表，再决定要不要读正文。

**必须报失败案例。** 一个"全部成功"的结果表，反而降低可信度。

---

## 讨论

四块，按顺序：

1. **为什么有效**（机制层解释，不是重复结果）
2. **什么时候失效**（边界条件，给实证）
3. **与现有评测/规范的差距**（例如：你的精度还没达到 1:500 成图要求，要说清）
4. **局限性**（三条以内，诚实且具体）

```text
The improvement is attributable to <mechanism>, as confirmed by the
ablation in Table 5, where removing <component> increases <metric> by <X>.
The method fails when <condition>; in our field test, <observation>.
A limitation is that <limitation>, which we leave to future work.
```

**讨论不是结果的复述。** 如果一段话去掉数字后和结果节一样，删掉。

---

## 结论

三句话，不超过一段：

1. 做了什么（一句）
2. 得到什么（一句，可带一个关键数字）
3. 下一步（一句）

**禁忌**：引入新数据、新概念、新贡献；重复摘要；喊口号（"具有广阔的应用前景"）。

---

## 段落级模板：主—证—解—收

任何一段都可以套这个结构：

| 成分 | 作用 | 长度 |
|---|---|---|
| **主**（主题句） | 这段要证明什么 | 1 句 |
| **证**（证据） | 数据、引用、实验 | 1–3 句 |
| **解**（解释） | 为什么会这样 | 1–2 句 |
| **收**（收口） | 与下一段的接口 | 0–1 句 |

诊断技巧：**只读每段第一句**。如果读完成不了一个论证链，说明主题句写错了，或者这一段该拆。

---

## 中英句式速查

| 功能 | 中文 | 英文 |
|---|---|---|
| 指出缺口 | 然而，上述方法均假设……，该假设在……时不成立 | However, these methods assume …, which does not hold when … |
| 引出方法 | 为此，本文提出…… | To this end, we propose … |
| 说明区别 | 与……不同，本文…… | Unlike …, our approach … |
| 报结果 | 在……上，……由 A 降至 B | On …, … decreases from A to B |
| 承认局限 | 本文方法在……条件下失效 | Our method fails when … |
| 展望 | 后续将…… | Future work will … |
