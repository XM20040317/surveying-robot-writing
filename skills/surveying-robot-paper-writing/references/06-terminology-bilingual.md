# 中英术语对照与用词纪律

术语不一致不是文字小疵，而是审稿人判断作者是否真正掌控问题的入口：同一对象在摘要叫 mobile mapping system、方法部分叫 MMS platform、实验部分又叫 surveying robot；缩写第一次出现没有全称，后文却直接使用；中文论文的英文摘要把“点云配准”写成 point cloud matching、把“中误差”写成 mean square error。这些不一致会让读者怀疑概念边界、实验可比性与复现性。下面先给可直接查用的分类对照表，再给易混词、缩写模板和中文期刊与英文期刊的语体差异。

## 1. 系统与平台

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 移动测量系统 | mobile mapping system | MMS | ✗ mobile survey system（语义漂移）；✓ 首次写全称并限定平台，如 vehicle-borne MMS。 |
| 测绘机器人 | surveying robot / mobile mapping robot | — | ✗ measuring robot（易误解为测量仪器）；✓ surveying robot 或 mobile mapping robot，并在首次出现说明是移动平台还是全站仪。 |
| 测量机器人（全站仪） | robotic total station | RTS | ✗ surveying robot（与移动测绘机器人混淆）；✓ robotic total station（RTS）。 |
| 无人机 | unmanned aerial vehicle | UAV | ✗ drone（正式标题中偏口语）；✓ UAV，若为旋翼平台写 rotorcraft UAV。 |
| 背包式平台 | backpack-mounted platform | — | ✗ backpack type；✓ backpack-mounted，后接 platform 或 system。 |
| 手持式平台 | handheld platform | — | ✗ hand-held（同一文混用）；✓ handheld，全文统一。 |
| 车载平台 | vehicle-mounted platform | — | ✗ car-carried；✓ vehicle-mounted 或 vehicle-borne，全文统一。 |
| 船载平台 | vessel-mounted platform | — | ✗ boat-carried；✓ vessel-mounted；若为无人船写 USV-mounted。 |
| 云台 | gimbal | — | ✗ cloud platform（字面直译）；✓ gimbal 或 stabilized gimbal；仅两轴转动可写 pan-tilt unit。 |
| 惯性测量单元 | inertial measurement unit | IMU | ✗ inertial navigation unit（INS 含解算）；✓ IMU 指器件或数据，INS 指导航系统。 |
| 轮速计 | wheel odometer | — | ✗ wheel speedometer（只测速度）；✓ wheel odometer；仅测转速写 wheel speed sensor。 |
| 激光雷达 | light detection and ranging | LiDAR | ✗ laser radar（易与雷达混淆）；✓ LiDAR，首次给全称。 |
| 全景相机 | panoramic camera | — | ✗ panorama camera；✓ panoramic camera，图像写 panoramic image。 |
| 全球导航卫星系统 | global navigation satellite system | GNSS | ✗ GPS（系统实际为多星座时）；✓ GNSS；仅使用 GPS 时写 GPS。 |

## 2. SLAM 与状态估计

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 前端 | front end | — | ✗ frontend（与后文不一致）；✓ 名词 front end，定语 front-end，全文统一。 |
| 后端 | back end | — | ✗ back-end（名词位置）；✓ back end；定语写 back-end module。 |
| 紧耦合 | tightly coupled | — | ✗ close coupled；✓ tightly coupled，并说明耦合的状态或量测。 |
| 松耦合 | loosely coupled | — | ✗ loose coupling（名词化不当）；✓ loosely coupled fusion。 |
| 回环检测 | loop closure detection | — | ✗ loop closing detection（重复）；✓ loop closure detection；回环校正写 loop closure。 |
| 位姿图优化 | pose graph optimization | PGO | ✗ position graph optimization；✓ pose graph optimization，节点为位姿。 |
| 边缘化 | marginalization | — | ✗ marginalization error（把操作当误差）；✓ marginalization，保留 prior。 |
| 可观性 | observability | — | ✗ observability ability（冗余）；✓ observability；不可观方向写 unobservable directions。 |
| 退化 | degeneracy | — | ✗ degradation（性能下降）；✓ degeneracy（几何秩亏），性能下降才用 degradation。 |
| 零速修正 | zero-velocity update | ZUPT | ✗ zero-speed correction（非标准）；✓ zero-velocity update（ZUPT）；检测另写 zero-velocity detection。 |
| 扫描匹配 | scan matching | — | ✗ point cloud matching（过泛）；✓ scan matching 或 scan-to-map matching。 |
| 惯性预积分 | IMU preintegration | — | ✗ pre-integration（拼写不一）；✓ IMU preintegration，全文统一。 |
| 重定位 | relocalization | — | ✗ re-localization（拼写不一）；✓ relocalization，指跟踪失败后的全局定位。 |
| 地图一致性 | map consistency | — | ✗ map consistence；✓ map consistency，全局一致写 global consistency。 |

