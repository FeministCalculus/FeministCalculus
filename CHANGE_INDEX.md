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
