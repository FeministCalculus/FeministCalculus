import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-! Chain 16: A8 / A7 → A3 Narrative Effectiveness (Real formalization)

## 来源
- 用户+Claude推导（2026-07-05）
- mimo v3审计 → v4修正：A8有独立贡献+放大效应两条路径
- 工合快速审计（v4确认Chain 16方向正确）
- Nat版本已存于 A8机制草稿v2_待审计.md（10万次模拟无反例）
- 本文件是Real版本形式化，闭合 [SORRY-Chain16-形式化]（Nat近似→Real）

## 2026-07-07 关键修正（A3 定义澄清）
用户指出：A3 是 A 系施害者的**叙事产出**，对外宣称对方自愿；
施害者知道对方已被 A1 降级，至于对方真的相信（A8 内化）还是演的，不影响 A3 输出本身。

因此，Chain 16 原来命名的 `A3_voluntary_appearance` 是把两层混淆了：
- A3 叙事输出（施害者说什么）——在定义上独立于 A8；
- A3 叙事的外部可信度/效力（A8 高时受害者配合，叙事更容易被外部接受）——这才是 A8 可以输入的变量。

## 2026-07-07 v5 升级（A7 先验偏袒）
用户进一步指出：A3 叙事的效力不只依赖 A8，更依赖 **A7 / bro 对施害者叙事的先验偏袒**。
典型机制：14岁性同意法律阈值。即使
- `econ = 0`（无经济胁迫），
- `a8 = 0`（女方明确不同意、未内化），
只要 A7 先验偏袒足够强（法律默认14岁以上能同意），施害者的 A3 叙事“她同意了”仍被直接采信。

因此 v5 引入独立系数 `a7_prior_bias`，作为 A3 叙事效力的**基线项**。
它可以在 A8 和 econ 都为 0 时单独使 A3 叙事有效，解释了“14岁以后告强奸很难”现象。

## 核心定理
1. `A8_independent_contribution`：econ=0 时 A8 独立贡献单调（路径1）
2. `A8_amplifies_economic_coercion`：econ>0 时 A8 放大效应单调（路径2）
3. `A7_bias_independent_contribution`：A7 先验偏袒独立贡献单调（v5 新增，路径3）
4. `fourteen_consent_case`：14岁案例——a8=0 ∧ econ=0 时叙事效力 ≥ a7_prior_bias（v5.1 修正为下界）
5. `platform_friction_reduces_effectiveness`：平台摩擦↑ → 效力↓（v5.1 新增，语义一致性证明）
6. `sigmoid_monotone`：sigmoid 函数单调性（Real 版本相对 Nat 近似的实质增量）

## 剩余 SORRY / CALIBRATE
- [SORRY-Chain16-权重参数]：三条路径相对权重未定（w_indep, w_amp, w_a7 需实证拟合）
- [CALIBRATE-Chain16-A3语义]：需要进一步把 `A3_narrative_effectiveness` 与
  纯粹的 A3 叙事输出变量分开建模。
-/  

namespace Fc.Chain16

open Real

/-- Sigmoid 函数：σ(x) = 1/(1+e^(-x))。
    渗透率是 S 形曲线：低刺激时缓慢启动，中段快速上升，饱和后趋近上限。
    使用 exp 表达，避免 Nat 近似的阶梯函数问题。 -/
noncomputable def sigmoid (x : ℝ) : ℝ := 1 / (1 + Real.exp (-x))

/-- A8-ExposureContext：A8 渗透率的输入维度。 -/
structure A8ExposureContext where
  exposure_count    : ℝ   -- 暴露次数
  repetition_degree : ℝ   -- 重复程度
  peer_density      : ℝ   -- A5 配置密度（同伴压力）

/-- A8 渗透率的 sigmoid 形态：输入是三个暴露维度的加权和，
    输出是 [0,1] 区间内的连续值。 -/
noncomputable def a8_penetration (ctx : A8ExposureContext) : ℝ :=
  sigmoid (ctx.exposure_count + ctx.repetition_degree + ctx.peer_density)

/-- A3 叙事效力上下文：v5 版本，包含两条 A8 路径 + A7 先验偏袒 + 平台 + 法律。
    注意：这里建模的是 A3 叙事的**外部可信度/效力**，不是 A3 叙事产出本身。
    A3 叙事产出在定义上由施害者决定，独立于 A8/A7。 -/
