# 实验设计与真值体系

这个领域的论文，**九成的争议都在真值上**。审稿人不会先看你的方法，会先看你的真值是怎么来的、精度多少。真值比结论还差，后面写得再漂亮也没用。

---

## 一条铁律

> **你能声称的精度上限，由真值的不确定度决定，不由你的算法决定。**

推论：

- 真值 ±5 cm，就只能说"厘米级"，不能说"毫米级"。
- 真值 ±2 cm，报"1.3 cm RMSE"要给出真值不确定度并说明如何扣除。
- 没有独立真值（拿训练/标定用的点当检查点），等于没有精度结论。

---

## 真值来源分级

| 级别 | 来源 | 典型精度量级 | 适用 | 陷阱 |
|---|---|---|---|---|
| A | 激光跟踪仪、室内动捕 | 亚毫米–毫米 | 室内小范围、标定验证 | 范围小，不能外推 |
| A | 全站仪/测量机器人测控制点 | 毫米级（1–2 mm + ppm） | 室外中近距离、检核点 | 点位布设与通视条件限制 |
| B | RTK（固定解） | 厘米级 | 开阔环境轨迹 | 多路径、遮挡时退化且**不报警** |
| B | PPK / 后处理 | 厘米级 | 无实时要求的轨迹 | 需要基站，基线长度影响 |
| B | 空三 + 像控点 | 厘米级（随 GSD） | 大范围地形/正射 | 像控点与检查点必须分开 |
| C | 人工标注/已知地物 | 分米级 | 粗略验证 | 主观性强，需多人复核 |
| C | 仿真 | 无真值误差 | 消融、极端条件 | sim-to-real gap 要讨论 |

> 精度量级为典型值，实际以设备标称精度、观测条件和作业方法为准。

### 选真值的三个问题

1. **目标精度是多少？** 先写下来（例如平面 5 cm）。
2. **真值不确定度是否 ≤ 目标精度的 1/3？** 不满足就换设备或改结论强度。
3. **真值与被测数据在时间和空间上对齐了吗？** 轨迹对比要时间对齐 + 空间对齐（SE(3) 或首帧对齐），点云对比要配准，且**配准误差要单独报**。

---

## 1/3 规则怎么用

| 你想声称 | 需要的真值 | 现实选择 |
|---|---|---|
| 毫米级 | ≤0.3 mm | 激光跟踪仪、动捕 |
| 厘米级（1–3 cm） | ≤1 cm | 全站仪控制点、高精度空三 |
| 分米级 | ≤3 cm | RTK、PPK |
| 米级 | ≤30 cm | 人工标注、粗略轨迹 |

做不到 1/3，有两條路：**降级表述**（"与 RTK 参考轨迹的偏差为 X cm"而不是"精度为 X cm"），或者**改实验设计**（增加独立检查点）。**不要靠多跑几次把标准差做小。**

---

## 不确定度怎么写

一段话，放在实验设置里：

```text
The reference trajectory was obtained by <method/device>, whose
positioning uncertainty is estimated at <value> (k = 2). Check points
were measured independently by <device> with a nominal uncertainty of
<value>. Since the reference uncertainty is below one third of the
target accuracy of <value>, it is considered adequate for evaluating
the proposed method.
```

中文：

```text
参考轨迹由〈设备/方法〉获取，其定位不确定度约为〈值〉（k=2）。
检核点由〈设备〉独立测定，标称不确定度为〈值〉。
参考值不确定度小于目标精度〈值〉的三分之一，可用于评价本文方法。
```

**注意**：不确定度要写清是标准不确定度还是扩展不确定度（k=2），别混。

---

## 场景矩阵

至少覆盖三个维度，且**每个维度都要有"不利条件"**：

| 维度 | 有利 | 不利 | 为什么必须有 |
|---|---|---|---|
| 几何结构 | 丰富纹理/结构 | 长走廊、隧道、大平面 | 退化是 SLAM 的命门 |
| GNSS | 开阔 | 城市峡谷、室内、地下 | 决定是否需要外部约束 |
| 动态性 | 静态 | 行人、车辆、植被晃动 | 动态物体是外点主源 |
| 尺度 | 短距离 | 长距离（>1 km） | 漂移随时间累积 |
| 天气/光照 | 晴 | 雨、雾、夜间、强光 | 激光与视觉的失效模式不同 |
| 平台 | 手持/背包 | 车载高速、无人机 | 运动模糊与振动 |

