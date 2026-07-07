import FcCore.Types

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 18: Null-Feedback Boundary Theorem
-- Source: Fc-v9.6.8-REVISED-Core.md id84 + 反馈缺失边界定理的反用推导（REVISED）
-- Steps: forward ~5, reverse ~9
-- Key: F_{V→S} ≈ ∅ marks the boundary where Fc diagnosis remains valid
--      but intervention leverage breaks; reverse direction traces cost spillover
--      to substitute node V' when A7 exit-blocking fails to execute.
-- ─────────────────────────────────────────────

/-- System (S): institutional structure that can potentially adjust based on
    feedback from victims. `can_adjust = true` means the system has the structural
    capacity to respond to feedback. -/
structure NF_System where
  can_adjust : Bool

/-- Victim (V): the subject bearing the cost of extraction/harm.
    `alive = false` models permanent silencing (death).
    `can_feedback = false` models living but blocked feedback channels. -/
structure NF_Victim where
  alive        : Bool
  can_feedback : Bool

/-- RiskSource (R): the source of ongoing harm to substitute nodes.
    `active = true` means the source has not been eliminated or isolated. -/
structure NF_RiskSource where
  active : Bool

/-- SubstituteNode (V'): living subject exposed to the same risk source after
    the original victim can no longer feed back into the system.
    `exposed_to_risk = true` means V' shares geographic/blood/social overlap
    with the risk source.
    `bears_cost = true` means V' is forced to absorb costs that the system
    failed to cover. -/
structure NF_SubstituteNode where
  exposed_to_risk : Bool
  bears_cost      : Bool

-- Feedback channel from victim to system is active only when:
--   1. victim is alive,
--   2. victim can feed back,
--   3. system can adjust based on that feedback.
def NF_feedback_active (v : NF_Victim) (s : NF_System) : Prop :=
  v.alive = true ∧ v.can_feedback = true ∧ s.can_adjust = true

def NF_feedback_blocked (v : NF_Victim) (s : NF_System) : Prop :=
  ¬ NF_feedback_active v s

-- System has intervention leverage exactly when it can adjust.
def NF_system_has_leverage (s : NF_System) : Prop :=
  s.can_adjust = true

/-- Forward direction of Null-Feedback Boundary Theorem:
    When feedback from victim to system is blocked, the system's critical
    leverage is broken.

    Derivation:
      1. Feedback active requires victim alive, victim can feedback, system can adjust.
      2. If feedback is blocked, at least one of these three conditions fails.
      3. When the failure is on the system side (victim is alive and can feedback),
         the system loses leverage. -/
theorem null_feedback_boundary_forward
    (v : NF_Victim) (s : NF_System)
    (h_blocked : NF_feedback_blocked v s)
    (h_victim_alive : v.alive = true)
    (h_victim_can_feedback : v.can_feedback = true) :
    NF_system_has_leverage s = false := by
  simp [NF_feedback_blocked, NF_feedback_active, NF_system_has_leverage] at *
  exact h_blocked h_victim_alive h_victim_can_feedback

-- Risk persists when the risk source has not been eliminated or isolated.
def NF_risk_persists (r : NF_RiskSource) : Prop :=
  r.active = true

-- [AXIOM] Cost conservation under feedback blockage:
-- When feedback is blocked, the risk source persists, and a substitute node
-- is exposed to that risk, the uncovered cost is transferred to the substitute.
--
-- This axiom formalizes the exclusionary argument from the diagnostic document:
--   - cost is not absorbed by the system (S2 fails to isolate/monitor/constrain),
--   - cost does not dissipate (risk source remains active),
--   - cost is not borne by the perpetrator (no ongoing constraint after release),
--   - therefore cost transfers to the exposed substitute node V'.
axiom NF_cost_transfers_to_substitute
    (v : NF_Victim) (s : NF_System) (r : NF_RiskSource) (v' : NF_SubstituteNode)
    (h_fb   : NF_feedback_blocked v s)
    (h_risk : NF_risk_persists r)
    (h_exp  : v'.exposed_to_risk = true) :
    v'.bears_cost = true

/-- Reverse direction of Null-Feedback Boundary Theorem:
    When feedback is blocked, risk persists, and a substitute node is exposed,
    the substitute node is forced to bear costs that the system failed to cover.

    This is not A8 internalization ("I should bear this"). It is A7 downstream:
    the system failed to block the risk source, so the living subject must
    physically exit or self-protect. "跑了" is A7's embodied execution, not A8.

    Derivation:
      1. V can no longer feed back into S2 (feedback blocked).
      2. S2 does not execute isolation/monitoring/constraint (adjustment failure).
      3. Risk source remains active.
      4. V' overlaps with the risk source (exposed).
      5. By cost conservation axiom, cost transfers to V'.
      6. V' becomes the substitute bearer of S2's unexecuted function. -/
theorem null_feedback_boundary_reverse
    (v : NF_Victim) (s : NF_System) (r : NF_RiskSource) (v' : NF_SubstituteNode)
    (h_fb   : NF_feedback_blocked v s)
    (h_risk : NF_risk_persists r)
    (h_exp  : v'.exposed_to_risk = true) :
    v'.bears_cost = true := by
  exact NF_cost_transfers_to_substitute v s r v' h_fb h_risk h_exp

end Fc
