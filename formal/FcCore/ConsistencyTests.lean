import FcCore.Chains1to5
import FcCore.Chains6to10
import FcCore.Chain18_NullFeedback

/-!
# ConsistencyTests — 2026-09-08 修复的可满足性见证

外部审计（GPT-6/Codex，2026-09-08，锚定 commit 8794926）提交了六个
`theorem … : False` 见证，证明六条公理与其类型的自由可构造性不一致：
  W1 audit_body_false            — body_production_suspends_agency_axiom
  W2 audit_layer_false           — layer_insulation_E2_to_E1
  W3 audit_cost_false            — reproductive_cost_nontransferable（原公理形式）
  W4 audit_care_false            — care_hours_model（原公理形式）
  W5 audit_conservation_false    — NF_cost_conservation（原公理形式）
  W6 audit_incommensurability_false — NF_cost_incommensurability（原公理形式）
修复复核（Kimi）确认第七个同型病灶：
  W7 A5_marginal_utility_bridge  — 对自由字段 marginal_utility 全称断言等式，
     d := ⟨5, 0⟩ 被迫 0 = 1（审计的六个见证未覆盖）。

修复原则（沿用 CommodificationStatus / SORRY-formal-18 既有模式）：
把合法状态约束进类型不变量或定理前提，而不是对自由可构造值断言性质；
W2 的强主张（E2 不贡献 E1 推导）是元层陈述，退回文本层（CCST 层架构），
Lean 层只保留其可形式化的剩余物（E2_premise_inert）。

本文件为每个修复后的环境构造**可满足模型**（合法居民），证明修复后的
类型/前提系统不为空。验收判据（审计方执行）：
  1. 本文件编译通过（模型存在）；
  2. 审计方原 Contradictions.lean 的六个见证在本分支上**编译失败**
     （非法状态已不可构造 / 被删公理已不存在）；
  3. `#print axioms` 对下列定理不报告任何 Fc 自声明公理：
     living_body_paradox_Cb, living_body_paradox,
     reproductive_cost_nontransferable, care_hours_model,
     A5_nondiminishing, NF_cost_incommensurability,
     null_feedback_boundary_reverse
     （仅允许 propext / Classical.choice / Quot.sound 等战术引入项）。
-/

namespace Fc

-- ── W1 模型（Chains1to5）：完整自主的 Agency 可自由构造——
--    旧公理错误地排除了它；BodyInProduction 状态要求自主已悬置。

/-- 完整主体：三个维度均自主。 -/
def witness_agency_intact : Agency := ⟨true, true, true⟩

/-- 生产中状态：身体自主已悬置（不变量由构造者承担）。 -/
def witness_body_in_production : BodyInProduction := ⟨⟨false, true, true⟩, rfl⟩

/-- 悖论双向内容之一：完整主体不能处于生产中状态。 -/
example : ¬ ∃ s : BodyInProduction, s.agency = witness_agency_intact :=
  living_body_paradox_Cb witness_agency_intact trivial trivial trivial ⟨rfl, rfl, rfl⟩

/-- 悖论双向内容之二：处于生产中状态的主体必已 A1 降级。 -/
example : A1_Demoted witness_body_in_production.agency :=
  living_body_paradox witness_body_in_production trivial trivial

-- ── W3 模型（Chains6to10 Chain 7）：两种合法成本状态都可构造——
--    旧公理对"不由主体承担"的值也全称断言，排除了合法状态。

/-- 承载主体且不可转移的物理成本。 -/
def witness_physical_cost_borne : PhysicalCost :=
  { borne_by_subject := true, transferable := false, nontransferable := fun _ => rfl }

/-- 不由主体承担、可转移的物理成本（旧公理下被错误排除的合法状态）。 -/
def witness_physical_cost_unborne : PhysicalCost :=
  { borne_by_subject := false, transferable := true,
    nontransferable := fun h => Bool.noConfusion h }

/-- 不可转移性现为定理（从类型不变量推出）。 -/
example : witness_physical_cost_borne.transferable = false :=
  reproductive_cost_nontransferable witness_physical_cost_borne rfl

-- ── W2 演示（Chains6to10 Chain 7）：E1 结论的证明不引用任何 E2 前提。

example : witness_physical_cost_borne.transferable = false :=
  E2_premise_inert witness_physical_cost_borne rfl

-- ── W4 模型（Types + Chains6to10 Chain 10）：
--    满足工时-收入关系的照护负担可构造（1000/(40/40+1) = 500）。

def witness_care_burden : CareBurden :=
  { hours := 500, income := 40, hours_model := by decide }

example : witness_care_burden.hours = care_hours_from_income witness_care_burden.income :=
  care_hours_model witness_care_burden

-- ── W7 模型（Chains6to10 Chain 8）：marginal_utility 现为派生函数。

def witness_recognition_demand : A5_RecognitionDemand := ⟨5⟩

/-- 派生结果与位置商品模型一致：参考点滞后 1，边际效用恒为 1。 -/
example : witness_recognition_demand.marginal_utility = 1 := by decide

-- ── W5 模型（Chain18）：一个真实满足守恒方程的成本分配。
--    3（制度）+ 2（施害者）+ 1（V 具身）+ 4（V' 具身）+ 1（耗散）= 11

def witness_conservation :
    NF_cost_conservation
      { active := true, perpetrator_constrained := 2 }
      { can_adjust := true, institutional_cost_absorbed := 3 }
      { alive := true, can_feedback := true, embodied_cost := 1 }
      { exposed_to_risk := true, embodied_cost_borne := 4 }
      11 1 := rfl

-- ── W6 双向（Chain18）：异类型不可替代；同类型（按定义）可替代。

example : ¬ FunctionallySubstitutes ⟨5, CostType.Institutional⟩ ⟨5, CostType.Embodied⟩ :=
  fun h => CostType.noConfusion h

example : FunctionallySubstitutes ⟨5, CostType.Institutional⟩ ⟨9, CostType.Institutional⟩ :=
  rfl

end Fc
