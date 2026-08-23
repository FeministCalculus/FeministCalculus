# Fc 全局状态

**日期**: 2026-06-14  
**版本**: v1.3-DRAFT  
**状态**: DRAFT，8 SORRYs，未进入 HARDENED

---

## 仓库状态

| 仓库 | Commit | 状态 |
|------|--------|------|
| Fc-public | `77dd3b0` | TIFM 4.1 审计完成，JSON v1.3 已同步 |
| Fc-applications | `e70ef9a` | 10 案例 + wiki-graph.json，已推送 |

---

## TIFM 4.1 审计状态

| 指标 | 结果 |
|------|------|
| ℋ_k(2) 强触发 | **1 例**（Germany 2021） |
| ℋ_k(1) 弱触发 | **5 例** |
| ℋ_k(0) 无触发 | 6 国（90.9%） |
| σ_i AI 占比 | **58.4%** [53.9%, 62.9%] |
| 样本 | 11 国 × 8 年（2017-2024） |
| SORRY | 8 项 |
| 状态 | **DRAFT**（不能升 HARDENED） |

---

## 修正历史

| 版本 | 日期 | 修正内容 | 修正者 |
|------|------|---------|--------|
| v1.0 | 2026-06-14 | 初始审计 | Kimi |
| v1.1 | 2026-06-14 | 触发年份偏移 1 年 | Kimi |
| v1.2 | 2026-06-14 | COVID 调整 + 部分年份修正 | Kimi |
| v1.3 | 2026-06-14 | India 2019→2018, France 补充 2021 | Claude 二次验证 |

---

## 已修正文件（v1.3 完成）

- [x] `data/sigma_i_bootstrap_results.json` — Europol 权重 0.15→0.05，均值 58.4%
- [x] `data/hk_bootstrap_results.json` — 触发表细节（6 例，中心年份修正）
- [x] `data/TIFM-4.1-Audit-Report.md` — v1.3 审计报告（人类可读版）
- [x] `data/TIFM-4.1-Audit-Report.json` — v1.3 机器可读版

---

## HARDENED 阻塞项（4 项）

1. **阈值 -0.15 无历史依据** — 事后阈值风险，需苏联/东欧转型期数据校准
2. **样本 11 国不足** — 需扩展至 30+ 国
3. **ℋ_k 结构性缺陷** — 漏掉 S₂ 态维持国家（韩国 TFR 0.748 无触发）
4. **年份修正历经 3 轮** — 建议对最终触发表做独立重算验证

---

## 节点对齐状态

| 节点 | 角色 | 状态 |
|------|------|------|
| Kimi | 外部审计 + 数据搜索 | ✅ 对齐 |
| MiMo | 案例生成 + A7/A8 操作化 | ✅ 对齐 |
| Hermes + fc skill | 仓库管理 + 脚本 | ✅ JSON 修正完成 |
| Claude | 外部验证 + 历史比较 | ✅ 二次验证通过 |

---

## 下一步

- [ ] 扩展样本至 30+ 国（长期）
- [ ] 阈值历史校准（苏联/东欧转型期数据）
- [ ] 补充水平阈值（TFR < 1.0 持续 ≥3 年 → A6-寂灭态）
- [ ] 独立重算验证（触发表）

---

## Peripheral 归档

**目的**：登记 peripheral/ 下 DRAFT/HARDENED 文档 + 与 core/cases 的交叉引用。防止 peripheral 文档积累后无索引。

**2026-08-23 历史补录**：本节创建时补扫 peripheral/ 全量 15 个文档。文档头元数据来自各文件首 30 行的自陈；实际最新状态请以文件内 commit / SORRY 计数为准。