**场景数不是越多越好，是要能覆盖"你的方法承诺解决的那个条件"及其反面。**

---

## 对比基线：公平性协议

审稿人拆 baseline 的四个角度，逐个堵住：

| 角度 | 你要写的 | 写不出会怎样 |
|---|---|---|
| 版本 | 官方仓库地址 + commit/tag | "不知道你跑的是哪版" |
| 参数 | 关键参数表 + 是否用作者推荐值 | 被指"故意调差" |
| 硬件 | CPU/GPU 型号、线程数 | 实时性对比无效 |
| 输入 | 同一份数据、同一预处理 | 被指"喂了不同数据" |

**标准句**：

```text
All baselines were run with their officially released implementations
(commit <hash>) using the authors' recommended parameters, on the same
hardware and with identical input data. We additionally tuned <param>
over <range> for each method and report the best result.
```

跑不通的基线，明写：

```text
<Method> could not be reproduced because <specific reason>; we therefore
compare against its reported results on <dataset> under <setting>.
```

**"因故未比较"是最差的写法，"具体原因 + 替代方案"是可以接受的。**

---

## 消融

三种消融，按说服力排序：

1. **移除**（remove）：去掉模块，看掉多少 —— 最常用
2. **替换**（replace）：换成朴素实现，看差多少 —— 更能说明机制
3. **加回**（add-back）：从最简版本逐个加回 —— 适合模块多的系统

每条消融必须回答"这个模块解决了什么问题"，而不是"去掉它指标变差了"。

```text
Removing the degeneracy detector increases the translational drift from
0.4% to 2.1% (Table 5, row 3), confirming that the gain stems from
explicit degeneracy handling rather than from the added computational budget.
```

---

## 重复实验与统计

| 情况 | 做法 |
|---|---|
| 算法有随机性（初始化、采样、学习） | 至少 5 次，报 均值 ± 标准差 |
| 数据是确定性的 | 报单次结果 + 说明确定性 |
| 方法间比较 | Wilcoxon 符号秩检验（配对、非参数），给 p 值 |
| 样本很少（<5 段轨迹） | 不要做显著性检验，改为逐段列结果 |
| 实时性 | 报均值、95 分位、最大值，说明硬件与线程 |

**只报最好一次 = 学术不诚实。** 审稿人只要问一句"跑了几次"，就崩了。

---

## 失败案例怎么写

**先定义失败判据，再做实验。** 事后挑失败例子，会被怀疑选择性报告。

```text
We define failure as a translational error exceeding <threshold> over a
<length> segment. Under this criterion, the proposed method fails in
<scene>, where <observation>. The failure is caused by <mechanism>,
which we did not model.
```

失败案例的价值：

- 证明你**真的做过实验**（没人编失败案例）
- 给后续工作留接口
- 提前回答审稿人"极端情况呢"

---

## 可复现性声明

投稿必备一段，放在结论前或致谢前：

```text
The <dataset/code> used in this study is available at <link/upon request>.
All parameters, sensor configurations and evaluation scripts are
provided in the supplementary material.
```

四条底线：

- 代码能跑（哪怕只有核心部分）
- 参数齐全（阈值、窗口、迭代次数）
- 数据可获取（不能公开的要说明申请方式）
- 评测脚本与论文口径一致（同一个 RMSE 定义）

---

## 野外实验的合规与伦理

- **无人机**：空域申请、飞行许可、不得在禁飞区；论文里写清飞行高度与许可情况。
- **测绘资质**：涉及国家基本比例尺地形图成果的，注意保密与脱敏。
- **隐私**：街景/行人数据要脱敏，人脸与车牌打码。
- **安全**：隧道、地下、高压环境要有作业许可。

这些不写进论文，但会在数据发布或评审时被问。

---

## 实验设计自检

- [ ] 目标精度写下来了吗？
- [ ] 真值不确定度 ≤ 目标精度 1/3 吗？
- [ ] 真值与结果的时空对齐方式说明了吗？
- [ ] 场景矩阵覆盖了"承诺解决的条件"及其反面吗？
- [ ] 每个基线的版本/参数/硬件/输入都交代了吗？
- [ ] 跑不通的基线写清原因了吗？
- [ ] 消融的每组都对应一个模块吗？
- [ ] 随机性方法跑了几次？报的是均值还是最好值？
- [ ] 失败判据是事前定义的吗？
- [ ] 代码/数据/参数的可用性声明写了吗？
