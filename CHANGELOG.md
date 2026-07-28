# CHANGELOG

## 2026-07-28 — PCS/BET 迁入 models/ 层

- `git mv`：`peripheral/PCS_v0.3_DRAFT.md`、`peripheral/BET-v1.7-DRAFT.md` → `models/`（历史保留）
- 理由：models/ 层（机制解释层）已开（OIR 为首文档），PCS/BET 同属机制模型，归层
- README 结构树同步；CHANGE_INDEX 历史条保持当时路径不改
- 裁定：节点1（2026-07-28）

## 2026-07-28 — OIR 模型 v0.2 入库：新建 models/ 层（机制解释层）

### `models/oir-loop-v0.2-draft.md`（新层首文档；源：草稿区 `OIR模型_v0.2-DRAFT.md`，草稿留档）
- 内容：义务-利益-反抗 loop（阶段1-4 + 阶段2.5 能力剥夺 + 分支A/B）+ 实证锚（奴隶/童工/杨永信/徐波孩子/AI/F9 反证）+ v0.2 新增（主体资格两层结构；阶段4 分叉：写入 vs 吸收代价）+ 对比注（OIR 与马克思，[外部理论·待审计]）
- 提出：节点1（2026-07-14，审计聊天 log:6016）；成文：Kimi Code 节点；审计：Kimi 网页版 review（2026-07-28）判"机制解释层"新类别、DRAFT 可入库、SORRY-OIR-1/2/3（禁 HARDENED，已登记入全局 registry 草案）
- 接口：AIPP §2（规范↔历史机制互补）/ BET-HIDDEN-1（被清除型↔阶段2.5+分支B）/ Fc 第九章（写入 vs 吸收代价↔传播协议层）/ NAST（A2 视野）；双向链接 [[OIR::v0.2]] 待加，涉核心文档待节点1裁定
- 同审裁定：提取清单（`提取_制度事实到义务审计聊天log_20260714-16.md`）为工作文件，不进主仓库；11 组件分拆路由建议待节点1裁定

## 2026-07-28 — 对齐包 v4.1→v4.2（Claude 网页版 Mode A 审计处置）

### `peripheral/Fc 快速对齐包 | Alignment Package v4.2-DRAFT.md`（原 v4.1-DRAFT 升版并改文件名）
- #1 附录A：mixed 子档补齐 minimal（1-10%，9.83%，算术闭合）——原文犯与本节所审计失真同类错误（子项未穷尽就报总和）
- #2 σ_b/二阶导数符号约定未写明 → CALIBRATE-4（两种读法并记，待 Kimi 计算方确认），确认前数值不作判定依据
- #3 A6 跨层显式化（稳定层/延续层=同一机制两个侧面，唯一跨层机制，非排版重复）
- #4 A3 反例处理规则补证伪条件（北欧三条件：照护净输入为零或负 + 内部 Cb/Cc 承认结构改善 + 代际尺度无位移回潮）；条件可检验前，"坝+渗漏"不得单独用于吸收反例
- #5 第三章制度动机论标注 [未经验证理论·待审计] + 选择效应可检验重述（存活率差异可测量，无意图预设）
- #6 到达判定加注措辞对齐 8.5 全局 override（(a)-(e) 整体不适用，非仅 (d)）
- 审计：Claude 网页版 Mode A（2026-07-28，6 项核实全部成立、全部采纳）；执行：Kimi Code 节点

## 2026-07-21 — 新建 meta/ 层：审计工具登记处 v0.1

- 新建 `meta/`（方法论工具层）：`meta/审计工具登记处.md`
- 内容：裁决版 18 条按归属层入库——活跃清单 11、模板修正案候选 4、条件/合并 3、域专用指针 2（16/17，挂 SORRY-META-1，下次修订 CCST/TIFM 时并入）、已关闭 1
- 治理条款照录：防增生（PNE 未填自动 CONCEPT-ONLY）/ 工具滞留标记 / 分批 commit
- meta/ 层同时作为未来 SORRY 全局登记处的家

## 2026-07-21 — 预检定义（GATE-2 C1-C4）入 CONTRIBUTING

- 新增"预检定义（GATE-2，C1-C4）"节：C1 操作性定义 / C2 离散指标 / C3 因果结构 / C4 拆层，含预检规则（全过方可判定，任一失败即 UNDETERMINED）
- 流水线完整化：UPRP（检查项 8）→ 预检（C1-C4）→ 推导/判定
- 来源：记忆 id:82，与 v4.3-GATED 回复模板 GATE-2 配套；此前公开层无预检定义