## 3. 传感器与标定

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 内参 | intrinsic parameters | — | ✗ internal parameters；✓ intrinsic parameters（常用复数），单数写 intrinsic parameter。 |
| 外参 | extrinsic parameters | — | ✗ external parameters；✓ extrinsic parameters，注明变换方向 T_A_B。 |
| 时间同步 | time synchronization | — | ✗ time alignment（含义更窄）；✓ time synchronization，区分 hardware 与 software synchronization。 |
| 手眼标定 | hand-eye calibration | — | ✗ 把任意传感器外参都叫 hand-eye；✓ 仅机械臂或云台与相机联动时用，普通传感器对写 extrinsic calibration。 |
| 畸变 | distortion | — | ✗ aberration（像差）；✓ lens distortion，注明 radial 或 tangential。 |
| 视场角 | field of view | FOV | ✗ view angle；✓ field of view（FOV），注明 horizontal、vertical 或 diagonal。 |
| 测距精度 | ranging accuracy | — | ✗ 把 precision 一律写成 accuracy；✓ 偏差用 ranging accuracy，重复性用 ranging precision，并给测试条件。 |
| 角分辨率 | angular resolution | — | ✗ angle resolution；✓ angular resolution；光束发散角写 beam divergence。 |
| 标定板 | calibration target | — | ✗ calibration plate（非平面目标不适用）；✓ calibration target，平面时写 planar target。 |
| 杆臂 | lever arm | — | ✗ lever arm error（混淆量与误差）；✓ lever arm 表示平移偏置，角度偏置写 boresight misalignment。 |
| 安装误差 | mounting error | — | ✗ installation error（口语）；✓ mounting error 或 misalignment，说明平移或旋转。 |
| 时间戳 | timestamp | — | ✗ time stamp（同文混用）；✓ timestamp（名词），全文统一。 |
| 联合标定 | joint calibration | — | ✗ combined calibration（语义模糊）；✓ joint calibration，说明哪些参数联合估计。 |
| 在线标定 | online calibration | — | ✗ real-time calibration（把时限当在线）；✓ online calibration；实时性另写 real-time performance。 |

## 4. 点云与几何

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 配准 | registration | — | ✗ alignment（可作通俗说法，但标题与术语用 registration）；✓ point cloud registration。 |
| 粗配准 | coarse registration | — | ✗ rough registration；✓ coarse registration 或 global registration。 |
| 精配准 | fine registration | — | ✗ precise registration；✓ fine registration 或 local registration，细化阶段写 refinement。 |
| 迭代最近点 | iterative closest point | ICP | ✗ iterative nearest point；✓ iterative closest point（ICP）。 |
| 正态分布变换 | normal distributions transform | NDT | ✗ normal distribution transformation（名称不标准）；✓ normal distributions transform（NDT）。 |
| 广义迭代最近点 | generalized iterative closest point | GICP | ✗ generalized ICP（首次未给全称）；✓ generalized iterative closest point（GICP）。 |
| 法向量 | normal vector | — | ✗ normal direction（方向与向量混用）；✓ normal vector，注意朝向符号歧义。 |
| 点密度 | point density | — | ✗ point cloud density（未说明维数）；✓ point density，注明 points/m² 或 points/m³。 |
| 完整性 | completeness | — | ✗ integrity（完整、诚信，非覆盖率）；✓ completeness 表示覆盖完整程度。 |
| 重叠度 | overlap ratio | — | ✗ overlap degree；✓ overlap ratio；摄影测量航向重叠写 overlap。 |
| 点云分块 | point cloud tiling | — | ✗ point cloud blocking（易与遮挡混淆）；✓ tiling 或 partitioning，注明块大小与重叠。 |
| 下采样 | downsampling | — | ✗ down-sampling（同文混用）；✓ downsampling，注明 voxel 或 random。 |
| 体素 | voxel | — | ✗ voxel grid filter（把滤波器当体素）；✓ voxel；滤波写 voxel-grid filtering。 |
| 地面滤波 | ground filtering | — | ✗ ground removal（口语）；✓ ground filtering（生成 DEM 时），机器人场景可用 ground segmentation。 |

