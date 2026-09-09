# CHANGE_INDEX.md
## 变更传播索引 / Change Propagation Index

每次修改时，先在此文件登记传播清单，再按清单改文件。

---

## 格式

```
### [日期] 修改项
├── 文件1：具体变更
├── 文件2：具体变更
└── 状态：✓完成 / ⚠️待处理
```

---

## 历史变更记录

### [2026-09-08] FcCore 七条公理不一致修复（外部审计触发，修复分支）
- 触发：GPT-6/Codex 外部审计（锚定 main@8794926）提交六个 `theorem : False` 见证（W1-W6）；
  修复复核（Kimi）确认全部六个 + 新发现第七个同型病灶（W7，A5_marginal_utility_bridge）
- 修复原则：约束进类型不变量 / 定理显式前提（CommodificationStatus 模式）；元层强主张退回文本层；
  禁止"删反例/弱化结论"捷径；每条修复在 ConsistencyTests.lean 配可满足性见证
- 分支：fix/20260908-axiom-consistency
├── `formal/FcCore/Types.lean`：CareBurden 加 hours_model 不变量（SORRY-FORMAL-26）；
│   A5_RecognitionDemand 移除 marginal_utility 自由字段（SORRY-FORMAL-27）✓
├── `formal/FcCore/Chains1to5.lean`：body_production_suspends_agency_axiom **删除**→
│   BodyInProduction 状态不变量；活体悖论链（Cb/CcCe/统一推论/Cb_path）改述为
│   不相容定理（完整主体不能处于生产中状态）（SORRY-FORMAL-23）✓
├── `formal/FcCore/Chains6to10.lean`：PhysicalCost 加 nontransferable 不变量（25）；
│   layer_insulation_E2_to_E1 **删除**→E2_premise_inert，强主张退回 CCST 文本层（24）；
│   care_hours_model 公理→定理（26）；A5 bridge 公理→派生函数+rfl 定理（27）✓
├── `formal/FcCore/Chain18_NullFeedback.lean`：NF_cost_conservation 公理→定义+
│   反向定理显式前提 h_cons（21 保持开放：前提正当性）；
│   NF_cost_incommensurability 公理→FunctionallySubstitutes 定义+定理
│   （22 保持开放：定义选择的文本层论证）✓
├── `formal/FcCore/ConsistencyTests.lean`：**新增**——七个修复环境的可满足性见证 ✓
├── `formal/FcCore.lean`：import ConsistencyTests ✓
├── `peripheral/Fc-Derived-009-A8结构必要性-v1.0.0-DRAFT.md`：新增（另 commit）✓
│   （同日双审修订为 v1.1.0，见下条；v1.0.0 文件已删除）
├── `core/Fc-v9.6.9-REVISED-Core.md`：附录H 原"边界外方向2"移入射程内，
│   F3 代理执行模式（ChPP-A1 裁定落地，另 commit）✓
└── 状态：⚠️待处理——lake build + #print axioms + 审计方六见证重编译（应失败）
    由 GPT-6 节点执行；修复环境无 Lean 工具链，修复方已做静态核对
    （无残留引用 / 无新公理 / 影响面限于四个形式化文件）

### [2026-09-08] Fc-Derived-009 入仓前双审修订（v1.0.0→v1.1.0）
- 触发：Claude＋MiMo 双审（审计档案 NOT-IN-REPO：20260908_derived009-A8-necessity-preadmit），总判定 NEEDS REVISION（非驳回）
- 采纳：共识 6 项全部（M-1 承重前提前件显式化＋信心≤0.55 / M-2 觉醒签名→觉醒假说降级＋觉醒退出vs计算退出区分 / S-1 解空间补 (d)(e) 历史补充解＋"同一身体同时"收窄 / S-2 痛苦证伪=时空分布不同步＋镇痛反证 / S-3 措辞中性化×3 / S-4 概念附录 Core 映射）＋建议项 A-1（P1 时间戳）
├── `peripheral/Fc-Derived-009-A8结构必要性-v1.0.0-DRAFT.md`：**删除**（被 v1.1.0 取代）
├── `peripheral/Fc-Derived-009-A8结构必要性-v1.1.0-DRAFT.md`：新增（修订回写，含修订记录）✓
└── 状态：✓完成——文本层修订；SORRY×3＋CALIBRATE×1 保持开放（内容见文档 §10）