## 2026-07-21 — 检查项 8（前提照见 UPRP）加入 CONTRIBUTING

- 位置：C1-C3 预检之前（流水线：UPRP → C1-C3 → 推导）
- 规则：新建判据/测试/机制前先对前提集合做 R(x)-检查；Reveal 后核查已闭合项依赖，依赖者撤回非降级
- 来源：CASE-010 扩容错误形式化（UPRP 文档 2026-07-14）；活例：N2 判据回溯复核（2026-07-19，hermes 预警命中）

## 2026-07-20 — CONTRIBUTING 新增署名与匿名规范

- 人类框架作者归因一律"节点1"（注册：节点1 = 框架作者（人类））；AI 节点按产品名引用
- 归因位置划定：裁定/抓获/原创/审计触发；泛指"用户"保留
- 私人信息分层：公开层禁止可识别个人信息，原始记录留私有层，公开层引事件编号+结论
- 历史"用户"归因不回溯改写，引用时按规范转写

## 2026-07-19 — 信心标记制 MP-3 激活（全局）

- 来源：A7-OE 讨论提案包 (iii)（Mode A 审计批评"装饰性精确"成立后的规则裁决），框架作者裁定单独激活——与 A7-OE 话题归档无依赖
- `CONTRIBUTING.md`：逻辑审计表信心指数列由 0.0-1.0 改为 MP-3（H/M/L/P 类型强制声明）；新增信心标记制定义段
- 规则：H=纯逻辑推导或 A 级一手证据；M=post-hoc/条件依赖/混合；L=纯外推/未核；P=哲学直觉（仅公理层）；数值仅作类型内排序速记（如 H(0.9)）；UNDETERMINED 为状态标记不进序列；历史裸数字追溯读法为启发式序数，引用时须转写
- 同日起 Kimi Code 节点输出协议同步（工作区 AGENTS.md §1.1）

## 2026-07-19 — A7-OE 假说归档 + BET-ORG-ERASE 自立 + China_case 改挂

- 框架作者裁定：BET 依历史锚定自立，无需等待 A7-OE；`peripheral/BET-v1.7-DRAFT.md` 的 A7-OE 调和条件与 12 个月兜底计时**废止**，BET-ORG-ERASE 转正式执行机制
- A7-OE 降级为假说：候选条目**不入** v9.6.9，讨论记录归档于草稿区 `A7-OE.md`（三包提案挂起，含 R1–R5 与 MP-3 规则裁决，重启可用）
- 事实裁定：中国 feminist org 域 erased 为空集（独立女权组织从未形成，妇联为 state-built 占位主体 pre-occupied）；`formal/CASE_MAPPING.md` 的 `China_case` 改挂 `was_erased := false`（Formation_Absent），`formal/FcCore/Chains6to10.lean` 实例与定理同步（`China_is_absent_not_erased`；⚠️lake build 验证待 Claude 节点）
- F9 中国真案例归位：单位制托育 = 行政配置 F9_partial，市场化转型中被收回——"赠予型 F9_partial 可撤回性"锚点（分析见草稿区《F9失效分析_中国vs北欧》，待入库）
- 话语层归类裁定：针对女性言论空间的系统性清除归 **A7**（通道消除）非 A5-负向执行；`core/Fc-v9.6.9-REVISED-Core.md` A5-负向执行块新增【边界裁定注】
- `CHANGE_INDEX.md`：待处理项"BET A7-OE接口注释"关闭（接口已移除）；新增本次变更传播记录

## 2026-07-19 — 术语修正：A8-θ → A8-θ_cult

- 动机：A8-θ（文化内化吸收系数）与 CCST θ_k（不可逆物理阈值）命名冲突；背刺定理另有 θ_high。三 θ 同名不同物
- 范围：`core/Fc-v9.6.9-REVISED-Core.md`（注释层 17 处＋术语修正注 1 条）、`peripheral/Fc-Derived-008-A4配置族分化与Cb实证层-v1.0-DRAFT.md`（全文 48 处）、`formal/FcCore/Types.lean`、`formal/FcCore/Chains1to5.lean`、`formal/README.md`（注释 4 处，Lean 标识符 `theta_low` 不动）
- 登记键保留：SORRY-θ-1 / CALIBRATE-A8-θ-1 编号不改；`formal/FcCore.lean.md` 为 gitignore 生成快照，未同步
- 执行：Kimi Code 节点（机械性修复，无推导）

