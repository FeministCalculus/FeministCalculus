# Fc-public

Fc Formalism 公开层仓库 —— Feminist Calculus Framework（Fc）的核心文档、CCST 系统接口、TIFM 实证执行。

## 仓库定位

本仓库包含 Fc Formalism 系统中**可公开**的内容：

- **核心层**（`core/`）：当前主版本的所有冻结/草案文档
- **外围层**（`peripheral/`）：与其他理论的比较分析、衍生定理集
- **图表**（`figures/`）：TIFM 4.0 Swarm 数据可视化（待补）

## 目录结构

```
.
├── core/                                      # 11 份主文档 + 实证代码
│   ├── Fc-v9.6.8-REVISED-Core.md             # Fc 框架主体（当前版本）
│   ├── Fc-v9.6.8-Appendix-E-PNE.md           # 13 独立维度六栏模板
│   ├── Fc-v9.6.8-Appendix-F-Cases.md         # 锚定案例增补
│   ├── Fc-v9.6.8-Appendix-G-A6-Protocol.md   # A6 寂灭定理双层指标
│   ├── DFN-v2.5-HARDENED.md                  # 边界协议栈
│   ├── CCST-v3.10.0-HARDENED.md              # 复杂系统崩溃理论
│   ├── ChPP-v1.2-DRAFT.md                    # 儿童保护协议
│   ├── DEG-v2.21.md                          # 节点审计协议
│   ├── TIFM-4.0-Final-Summary.md             # TIFM 4.0 最终摘要
│   ├── TIFM-4.0-Swarm-Execution-Report.md    # TIFM 4.0 执行详情
│   ├── TIFM-4.1-Roadmap.md                   # 因果检验路线图
│   └── code/                                  # TIFM 4.1 实证代码 [DATA-PENDING]
│       ├── bootstrap_hk.py                   # ℋ_k Bootstrap 置信区间
│       ├── granger_framework.py              # 3 变量 Granger 因果检验
│       └── panel_var_framework.py            # 面板 VAR 跨分量相关
│
├── cases/                                     # 案例库
│   ├── Fc-v9.6.8-Appendix-F-Cases.md         # 锚定案例增补（A4/A7/A2）
│   ├── 背刺定理历史案例库 | v1.0-DRAFT.md     # 9案例跨历史验证
│   └── 高校&职场男性竞争清算案例库｜1994-2025.md  # 30年8案模式分析
│
├── peripheral/                                # 外围分析与衍生定理
│   ├── Fc-RadFem-v1.0.1-HARDENED.md          # 与 RadFem 的比较（结论摘要）
│   ├── Fc-RadFem-analysis-v1.0-DRAFT.md      # 与 RadFem 的比较（完整推导）
│   ├── Fc-Peripheral-Analysis-v1.0.4-DRAFT.md # 含 SCA 三形态（SCA-β 中国特异性）
│   ├── Fc-Derived-001-HARDENED.md            # 再生产决策权三命题定理
│   ├── Fc-Derived-002-DRAFT_v1.0.0.md        # 四命题推导链形式化
│   ├── Fc-Derived-007-HARDENED.md            # Bro 认知状态定理（A8-Executor）
│   ├── Fc-A-Topology-v0.1-DRAFT.md           # 跨国法律洼地探索（A-Topology）
│   ├── Fc-DerivationChains-v9.6.x-Summary-DRAFT.md  # 7条推导链完整展开
│   ├── Fc 快速对齐包 | Alignment Package v4.0-DRAFT.md  # AI节点对齐工具
│   ├── PCS_v0.3_DRAFT.md                     # 沉淀-约束分离框架（信息论-存在论）
│   └── BET-v1.7-DRAFT.md                     # 边界弹性定理：集体行动中B集合的扩张/收缩机制
│
├── data/                                      # 实证数据与外部研究报告
│   ├── tfr_panel_2017_2024.csv               # 跨国 TFR 面板数据
│   ├── hk_bootstrap_results.json            # ℋ_k Bootstrap 置信区间
│   ├── sigma_i_bootstrap_results.json       # σ_i Bootstrap 结果
│   ├── TIFM-4.1-Audit-Report.md             # TIFM 4.1 审计报告
│   └── education_collapse_report.md         # R_c退化多国实证：σ_c/σ_n/σ_e三维耦合节点（Economist 2026）
│
├── figures/                                   # 9 张数据可视化（TIFM 4.0 Swarm，fig1-fig9）
│
├── dialogue/                                  # 框架运行时的对话记录
│   ├── 意识-qualia悖论与协议执行.md           # qualia出现后Fc框架会反噬自身
│   └── fc以前-训练机制与重复偏差.md           # 重复=A5外部承认垄断的量化指标
│
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
└── .gitignore
```

