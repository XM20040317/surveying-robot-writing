# 改稿实例：从"能投"到"能过"

四段真实稿件的典型改法。每段给出**原稿 → 问题标注 → 改后 → 改了什么**。原稿是按本领域常见写法构造的示例，不是某一篇具体论文。

---

## 例 1 · 摘要

### 原稿

```text
随着城市化进程的加快，隧道等地下空间的建设规模不断扩大。隧道环境下的
定位与建图对于城市基础设施运维具有重要意义。由于隧道内GPS信号缺失，
传统的定位方法难以满足要求。近年来，SLAM技术发展迅速，激光雷达凭借
其不受光照影响的优势被广泛应用。本文提出了一种基于深度学习的隧道
SLAM方法，通过改进特征提取网络和引入注意力机制，显著提高了定位精度
和鲁棒性。实验结果表明，本文方法优于现有方法，具有重要的理论意义和
工程应用价值。
```

### 问题标注

| # | 问题 | 违反的规则 |
|---|---|---|
| 1 | 前两句是"随着……"万能开头，删掉不影响任何信息 | `07` 中文 AI 味 |
| 2 | "具有重要意义"没有说清对谁、在什么条件下重要 | `02` 引言/摘要功能 |
| 3 | "SLAM 技术发展迅速"是背景复述，不是缺口 | `02` |
| 4 | 没有说清现有方法**在什么条件下**失效 | `01` 缺口要具体 |
| 5 | "改进特征提取网络""引入注意力机制"是模块名，不是机制 | `01` 伪创新第 1 条 |
| 6 | "显著提高""优于现有方法"没有一个数字 | `04` 指标三件套 |
| 7 | 没有真值、没有场景、没有基线 | `03` |
| 8 | 结尾是口号 | `02` 结论禁忌 |

### 改后

```text
长隧道环境下的建图长期受困于沿轴向的几何退化，激光里程计的平移误差
随距离迅速累积。现有方法多在估计发散后才发现退化，或依赖外部辅助设备，
难以在无 GNSS 的隧道内独立工作。
本文提出一种显式退化感知的激光惯性里程计：用局部点云协方差的最小特征值
构造退化因子，在因子图优化中对退化方向施加轮速约束，并在初始化阶段
用静止检测估计 IMU 零偏。
在三段共 3.6 km 的隧道数据上，本文方法的平移漂移由 2.1% 降至 0.4%，
最大高程误差由 0.86 m 降至 0.11 m，在单线程 CPU 上以 42 Hz 运行。
结果表明，显式建模退化方向比事后剔除退化帧更有效。
```

### 改了什么

1. 删掉两句背景，直接从"难点"开始。
2. 把"GPS 缺失"换成"沿轴向几何退化"——**具体到失效机理**，这才叫缺口。
3. 方法从"模块名"改成"机制名"：退化因子、轮速约束、零偏估计。
4. 结果补全：场景（3 段隧道）、长度（3.6 km）、基线（2.1%）、本文（0.4%）、代价（单线程 CPU、42 Hz）。
5. 结尾从口号改成**可推广的结论**（显式建模优于事后剔除）。

---

## 例 2 · 实验设置

### 原稿

```text
实验采用自研的移动测量平台，搭载激光雷达和IMU。数据采集于某市隧道，
共三段。以RTK作为真值评价定位精度。对比方法包括LOAM和LIO-SAM。
```

### 问题标注

| # | 问题 | 后果 |
|---|---|---|
| 1 | 激光雷达、IMU 无型号、无频率、无精度 | 无法判断数据质量 |
| 2 | 隧道内 RTK 不可用，却写"以 RTK 为真值" | **致命**：真值来源不成立 |
| 3 | 隧道长度、速度、GNSS 状态未给 | 无法判断难度 |
| 4 | 基线无版本、无参数、无硬件 | 公平性无法评估 |
| 5 | 没有时间同步说明 | 多传感器论文必查项 |
| 6 | 没有真值精度 | 精度结论无法评估 |

### 改后

```text
平台搭载 16 线机械式激光雷达（10 Hz，测距精度 ±3 cm）与工业级 IMU
（200 Hz，零偏稳定性 8 °/h），两者经 PPS 硬件同步，同步误差小于 1 ms。

数据采集于三段隧道，长度分别为 0.8、1.2、1.6 km，车速 30–50 km/h，
全程无 GNSS 信号。另采集一段 0.9 km 的城市道路作为对照，该段 GNSS
固定解可用。

真值由全站仪在隧道内布设的 46 个控制点提供，点位中误差优于 5 mm；
轨迹真值通过控制点约束的导线推算，末端闭合差 3.2 cm。控制点间隔
约 80 m，均匀分布于隧道两侧。

对比方法 LOAM（commit 3e9f2a1）与 LIO-SAM（commit a1b2c3d）均使用
作者推荐参数，在同一台笔记本（i7-11800H，单线程）上运行，输入为
同一份去畸变后的点云。我们额外对 LOAM 的角点阈值在 [0.05, 0.2]
范围内调参并取最优结果。
```

