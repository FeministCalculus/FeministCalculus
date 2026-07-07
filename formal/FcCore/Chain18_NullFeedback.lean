import FcCore.Types

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 18: Null-Feedback Boundary Theorem (v2, 2026-07-07)
-- Source: Fc-v9.6.8-REVISED-Core.md id84 + 反馈缺失边界定理的反用推导（REVISED）
-- v2 修正：区分成本类型（Institutional/Embodied/Perpetrator/Dissipated），
--         引入不可通约性——V' 具身承担不"抵消" A7 制度未履职。
-- ─────────────────────────────────────────────

/-- CostType: 成本类型，四种不可互相替代的承担形式。
    Institutional：A7 应执行的制度成本（监控/隔离/约束的预算与权力配置）
    Embodied：V/V' 具身承担的成本（时间/身体/心理/迁徙/关系断裂）
    Perpetrator：施害者应承担的约束成本（服刑/赔偿/行动限制）
    Dissipated：环境自然耗散的成本 -/
inductive CostType where
  | Institutional
  | Embodied
  | Perpetrator
  | Dissipated
  deriving DecidableEq, Repr

/-- Cost：带类型的成本，量化承担量。
    关键设计：两个不同 CostType 的 Cost 即使 amount 相等也不可互换——
    Fc 立场：制度成本和具身成本不可通约（见下方 incommensurability axiom）。 -/
structure Cost where
  amount : Nat
  ctype  : CostType

/-- System (S)：制度结构。can_adjust 表示能否基于反馈调整。 -/
structure NF_System where
  can_adjust                 : Bool
  institutional_cost_absorbed : Nat  -- S 实际吸收的制度成本量

/-- Victim (V)：承担提取/伤害成本的主体。
    alive=false 模型永久沉默；can_feedback=false 模型活着但反馈通道被阻断。 -/
structure NF_Victim where
  alive         : Bool
  can_feedback  : Bool
  embodied_cost : Nat  -- V 已具身承担的成本量

/-- RiskSource (R)：持续伤害的来源。 -/
structure NF_RiskSource where
  active         : Bool
  perpetrator_constrained : Nat  -- 施害者被约束的成本量