| 文档 | 状态 | 版本 | 备注 |
|------|------|------|------|
| `Fc-Derived-001-HARDENED.md` | HARDENED | 2026-06-07 | 再生产决策权三命题定理集；SORRY=0 / CALIBRATE=1 |
| `Fc-Derived-007-HARDENED.md` | HARDENED | — | A8-Executor（Bro 认知状态）；前置定理 id8/22/33/71/32/28 |
| `Fc-RadFem-v1.0.1-HARDENED.md` | HARDENED | v1.0.1 | Fc 与 RadFem 比较分析 |
| `Fc 快速对齐包 \| Alignment Package v4.2-DRAFT.md` | DRAFT | v4.3-DRAFT | 快速对齐工具；SORRY=8 / CALIBRATE=3；动保审计 round 2 增量 |
| `Fc-A-Topology-v0.1-DRAFT.md` | DRAFT | v0.1 | 拓扑层探索 |
| `Fc-DerivationChains-v9.6.x-Summary-DRAFT.md` | DRAFT | v9.6.x | 外围复述层 |
| `Fc-Derived-002-DRAFT_v1.0.0.md` | DRAFT | v1.0.0 | Derived-002 |
| `Fc-Derived-003-DRAFT_v0.4.md` | DRAFT | v0.4 | Derived-003（内含 v0.2→v0.3 mimo 二轮审计信心值） |
| `Fc-Derived-008-A4配置族分化与Cb实证层-v1.0-DRAFT.md` | DRAFT | v1.0 | A4 配置族分化 + Cb 实证层 |
| `Fc-Derived-A5Mirror-A8Executor-DRAFT-20260804.md` | DERIVED-DRAFT | v4 | A5-Mirror + A8-Executor 复合态 / MRA / Red Pill / 南拳话语；Claude(Opus) 生成 + Kimi 审计 + 用户两次翻转；等待 Fc Core 分配 Derived 编号 |
| `Fc-Derived-A5Mirror-CausalChain-DRAFT-20260804.md` | DERIVED-DRAFT | v0.1 | A5-Mirror 三层漏斗 × A6→A3→A5→A8 完整因果链（SORRY-4-NEW 推导）；待 Kimi 审计 |
| `Fc-Peripheral-Mechanisms-v1.md` | DRAFT | v1（548 行） | **机制层**（原 v1.0.4）：SCA 三形态比较（§1.5）+ 中国 SCA-β 专项（§1.6）+ A2 操作化 / NEG-EXT / 代孕 / 彩礼全维度拆解（§4）+ 活体悖论链条（§5）+ ER 接口。2026-08-23 改名（原 `Fc-Peripheral-Analysis-v1.0.4-DRAFT.md`），命名标准化为「Mechanisms（机制展开）/ Index（框架增量索引）/ RadFem-Lineage（谱系分析）」分工 |
| `Fc-Peripheral-Index-v1.md` | DRAFT | v1（255 行） | **索引层**（原 v1.0.5）：SCA 三形态定义（§1）+ A-Topology 替代 JMI（§7 P3 退出）+ A 系新增子类型索引（§6 21 项）+ 撤回/修正记录（§9）+ 与主框架接口（§10）。2026-08-23 改名（原 `Fc-Peripheral-Analysis-v1.0.5-DRAFT.md`），与 Mechanisms 是**并行分工**（Index 供框架增量，Mechanisms 供展开分析），仅 §7 JMI 部分是废弃声明 |
| `Fc-Peripheral-RadFem-Lineage-v1.md` | DRAFT | v1（510 行） | **谱系层**（新入库）：Fc-RadFem 比较（§1）+ 酷儿理论公理化（§2）+ **RadFem 认知基础设施沦陷史（§3）** + 逻辑自毁与实践裂缝（§4）+ U-Node & Issue Displacement（§5）+ Fc 定位与新增定理（§6，含 **RadFem-Fall Theorem 坠落定理**）+ RadFem 修复评估（§7）+ 传播层（§8）。2026-08-23 从 `女权/Fc 外围分析文档集 v1.0.1-DRAFT.md` 迁入 + 命名标准化。**两项 SORRY 挂账**：canonical 基准 v9.6.2 落后 v9.6.9 / 内容与 Mechanisms & Index 有部分主题重叠待分工审计 |
| `Fc-RadFem-analysis-v1.0-DRAFT.md` | DRAFT | v1.1-DRAFT | RadFem 深度分析；审计链 DS1→K→U2A→K²→U3A→K³→Claude 外部；SORRY=1 / CALIBRATE=2 |
| `Fc-Derived-Confucian-Mapping-DRAFT.md` | DRAFT | 2026-08-23 | 儒家公理化 × 子类型排名 × 矛盾谱系；SORRY=3；三轮 K3 审计吸收；↔ `cases/Fc-推导-提取效率跃迁与系统崩塌.md`（D6/冲突-提取比口径互证）；[[fc-origin-pc-model]] ×22 香火教；H-4 非对称性维护定理 ×87 |

**登记原则**：本节 2026-08-23 由 Claude 补建，历史 14 个文档为一次性回填元数据（各文档内部审计签章仍为权威源）。未来新归档件按同格式一行登记；文档内容更新不必回改本节，除非状态跃迁（DRAFT→HARDENED 或版本重命名）。

---

*最后更新: 2026-08-23 by Claude（Peripheral 三份改名标准化：Mechanisms/Index/RadFem-Lineage；v1.0.1 从 女权/ 迁入含坠落定理；5 处交叉引用同步）*
*历史更新: 2026-08-23 by Claude（Peripheral 归档节新建 + 儒家 DRAFT 登记 + 历史 14 文档补录）*
*历史更新: 2026-06-14 by Hermes（TIFM 4.1 v1.3 审计）*