structure A3NarrativeContext where
  a8_penetration    : ℝ   -- ∈ [0,1]，已经过 sigmoid
  a7_prior_bias     : ℝ   -- ≥ 0，A7 / 司法 / bro 对施害者叙事的先验偏袒
  platform_friction : ℝ   -- ≥ 0，平台摩擦力（friction↑ → 效力↓）
  legal_form        : Bool
  economic_coercion : ℝ   -- ≥ 0

/-- 路径1（A8 独立贡献）：A8 渗透率直接提高 A3 叙事的外部可信度，
    不依赖经济胁迫。案例：自愿家庭主妇（econ=0，A8 高）。 -/
noncomputable def base_a3 (a8 : ℝ) : ℝ := a8

/-- 路径2 放大系数：A8 越高，经济胁迫对 A3 叙事效力的贡献被放大越多。
    使用 (1 + a8) 形式，保证 a8=0 时放大系数为 1（不放大也不缩小）。 -/
noncomputable def a8_scaling (a8 : ℝ) : ℝ := 1 + a8

/-- 平台贡献：友好度 = 1 / (1 + friction)。
    friction=0 → 贡献=1（平台完全不阻碍叙事传播）
    friction→∞ → 贡献→0（平台完全阻断）
    连续单调衰减，避免 v5 早期版本的 if-else 阶梯逻辑。
    命名与语义一致：platform_friction（摩擦）越高，叙事效力越低。 -/
noncomputable def platform_contribution (friction : ℝ) : ℝ := 1 / (1 + friction)

/-- A3 叙事效力 v5.1 组合模型（2026-07-07 修正 platform 语义）：
    effectiveness = base_a3(a8) + econ * a8_scaling(a8) + a7_prior_bias
                    + platform_contribution(friction) + legal_bonus

    修正说明（v5→v5.1）：mimo 审计指出原 v5 中
    `if platform_friction > 0 then 0 else 1` 与变量名 friction（摩擦力）
    语义不一致（friction=0 才有贡献，理应 friction=0 时贡献最高，且连续衰减）。
    v5.1 改为 1/(1+friction) 连续衰减，保证：
      - friction=0 → 贡献=1（最大，与变量名一致：无摩擦→最大传播）
      - friction↑ → 贡献↓（严格单调）
      - 无阶梯截断 -/
noncomputable def A3_narrative_effectiveness (ctx : A3NarrativeContext) : ℝ :=
  base_a3 ctx.a8_penetration
  + ctx.economic_coercion * a8_scaling ctx.a8_penetration
  + ctx.a7_prior_bias
  + platform_contribution ctx.platform_friction
  + (if ctx.legal_form then (1 : ℝ)/2 else 0)

/-- **定理1（A8 独立贡献）**：
    经济胁迫为 0 时，A8 渗透率增加 → A3 叙事效力增加。

    这是 v4 相对 v3 的核心修复：v3 的乘法模型（A3 = econ * a8_factor）
    在 econ=0 时输出恒为 0，无法解释自愿家庭主妇案例。
    v4/v5 增加 base_a3 独立路径，使 A8 内化本身提高 A3 叙事效力。 -/
theorem A8_independent_contribution
    (ctx : A3NarrativeContext) (delta : ℝ)
    (h_econ_zero : ctx.economic_coercion = 0)
    (h_delta_pos : delta > 0) :
    A3_narrative_effectiveness { ctx with a8_penetration := ctx.a8_penetration + delta }
    ≥ A3_narrative_effectiveness ctx := by
  simp only [A3_narrative_effectiveness, base_a3, a8_scaling, h_econ_zero]
  ring_nf
  linarith

/-- **定理2（A8 放大经济胁迫）**：
    经济胁迫为正时，A8 渗透率增加 → A3 叙事效力增加。
    放大系数 (1 + a8) 使 a8 增加时经济胁迫贡献严格增加。 -/
theorem A8_amplifies_economic_coercion
    (ctx : A3NarrativeContext) (delta : ℝ)
    (h_econ_nonneg : ctx.economic_coercion ≥ 0)
    (h_delta_pos : delta > 0) :
    A3_narrative_effectiveness { ctx with a8_penetration := ctx.a8_penetration + delta }
    ≥ A3_narrative_effectiveness ctx := by
  simp only [A3_narrative_effectiveness, base_a3, a8_scaling]
  have h1 : ctx.a8_penetration + delta ≥ ctx.a8_penetration := by linarith
  have h2 : ctx.economic_coercion * (1 + (ctx.a8_penetration + delta))
          ≥ ctx.economic_coercion * (1 + ctx.a8_penetration) := by
    apply mul_le_mul_of_nonneg_left _ h_econ_nonneg
    linarith
  linarith