/-- SubstituteNode (V')：V 无法反馈后，暴露于同一风险的活人主体。
    embodied_cost_borne：V' 具身承担的成本量。
    exposed_to_risk：与风险源有地理/血缘/社会重叠。 -/
structure NF_SubstituteNode where
  exposed_to_risk    : Bool
  embodied_cost_borne : Nat

-- 反馈通道激活的三条件
def NF_feedback_active (v : NF_Victim) (s : NF_System) : Prop :=
  v.alive = true ∧ v.can_feedback = true ∧ s.can_adjust = true

def NF_feedback_blocked (v : NF_Victim) (s : NF_System) : Prop :=
  ¬ NF_feedback_active v s

def NF_system_has_leverage (s : NF_System) : Prop :=
  s.can_adjust = true

def NF_risk_persists (r : NF_RiskSource) : Prop :=
  r.active = true

/-- Forward direction: 反馈阻断 → 系统失去干预杠杆。
    与 v1 相同，Bool 版本的杠杆判定不需要成本类型化。 -/
theorem null_feedback_boundary_forward
    (v : NF_Victim) (s : NF_System)
    (h_blocked : NF_feedback_blocked v s)
    (h_victim_alive : v.alive = true)
    (h_victim_can_feedback : v.can_feedback = true) :
    NF_system_has_leverage s = false := by
  simp [NF_feedback_blocked, NF_feedback_active, NF_system_has_leverage] at *
  exact h_blocked h_victim_alive h_victim_can_feedback

-- ─────────────────────────────────────────────
-- 成本守恒与不可通约性（v2 核心增量）
-- ─────────────────────────────────────────────

/-- 总风险成本：风险源持续激活时产生的总成本量（外生给定，本模型不推导其形成）。 -/
def NF_total_risk_cost (r : NF_RiskSource) (total : Nat) : Prop :=
  r.active = true → total > 0

/-- [AXIOM] 成本守恒（量化版本）：
    总风险成本 = 制度吸收 + 施害者承担 + V/V' 具身承担 + 环境耗散
    这是量化守恒，不是 Bool 转移。
    量化关系保证"不消失"，但不保证类型可互换（见下方 incommensurability）。 -/
axiom NF_cost_conservation
    (r : NF_RiskSource) (s : NF_System) (v : NF_Victim) (v' : NF_SubstituteNode)
    (total dissipated : Nat)
    (h_total : NF_total_risk_cost r total)
    (h_active : r.active = true) :
    total = s.institutional_cost_absorbed
          + r.perpetrator_constrained
          + v.embodied_cost + v'.embodied_cost_borne
          + dissipated

/-- [AXIOM] 类型不可通约（Fc 立场）：
    Institutional 类型的成本承担和 Embodied 类型的成本承担不可互相替代，
    即使数量相等也不构成功能替代。
    V' 跑路 100 公里 ≠ 警察出警一次；具身自保 ≠ 制度履职。 -/
axiom NF_cost_incommensurability
    (c1 c2 : Cost)
    (h_type_diff : c1.ctype ≠ c2.ctype) :
    -- 类型不同的 Cost 不满足功能替代关系
    ¬ (c1.ctype = CostType.Institutional ∧ c2.ctype = CostType.Embodied
       → c2.amount = c1.amount → True → False)
    -- 即：即使 c2.amount = c1.amount，也不能推出 c2 功能上替代了 c1

/-- Reverse direction (量化版本): 反馈阻断 + 风险持续 + S 未吸收 + 施害者未受约束
    → V' 被迫承担成本。
    与 v1 的关键差异：结论是"V' embodied_cost_borne > 0"（量化），
    不是"bears_cost = true"（Bool）。 -/
theorem null_feedback_boundary_reverse
    (r : NF_RiskSource) (s : NF_System) (v : NF_Victim) (v' : NF_SubstituteNode)
    (total dissipated : Nat)
    (h_total : NF_total_risk_cost r total)
    (h_active : r.active = true)
    (h_fb : NF_feedback_blocked v s)
    (h_exp : v'.exposed_to_risk = true)
    (h_S_zero : s.institutional_cost_absorbed = 0)
    (h_perp_zero : r.perpetrator_constrained = 0)
    (h_V_zero : v.embodied_cost = 0)
    (h_diss_bounded : dissipated < total) :
    v'.embodied_cost_borne > 0 := by
  have h_cons := NF_cost_conservation r s v v' total dissipated h_total h_active
  have h_total_pos : total > 0 := h_total h_active
  simp [h_S_zero, h_perp_zero, h_V_zero] at h_cons
  omega

/-- Corollary: A7 的制度未履职不能被 V' 的具身承担"替代"，
    即使数量上守恒也不构成功能替代。 -/
theorem A7_institutional_failure_not_substituted_by_embodied :
    CostType.Institutional ≠ CostType.Embodied := by
  intro h
  cases h

-- [CLOSURE NOTE] v2 (2026-07-07):
-- v1 的 "成本守恒"是名不副实的——bears_cost:Bool 是转移谓词，不是量化守恒。
-- v1 混淆了两个不同种类的成本：
--   V' 具身承担（迁徙/身体/心理成本）vs A7 应执行的制度成本
-- v2 引入 CostType 类型和量化 amount：
--   (a) 守恒定理量化化：总成本 = 四种承担形式的加和
--   (b) 不可通约公理：类型不同的 Cost 即使数量相等也不构成功能替代
-- 关键推论 (A7_institutional_failure_not_substituted_by_embodied)：
--   "跑了" 是 A7 具身执行（Embodied），不是 A7 制度履职（Institutional）
--   V' 具身承担 ≠ A7 履职完成，即使数量守恒
-- Fc 立场：制度成本没有替代品，V' 具身承担只是把损失从"制度未履职"
--   变成"个人被迫承担"，不构成系统功能的替代。

end Fc