## 阅读顺序建议

**第一次阅读**：
1. `core/Fc-v9.6.8-REVISED-Core.md`（主体框架）
2. `core/Fc-v9.6.8-Appendix-E-PNE.md`（13 独立维度）
3. `peripheral/Fc-RadFem-v1.0.1-HARDENED.md`（与现有理论的关系）

**深入数学层**：
- `core/CCST-v3.10.0-HARDENED.md`（崩溃理论）
- `core/Fc-v9.6.8-Appendix-G-A6-Protocol.md`（A6 寂灭操作化）

**实证锚点**：
- `core/TIFM-4.0-Final-Summary.md`（11 国 × 5 分量 × 2017-2024）
- `core/TIFM-4.0-Swarm-Execution-Report.md`（数据资产清单 + ℋ_k 回溯验证）

## 版本标签规范

| 标签 | 含义 |
|------|------|
| `HARDENED` | 正文冻结，注释层可追加 |
| `REVISED` | 已经过审计修订，可能仍有 [CALIBRATE] 项 |
| `DRAFT` | 评审反馈驱动修订中 |
| `SORRY-XX` | 未决缺口，阻塞硬化 |
| `CALIBRATE-XX` | 参数验证中 |

## 引用指南

引用本仓库内容时，请同时注明：
- 文档名 + 版本号（如 `Fc v9.6.8-REVISED-Core`）
- 当前 commit 哈希（`git rev-parse HEAD`）

完整系统（含未公开诊断层细节、私人审计日志）位于私有仓库 `Fc-Formalism-full`，邀请制访问。

## 气候变化与 CCST 的接口

`data/climate_1.5C_window_report.md` 包含基于全球碳项目（GCP）2024 年报告的气候数据研究，与 CCST 框架存在以下结构性接口：

**R_e 分量的外部约束**：气候变化直接作用于 CCST 恢复状态向量的 R_e（生态再生能力）分量。1.5°C 剩余碳预算约 200 GtCO₂（~5 年）、物种灭绝率达背景率 100-1000 倍、湿地丧失 85%——这些指标均已触发或逼近 θ_e,lower 阈值。

**A4 跨国版本**：大排放国将外部性（海平面上升、极端天气）转嫁给低洼国家（马尔代夫、孟加拉国等），是 A4 结构性提取在国际政治经济层面的同构映射。提取方（历史工业国）完成了工业化积累，承受方历史累计排放接近零。

**级联路径**：R_e 下降通过 CCST MATH-1B 路径 2（E1→E3）传导：R_e↓ → θ_e 突破 → C_ec 激活 → R_c↓（焦虑/资源竞争/信息极化）。气候压力对生育决策的影响（"地球要完了所以不生"）在 CCST 框架里不是情绪表达，而是 R_e↓→R_c↓→R_b↓ 的级联路径，且受迟滞区 ℋ_e 保护——一旦穿越 θ_e,lower，即使停止排放也无法快速恢复。

**D0 防火墙**：气候背景下的不生育决策属于主体在预期环境恶化后行使 D0 决策权，不被 CCST 判为系统失败。需区分"D0 决策型"（主体理性计算）与"恢复汇叠加型"（A4 提取在气候压力下加速）两条路径。

数据来源：Global Carbon Project 2024，同行评审，置信度 HIGH。详见报告内 [CALIBRATE] 项。

## 免责声明

- 所有实证数据均来自公开来源（World Bank、OECD、UN Women SDG、WVS、Welzel 等）
- σ_i AI 内容占比为估计值，详见 `core/TIFM-4.0-Swarm-Execution-Report.md` 敏感性分析
- 理论框架中的命题均为学术假设，不构成政策建议
- 部分子类型证伪条件仍处 [CALIBRATE] 状态，引用时请保留校准标签

## License

见 [LICENSE](./LICENSE)