## 5. 摄影测量

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 空中三角测量 | aerial triangulation | AT | ✗ air triangulation；✓ aerial triangulation（AT），不要与 BA 混用。 |
| 光束法平差 | bundle adjustment | BA | ✗ bundle block adjustment（只是其中一种）；✓ bundle adjustment（BA）。 |
| 像控点 | ground control point | GCP | ✗ image control point（字面直译）；✓ ground control point（GCP）。 |
| 检查点 | check point | CP | ✗ checkpoint（机器学习语义）；✓ check point 或 independent check point，且未参与平差。 |
| 基高比 | base-to-height ratio | B/H | ✗ base-height ratio；✓ base-to-height ratio（B/H），注明基线或航高的定义。 |
| 地面分辨率 | ground sample distance | GSD | ✗ ground resolution（不精确）；✓ GSD，单位写 cm/pixel。 |
| 倾斜摄影 | oblique photogrammetry | — | ✗ tilt photography；✓ oblique photogrammetry 或 oblique aerial photography。 |
| 实景三维 | 3D real-scene model | — | ✗ real 3D（字面直译）；✓ 首次定义 3D real-scene model，英文期刊可改写为 photorealistic 3D reconstruction。 |
| 纹理映射 | texture mapping | — | ✗ texture pasting；✓ texture mapping，纹理图集写 texture atlas。 |
| 密集匹配 | dense image matching | — | ✗ dense matching（对象不明）；✓ dense image matching；多视立体写 multi-view stereo（MVS）。 |
| 正射影像 | orthophoto | — | ✗ orthographic image；✓ orthophoto 或 orthomosaic；真正射写 true orthophoto。 |
| 数字表面模型 | digital surface model | DSM | ✗ 把 DSM 写成 DEM；✓ DSM 含地物，DEM 为裸地。 |
| 核线约束 | epipolar constraint | — | ✗ epipolar geometry constraint（冗余）；✓ epipolar constraint；核线校正写 epipolar rectification。 |
| 影像金字塔 | image pyramid | — | ✗ image tower（字面直译）；✓ image pyramid，层级写 pyramid level。 |

## 6. 精度与质量

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 准确度 | accuracy | — | ✗ 用 precision 代替；✓ accuracy 表示与参考值接近的程度，给指标与条件。 |
| 精密度 | precision | — | ✗ 用 accuracy 代替；✓ precision 表示重复观测的离散程度。 |
| 正确度 | trueness | — | ✗ 与 accuracy 混用；✓ trueness 表示均值偏差；ISO 5725 中 accuracy 含 trueness 与 precision。 |
| 精度（泛称） | 不单独译为 precision | — | ✗ 全文只写“高精度”；✓ 首次出现即界定为 accuracy、precision 或 RMSE 中的哪一个。 |
| 中误差 | root mean square error | RMSE | ✗ 英译为 mean square error（MSE）；✓ 测绘语境通常对应 RMSE，回译时先核对定义。 |
| 限差 | tolerance | — | ✗ limited error；✓ tolerance 或 permissible deviation，注明限差依据。 |
| 粗差 | gross error | — | ✗ rough error；✓ gross error 或 outlier，区分粗差与随机离群。 |
| 系统误差 | systematic error | — | ✗ system error；✓ systematic error 或 bias，说明是否已改正。 |
| 偶然误差 | random error | — | ✗ accidental error；✓ random error，与精密度关联。 |
| 不确定度 | uncertainty | — | ✗ 与 error 混用；✓ uncertainty，报告置信水平与包含因子 k。 |
| 重复性 | repeatability | — | ✗ reproducibility；✓ repeatability 指同一条件重复测量。 |
| 复现性（可复现性） | reproducibility | — | ✗ repeatability；✓ reproducibility 指改变条件或由独立团队复现。 |
| 分辨率 | resolution | — | ✗ precision；✓ resolution 指可分辨的最小间隔，注明距离或角度。 |
| 偏差 | bias | — | ✗ error（总称）；✓ bias 指系统性偏移，随机部分另述。 |