### [2026-07-19] A7-OE 假说归档 + BET-ORG-ERASE 自立 + China_case 改挂
- 框架作者裁定：BET 依历史锚定自立，废除 A7-OE 调和条件与 12 个月兜底计时；A7-OE 降级为假说归档（草稿区 A7-OE.md），不入 v9.6.9
- 事实裁定：中国 feminist org 域 erased 为空集（无独立女权组织曾形成），妇联为 state-built 占位主体（pre-occupied）；话语层系统性清除（炸群/炸号）归 A7 非 A5-负向执行
├── `peripheral/BET-v1.7-DRAFT.md`：调和条件+兜底废止，BET-ORG-ERASE 转正式，状态行与 §6.1 接口表同步 ✓
├── `formal/CASE_MAPPING.md`：China_case `was_erased := true→false`（Formation_Erased→Absent），新增改挂记录+F9 单位托育真案例说明+话语层 A7 裁定 ✓
├── `formal/FcCore/Chains6to10.lean`：China_case 改值，定理更名 China_is_absent_not_erased ✓（⚠️lake build 验证待 Claude 节点）
├── `core/Fc-v9.6.9-REVISED-Core.md`：A5-负向执行块新增【边界裁定注】（承认层过滤 vs 通道消除判据）✓
├── 草稿区 `A7-OE.md`：状态头登记归档 ✓
└── 状态：✓完成

### [2026-07-01] σ_k漂移修正
- 原σ_c=照护缺口/σ_e=心理健康增速/σ_n=规范矛盾是Fc特化指标，错误嵌入CCST通用σ_k
- 修正：σ_e="e"是ecological，σ_c=[CALIBRATE-σ_c]待建，σ_n=社会信任指数下降率
├── `core/CCST-v3.10.0-HARDENED.md`：MATH-1A新增σ_k五分量正式定义，SORRY-CCST-2加修正注记 ✓
├── `core/TIFM-4.0-DRAFT-REVISED-2-MERGED-FINAL.md`：σ_k定义更新，新增Fc专项分析层 ✓
└── 状态：✓完成

---

### [2026-07-01] A7-Capture警察节点修正 + A7-Police-Failure新增
- 警察节点机制不是A7-Capture（威胁→回避），而是主动偏袒（A5吸收+A2降级+A1降级）
- 新增A7-Police-Failure子类型，崔娃母亲案作为锚定案例
├── `core/Fc-v9.6.8-REVISED-Core.md`：A7-Capture限缩为司法节点，新增A7-Police-Failure，SORRY汇总更新 ✓
├── `cases/Fc-v9.6.8-Appendix-F-Cases.md`：SORRY-A7C-警察关闭，新增F.6.1 A7-Police-Failure和崔娃案 ✓
└── 状态：✓完成 | ⚠️BET v1.x §6.1的A7-OE接口注释需同步（A7-OE不适用于警察节点）

---

### [2026-07-01] 定理1/2/3进入文档
- 定理1（主语置换）→ NAST ND11-Linguistic
- 定理2（反馈缺失边界定理）→ Fc附录H边界外方向3
- 定理3（AI自我报告不可靠）→ Fc §9传播协议层
├── `core/Fc-v9.6.8-REVISED-Core.md`：附录H新增边界外方向3，§9新增定理3形式化 ✓
├── NAST `NAST_v1.8_DRAFT.md`：ND11-Linguistic子类型新增 ✓
└── 状态：✓完成

---

### [2026-07-01] NAST ND11-Linguistic + A1物化操作精确化
├── NAST `NAST_v1.8_DRAFT.md`：ND11-Linguistic，N1辩护路径A1物化操作精确化 ✓
└── 状态：✓完成

---

### [2026-07-01] NAST CASE-008大气系统/气候职位违约
├── NAST `NAST_APPENDIX_CASE_008.md`：新增 ✓
└── 状态：✓完成

---

### [2026-07-01] SSD/AE/TDS合并进Fc v9.6.8（从v9.6.4）
├── `core/Fc-v9.6.8-REVISED-Core.md`：SSD/AE定理、TDS三公理、废止堆栈、失效路径 ✓
└── 状态：✓完成

---

## 待处理传播项

### ✓ BET A7-OE接口注释（2026-07-19 关闭）
- 原触发：A7-Police-Failure新增后，BET §6.1的A7-OE接口说明需要标注"不适用于警察节点"
- 关闭理由：2026-07-19 调和条件废止，BET 的 A7-OE 接口整体移除（BET-ORG-ERASE 自立），待标注对象不再存在

---

## 已知跨文件依赖关系

| 概念 | 主文件 | 引用文件 | 依赖说明 |
|---|---|---|---|
| σ_k五分量 | CCST | TIFM | TIFM的σ_k定义必须与CCST同步 |
| A7子类型 | Fc主文档 | Appendix-F, BET | 案例库和跨框架接口随主文档更新 |
| ND11 | NAST | Fc接口表 | NAST是原生定义，Fc是外部引用 |
| F9废止堆栈 | Fc主文档 | BET案例F, NAST N5 | BET和NAST引用Fc的F9定义 |
| E_edu子维度 | CCST注释层 | TIFM | TIFM-EDU-001的映射依赖CCST定义 |
| 反馈缺失边界定理 | Fc附录H | NAST CASE-008 | NAST案例008引用Fc定理 |
