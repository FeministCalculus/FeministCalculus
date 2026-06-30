# CHANGELOG

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