## 7. 评价与统计

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 均值±标准差 | mean ± standard deviation | SD | ✗ mean ± variance；✓ mean ± SD，并注样本量 n。 |
| 置信区间 | confidence interval | CI | ✗ 95% probability interval（频率学派误读）；✓ 95% confidence interval，说明计算方法。 |
| 显著性检验 | significance test | — | ✗ significance experiment；✓ significance test，报告检验名、统计量与 p 值。 |
| 基线 | baseline | — | ✗ base line；✓ baseline，区分强基线与其复现版本。 |
| 泛化 | generalization | — | ✗ generalization ability（冗余）；✓ generalization 或 generalization performance，说明未见场景。 |
| 样本量 | sample size | — | ✗ number of data（对象不明）；✓ sample size，按序列或测区分别报告。 |
| 统计显著 | statistically significant | — | ✗ significant（也可表示“重要”）；✓ statistically significant，并给 p 值与效应量。 |
| 效应量 | effect size | — | ✗ effect value；✓ effect size（如 Cohen's d），不要只报 p。 |
| 交叉验证 | cross-validation | CV | ✗ cross validation（拼写不一）；✓ cross-validation；空间数据用空间分块。 |
| 配对检验 | paired test | — | ✗ pairing test；✓ paired test，配对单位要说明。 |
| 多重比较 | multiple comparisons | — | ✗ multiple comparison（单复数混用）；✓ multiple-comparison correction。 |
| 方差分析 | analysis of variance | ANOVA | ✗ variance analysis（字面直译）；✓ analysis of variance（ANOVA）。 |
| 非参数检验 | non-parametric test | — | ✗ nonparametric（同文混用）；✓ non-parametric test，全文统一连字符。 |
| 误差棒 | error bar | — | ✗ error bar 不注明含义；✓ 图注说明是 SD、SE 还是 CI。 |

## 8. 论文写作动作

| 中文 | 英文 | 缩写 | 用法要点与误用对照（✗ → ✓） |
|---|---|---|---|
| 贡献 | contribution | — | ✗ innovation point（字面直译）；✓ contribution，写成可检验的具体贡献。 |
| 创新点 | novelty | — | ✗ first-ever（无检索依据）；✓ novelty，谨慎写 to our knowledge, we are the first to...。 |
| 消融实验 | ablation study | — | ✗ ablation experiment（可用但不优先）；✓ ablation study，保持数据与评测协议不变。 |
| 对比实验 | comparative experiment | — | ✗ contrast experiment；✓ comparative experiment 或 comparison，使用同一划分。 |
| 鲁棒性 | robustness | — | ✗ robustness performance（冗余）；✓ robustness to...，说明扰动类型与强度。 |
| 实时性 | real-time performance | — | ✗ real time performance；✓ real-time performance，报告硬件、延迟与频率。 |
| 计算开销 | computational cost | — | ✗ calculation cost；✓ computational cost，分别报告时间与内存。 |
| 局限性 | limitations | — | ✗ shortage（字面直译）；✓ limitations，写具体失效场景而非套话。 |
| 可复现性 | reproducibility | — | ✗ 与“可重复性（repeatability）”混用；✓ reproducibility，涉及代码、数据与配置。 |
| 开源 | open-source release | — | ✗ open source（作动词）；✓ release the code as open source；定语用 open-source。 |
| 复现 | reproduce | — | ✗ repeat（语义过宽）；✓ reproduce 结果，replicate 独立重复研究。 |
| 评测协议 | evaluation protocol | — | ✗ test protocol（含义较窄）；✓ evaluation protocol，含数据划分、指标与阈值。 |
| 定性结果 | qualitative results | — | ✗ qualitative experiment；✓ qualitative results，展示典型成败案例。 |
| 定量结果 | quantitative results | — | ✗ quantitative experiment（可用但空泛）；✓ quantitative results，给表格、指标与统计。 |

## 最容易写错的 15 组