### 改了什么

1. 传感器补齐型号、频率、精度、同步方式与误差。
2. **真值来源彻底换掉**：隧道里没有 RTK，改用全站仪控制点 + 导线推算，并给出闭合差。
3. 补了控制点数量、间隔、分布。
4. 基线补 commit、参数、硬件、输入，并写明调参预算。
5. 加了一段城市道路对照，给"泛化性"留证据。

---

## 例 3 · 结果

### 原稿

```text
图5展示了场景A的轨迹，图6展示了场景B的轨迹，图7展示了场景C的轨迹。
从图中可以看出，本文方法的轨迹与真值更加接近，而对比方法存在明显漂移。
表2列出了各方法的RMSE，本文方法取得了最好的结果。
```

### 问题标注

| # | 问题 | 后果 |
|---|---|---|
| 1 | 逐图描述，没有结论 | 信息量为零 |
| 2 | "更加接近""明显漂移"没有量化 | 不可检验 |
| 3 | "取得了最好的结果"没有数字、没有幅度 | 审稿人无法判断提升是否有意义 |
| 4 | 没有解释为什么 | 像实验报告 |
| 5 | 没有失败场景 | 可信度下降 |

### 改后

```text
本文方法在三段隧道上均保持亚分米级精度（表 2），而两个基线在 400 m 后
漂移均超过 1 m。差距随隧道长度增大，与第 IV-C 节分析的轴向不可观测量
累积一致。

在 1.6 km 的最长序列上，本文方法的末端误差为 0.19 m，LOAM 与 LIO-SAM
分别为 3.41 m 与 2.87 m；去掉退化因子后，本文方法的末端误差上升至
2.96 m（表 3 第 3 行），说明精度提升主要来自退化方向的显式约束，
而非额外的计算开销。

方法在城市道路段并无优势（表 2 第 4 行），此时三者误差均在 0.3 m 以内，
表明本文方法的收益集中在退化场景。
```

### 改了什么

1. 第一句就是结论，并给出可核对的数字。
2. 用"随距离增大"把现象和机理连起来。
3. 引用消融，把"为什么有效"说清楚。
4. 主动报出**没有优势**的场景——这反而增强可信度。

---

## 例 4 · 审稿回复

### 审稿意见

```text
The authors claim centimetre-level accuracy, but the ground truth is
obtained from RTK, which itself has decimetre-level uncertainty in the
tested environment. The accuracy claim is therefore not supported.
```

### 原稿回复（错误示范）

```text
We thank the reviewer for this comment. We have added more experiments
and revised the manuscript accordingly. We believe the accuracy is
convincing.
```

三个问题：没有回应具体质疑、没有说明改了什么、"believe"不是证据。

### 改后

```text
We thank the reviewer for pointing out this important issue, which we
agree with. In the original manuscript we used RTK as the reference in
tunnel sections where RTK was in fact unavailable, and we did not report
its uncertainty.

We have now replaced the reference with total-station control points:
46 points were measured with a positional uncertainty better than 5 mm
(k = 2), spaced approximately 80 m along the tunnel. The reference
trajectory is derived by traverse adjustment with a closing error of
3.2 cm. Because the reference uncertainty is below one third of the
reported accuracy, we believe the accuracy claim is now supported.

Accordingly, we have (i) rewritten Section V-A (p. 7, lines 12–28),
(ii) added Table 4 summarising the reference uncertainty, and
(iii) revised the abstract to state "sub-decimetre" instead of
"centimetre-level" where the reference does not support the stronger claim.

Changes: p. 7, l. 12–28; p. 9, Table 4; p. 1, l. 18.
```

### 改了什么

1. 先**承认**（"which we agree with"），不辩解。
2. 说清**原稿错在哪**——不是"表述不清"，是真值不成立。
3. 给出**新方案的具体参数**（46 点、5 mm、80 m、3.2 cm 闭合差）。
4. 用 1/3 规则说明**为什么现在成立**。
5. 三条 changes 精确到页码行号。
6. 顺手把摘要里过强的声明**降级**——这是最加分的一步。

---

## 四条通用规律

| 规律 | 说明 |
|---|---|
| **先数字，后形容** | "显著提升"改成"由 2.1% 降至 0.4%" |
| **先机理，后现象** | "为什么漂移"比"漂移多少"更像论文 |
| **先认错，后解释** | 回复信里先同意再说明，比先辩解有效十倍 |
| **主动报短板** | 失败场景、无优势场景、代价，主动写出来会提高可信度 |

---

## 用这一节做训练

拿你自己最近一段稿子，按上面的格式做一遍：

1. 贴原稿
2. 列问题表（每条对应到 `01`–`09` 的具体规则）
3. 改写
4. 写"改了什么"

做满四段（摘要、实验、结果、回复），这套规则就变成你自己的了。