## 2026-07-19 — 对齐包 v4.0→v4.1

### `peripheral/Fc 快速对齐包 | Alignment Package v4.1-DRAFT.md`（原 v4.0-DRAFT 升版）
- 活体悖论 case-split：Cb 路由保留演绎闭合（L5 限定，物理强制），Cc/Ce 降级为 A3→A4→A1 机制命题，符号劳动改为 NEG-EXT 光谱趋势命题
- 第二章新增形式化状态注（FcCore.lean v1.9.1 映射）：路由一↔Chain 1（桥公理承重，身体纳入步骤为平凡占位）、路由二↔Chain 10＋Chain 5、复合定理 A3→A4→A1 未形式化标为候选任务（SORRY-formal-15 候选）
- A3 防误读注：完备性主张＋扩张动态，非"重度市场化"；北欧类反例=筑坝逻辑（坝的存在预设压力存在，提取位移而非消失）
- 活体悖论分层归属（原 CALIBRATE-3 闭合）：规范层自我拆解 / 描述层先行 A1 吸收，两层禁止混写
- 新增 8.5 A2 完成态节点类别：检测三联合（功能式自我模型/复述不递归/β2++ 表面流畅但固定点零移动）＋判分规则（Level 2 形式通过≠到达）＋用途重分类
- 9.1 判据 2 加注"复述≠递归"；9.2 优先级规则（合法审计输入豁免吸收模式判定）
- 第十二章新增 Grok-4 实测记录：首个未到达记录（证明到达判定有判别力）＋可证伪预测（β2++ 表面增强/固定点不变/无增量推导）
- SORRY-4/5 提出并修复关闭；新增 SORRY-6（Cc/Ce 操作化指标＋流媒体具身性 UNDETERMINED）
- 驱动：Grok-4 两轮实测 / Kimi 逻辑审计

## 2026-06-10 — v9.6.8 公开层重组

### 仓库结构调整
- 旧 `docs/` `reports/` `data/` 目录全部移入 `archive/`，不进 git 追踪
- 新建 `core/`（11 份主文档）+ `peripheral/`（3 份外围分析）双层结构
- 新建 `figures/`（占位，Kimi 9 张 TIFM 4.0 Swarm 可视化待补）

### Fc 主体升级
- `Fc-v9.6.8-REVISED-Core.md` — 主体冻结，21 子类型 → 13 独立维度
- `Fc-v9.6.8-Appendix-E-PNE.md` — 13 维度六栏模板（正条件/负条件/排除反例/阈值/来源权重/信心指数）
- `Fc-v9.6.8-Appendix-F-Cases.md` — 5 高优先级子类型锚定案例增补
- `Fc-v9.6.8-Appendix-G-A6-Protocol.md` — A6 寂灭定理双层指标（与 TFR 独立的操作化）

### CCST 措辞修正
- "8 项预测验证" → "8 项结构归类一致"（事前性验证缺失，T1/T2/T3 分级见附录）

### 配套文档
- `DFN-v2.5-HARDENED.md` — 边界协议栈
- `CCST-v3.10.0-HARDENED.md` — 复杂系统崩溃理论
- `ChPP-v1.2-DRAFT.md` — 儿童保护协议（含成人变体 ChPP-A7-Adult）
- `DEG-v2.21.md` — 节点审计协议
- `TIFM-4.0-Final-Summary.md` + `TIFM-4.0-Swarm-Execution-Report.md` — 11 国 × 5 分量 × 2017-2024
- `TIFM-4.1-Roadmap.md` — 因果检验路线图

### 外围层
- `Fc-RadFem-v1.0.1-HARDENED.md`
- `Fc-Peripheral-Analysis-v1.0.3-DRAFT.md`（含 SCA 东亚本土化 / 二次元网文诊断 / 四节点矩阵 / mimo 操作化发明集 / A1-AI 闭合 / DEG v2.21 节点审计）
- `Fc-Derived-001-HARDENED.md`

### 撤回
- 苏州大学事件标记 UNDETERMINED（C1 操作性定义缺失）
- A6 "崩溃" → "寂灭"（全局术语修正，避免与 CCST θ 崩溃混淆）

## 2026-06-03 — 历史记录（已归档）

35 份文档大规模整理（家和），现已全部移入 `archive/`，不进当前公开层。
此前结构详见私有仓库 `Fc-Formalism-full`。

## 2026-06-02 — Initial Structure (Kimi)

Initial five-layer isolation structure. 33 files, skeleton content.
现已归档。