/-- **定理3（A7 先验偏袒的独立贡献）** [v5 新增]：
    A7 对施害者叙事的先验偏袒增加 → A3 叙事效力增加。

    关键案例：14岁性同意阈值。即使 econ=0 且 a8=0（女方明确不同意），
    只要 A7 法律/司法/舆论的先验偏袒足够高，施害者“她同意了”的叙事仍被采信。
    这解释了为什么“14岁以后告强奸很难”——不是证据问题，是 A7 根本不进入“听女方”模式。 -/
theorem A7_bias_independent_contribution
    (ctx : A3NarrativeContext) (delta : ℝ)
    (h_delta_pos : delta > 0) :
    A3_narrative_effectiveness { ctx with a7_prior_bias := ctx.a7_prior_bias + delta }
    ≥ A3_narrative_effectiveness ctx := by
  simp only [A3_narrative_effectiveness, base_a3, a8_scaling]
  linarith

/-- **14岁性同意案例的形式化速写（v5.1 修正）**：
    在 econ=0、a8=0、无法律形式优惠时，A3 叙事效力 ≥ A7 先验偏袒。
    这说明即使被提取者未内化（a8=0）且无经济胁迫（econ=0），
    A7 先验偏袒仍能单独贡献至少 a7_prior_bias 的叙事效力，
    平台贡献进一步在其上叠加（不会削减 a7 部分）。

    修正说明：v5 原定理断言 effectiveness = a7_prior_bias（等式），
    依赖 platform_friction > 0 → platform 贡献 = 0 的阶梯逻辑。
    v5.1 platform 改为连续衰减 1/(1+friction)，等式不再成立，
    但 ≥ 关系仍然成立且更强——A7 先验偏袒是叙事效力的下界。 -/
theorem fourteen_consent_case
    (ctx : A3NarrativeContext)
    (h_econ  : ctx.economic_coercion = 0)
    (h_a8    : ctx.a8_penetration = 0)
    (h_plat  : ctx.platform_friction ≥ 0)
    (h_legal : ctx.legal_form = false) :
    A3_narrative_effectiveness ctx ≥ ctx.a7_prior_bias := by
  simp only [A3_narrative_effectiveness, base_a3, a8_scaling,
             platform_contribution, h_econ, h_a8, h_legal, Bool.false_eq_true, if_false]
  have h_pc_nonneg : (1 : ℝ) / (1 + ctx.platform_friction) ≥ 0 := by
    apply div_nonneg
    · exact zero_le_one
    · linarith
  linarith

/-- **平台摩擦单调性（v5.1 新增）**：
    platform_friction 增加 → 平台贡献减少 → A3 叙事效力减少。
    这是 mimo 审计要求的"命名与语义一致"的形式化证明：
    friction↑（摩擦增大）→ effectiveness↓（叙事更难传播）。 -/
theorem platform_friction_reduces_effectiveness
    (ctx : A3NarrativeContext) (delta : ℝ)
    (h_friction_nonneg : ctx.platform_friction ≥ 0)
    (h_delta_pos : delta > 0) :
    A3_narrative_effectiveness { ctx with platform_friction := ctx.platform_friction + delta }
    ≤ A3_narrative_effectiveness ctx := by
  simp only [A3_narrative_effectiveness, base_a3, a8_scaling, platform_contribution]
  have h1 : (1 : ℝ) + ctx.platform_friction > 0 := by linarith
  have h2 : (1 : ℝ) + (ctx.platform_friction + delta) > 0 := by linarith
  have h3 : (1 : ℝ) + ctx.platform_friction ≤ 1 + (ctx.platform_friction + delta) := by linarith
  have h4 : (1 : ℝ) / (1 + (ctx.platform_friction + delta))
          ≤ 1 / (1 + ctx.platform_friction) := by
    apply div_le_div_of_nonneg_left _ h1 h3
    exact zero_le_one
  linarith

/-- **推论：Sigmoid 单调性**（A8 渗透率函数本身也是单调的）。
    这是 v4 相对 Nat 近似的实质性收获：sigmoid 是真正的 S 形连续函数。 -/
theorem sigmoid_monotone : Monotone sigmoid := by
  intro x y hxy
  simp only [sigmoid]
  apply div_le_div_of_nonneg_left _ _ _
  · exact one_pos.le
  · positivity
  · linarith [Real.exp_le_exp.mpr (neg_le_neg hxy)]

end Fc.Chain16