| 易混组 | 前者何时用 | 后者何时用 | 判别句 |
|---|---|---|---|
| precision / accuracy | 问“重复测量有多集中”：precision | 问“离参考值有多近”：accuracy | 打靶密集但不中靶 = 高 precision、低 accuracy。 |
| calibration / registration | 估计传感器内外参、时间偏移：calibration | 估计两期点云或影像间的空间变换：registration | 标定求“传感器参数”，配准求“数据间变换”。 |
| localization / mapping | 在已知或正在维护的地图中估计位姿：localization | 构建或更新环境地图：mapping | 定位问“我在哪”，建图问“环境是什么样”。 |
| pose / position | 需要姿态与平移，6DoF：pose | 只讨论平移坐标：position | 有旋转用 pose，只有坐标用 position。 |
| drift / error | 误差随时间累积、无界增长：drift | 某一时刻或位置的偏差：error | 漂移是随时间累积的误差，不是所有 error 都叫 drift。 |
| RMSE / 中误差 | 英文指标、与观测量同单位：RMSE | 中文测绘语境、按中误差定义报告：中误差 | 不要把中误差英译成 MSE；回译 RMSE 前核对分母与定义。 |
| evaluation / validation | 报告指标、比较方法：evaluation | 检验是否满足使用目的或迁移到独立数据：validation | 评测看“分数”，验证看“结论是否站得住”。 |
| dataset / benchmark | 只指数据集合：dataset | 数据、划分、指标、协议合在一起：benchmark | 有数据无协议是 dataset，有协议可复现比较才是 benchmark。 |
| robust / accurate | 扰动、噪声、缺失下性能稳定：robust | 正常条件下误差小：accurate | 抗扰动说 robust，低误差说 accurate。 |
| real-time / online | 满足明确时延或频率约束：real-time | 数据流到达即更新，不要求低延迟：online | 在线不等于实时；实时必须给时限。 |
| map / mapping | 名词，地图产物：map | 过程或函数，建图：mapping | 产物是 map，过程是 mapping。 |
| trajectory / path | 随时间记录的实际或估计运动：trajectory | 规划出的几何路线：path | 走过的是 trajectory，规划的是 path。 |
| bias / error | 可重复的系统性偏移：bias | 总偏差，含随机与系统成分：error | 能通过标定重复出现的偏移是 bias。 |
| repeatability / reproducibility | 同一条件、同一操作者重复：repeatability | 改变条件或由独立团队复现：reproducibility | 同条件重复是 repeatability，换条件复现是 reproducibility。 |
| ground truth / reference | 可视为真值的仿真或高精度控制：ground truth | 有不确定度的实测基准：reference | 实测基准优先写 reference，不要把参考值一律称 truth。 |

## 缩写首次出现模板

同一缩写全文只定义一次；摘要是否重复定义取决于期刊是否要求摘要自含，投稿前查作者指南。全称与缩写之间用括号连接，中文用全角括号，英文用半角括号。

```text
本文构建车载移动测量系统（mobile mapping system，MMS），集成激光雷达（light detection and ranging，LiDAR）与惯性测量单元（inertial measurement unit，IMU）。针对同步定位与建图（simultaneous localization and mapping，SLAM）中的回环检测问题，提出……；采用均方根误差（root mean square error，RMSE）评价轨迹精度。
```

```text
This paper presents a vehicle-borne mobile mapping system (MMS) that fuses light detection and ranging (LiDAR) data with measurements from an inertial measurement unit (IMU) for simultaneous localization and mapping (SLAM). Loop closure detection is formulated as ...; trajectory accuracy is reported as the root mean square error (RMSE).
```

## 中文期刊与英文期刊的用词差异

以下是语体习惯，不是期刊规定；具体格式以目标刊作者指南为准。

| 中文习惯 | 英文期刊更接受的说法 | 说明 |
|---|---|---|
| 进行了分析 | We analyze 或 analyzed... | 用具体动词，避免“进行+名词”。 |
| 具有重要的理论意义和应用价值 | This enables... 或 This matters because... | 把意义写成可验证的作用。 |
| 精度较高 | 报告 RMSE、单位与测试条件 | 删掉无依据的程度词。 |
| 众所周知 | 删去，或给出可核查的文献依据 | 不靠“众所周知”代替引用。 |
| 本文首次提出 | We propose...；如确有检索依据再写 to our knowledge, this is the first... | first 是强主张。 |
| 大量实验表明 | Experiments on all test sequences show... | 给出范围，不虚报“大量”。 |
| 如图 1 所示，可以看出 | Figure 1 shows... | 删“可以看出”，直接描述。 |
| 对其进行了研究 | We investigate... | 补出研究对象。 |
| 达到了国际先进水平 | performs comparably to... under... | 没有基准就不要排名。 |
| 方法简单、易于实现 | The method requires only... | 把“简单”换成可实现条件。 |
| 综上所述 | Together, these results indicate... | 中文套话换成有主语的归纳。 |
