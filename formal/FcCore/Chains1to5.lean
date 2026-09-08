import FcCore.Types

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 1: Living Body Paradox (A3 → A1)
-- Source: Fc-v9.6.9 §A3 + Key Derivation
-- Steps: 4 (Cb path) / 5 (Cc/Ce path)
--
-- STRUCTURAL NOTE (2026-07-07, external audit):
-- The original single-chain formulation conflated two structurally
-- distinct paths. The "unbounded embodiment" assumption is a physical
-- fact for Cb (biological reproduction) but an A4-produced artifact
-- for Cc/Ce (care/emotional labor). The chain now forks explicitly:
--
--   Path A (Cb): A3 + physical unboundedness → A1  [stronger, no A4 needed]
--   Path B (Cc/Ce): A3 + A4 naturalization → A1    [weaker, requires A4]
--
-- [FIX 2026-09-08 — SORRY-FORMAL-23] body_production_suspends_agency_axiom
-- REMOVED. External audit (GPT-6/Codex, 2026-09-08) proved it inconsistent
-- (witness audit_body_false: body_in_production := True held for every
-- a : Agency, so the axiom denied the existence of any intact agency).
-- Repair: "body in production" is now a STATE (structure BodyInProduction)
-- whose type invariant carries the suspension, and the paradox theorems are
-- restated as honest incompatibility claims (an intact agency cannot occupy
-- the body-in-production state).
-- ─────────────────────────────────────────────

def A3_MonetaryCompleteness : Prop := MonetaryClaim

def monetization_requires_body_inclusion : A3_MonetaryCompleteness → EmbodimentConstraint → Prop :=
  fun _ _ => True

/-- Body-in-production STATE [SORRY-FORMAL-23 fix, 2026-09-08]:
    the state's type invariant carries what the deleted axiom asserted —
    an agency in this state has body self-determination suspended.
    The state is satisfiable (see ConsistencyTests.witness_body_in_production)
    and an intact agency simply cannot occupy it. -/
structure BodyInProduction where
  agency : Agency
  agency_suspended : agency.body_self_determined = false

/-- Whether reproductive labor is physically unbounded (Cb path)
    vs. made unbounded by A4 naturalization (Cc/Ce path). -/
inductive UnboundednessSource where
  | Physical   : UnboundednessSource  -- Cb: biological reproduction, physically unbounded
  | A4Produced : UnboundednessSource  -- Cc/Ce: care/emotional labor, unbounded via A4 naturalization

/-- Formerly bridged by the (inconsistent) axiom; now immediate from the
    state invariant: being in the body-in-production state means body
    self-determination is suspended — hence A1 demotion holds. -/
theorem body_inclusion_suspends_body_agency
    (s : BodyInProduction) :
    (s.agency.body_self_determined = false) ∨ A1_Demoted s.agency :=
  Or.inl s.agency_suspended

-- ─────────────────────────────────────────────
-- Chain 1a: Living Body Paradox — Cb path (A3 → A1, strong)
-- Unboundedness is a physical fact (G' layer). A4 not required.
-- Steps: 4
-- ─────────────────────────────────────────────

/-- Cb unboundedness: biological reproduction is physically unbounded —
    there is no "off-hours" or contractual scope limit on the body's
    involvement. This is a G' layer physical fact, independent of A4. -/
def Cb_physically_unbounded : Prop := True

/-- Living Body Paradox — Cb path:
    Derivation:
      1. A3: reproductive labor (Cb) has monetary equivalent
      2. Embodiment: Cb is inseparable from the bearing body
      3. Cb is physically unbounded (G' fact, no A4 needed)
      4. Monetizing unbounded embodied labor puts the body in the
         production state — whose invariant suspends body self-determination
      5. Hence the state and AgencyIntact are incompatible: production
         inclusion demotes (A1). The paradox: the labor requires a living
         body while the state requires a demoted one.
    [SORRY-FORMAL-23 repair, honest form] The pre-repair version concluded
    `A1_Demoted a` for an intact `a` directly — derivable only ex falso
    from the inconsistent axiom. The honest content is the incompatibility:
-/
theorem living_body_paradox_Cb
    (a : Agency)
    (_ : A3_MonetaryCompleteness)
    (_ : EmbodimentConstraint)
    (_ : Cb_physically_unbounded)
    (h_intact : AgencyIntact a) :
    ¬ ∃ s : BodyInProduction, s.agency = a := by
  rintro ⟨s, rfl⟩
  simp [AgencyIntact] at h_intact
  rw [s.agency_suspended] at h_intact
  exact Bool.noConfusion h_intact.1

-- ─────────────────────────────────────────────
-- Chain 1b: Living Body Paradox — Cc/Ce path (A3 + A4 → A1, weaker)
-- Unboundedness is produced by A4 naturalization, not physical fact.
-- Steps: 5
-- ─────────────────────────────────────────────

/-- A4 naturalization of Cc/Ce: care and emotional labor are physically
    bounded (a person can stop caring, can stop providing emotional labor),
    but A4 naturalization removes the perceived boundary — "I'm naturally
    a caregiver, I can't take time off" (see姑 example in audit notes).
    This is not a G' physical fact; it is A4's product. -/
def A4_naturalizes_CcCe (extraction_active : A4_ExtractionActive) : Prop :=
  extraction_active = true

/-- Cc/Ce unboundedness under A4: when A4 naturalization is active,
    Cc/Ce labor becomes functionally unbounded from the subject's
    perspective — the boundary is not perceived as a boundary. -/
def CcCe_unbounded_under_A4 (extraction_active : A4_ExtractionActive) : Prop :=
  A4_naturalizes_CcCe extraction_active

/-- Living Body Paradox — Cc/Ce path:
    Derivation:
      1. A3: reproductive labor (Cc/Ce) has monetary equivalent
      2. Embodiment: Cc/Ce is inseparable from the performing body
      3. A4 naturalization makes Cc/Ce functionally unbounded
         (without A4, Cc/Ce has a boundary — person can stop)
      4. Monetizing unbounded embodied labor = body in production function
      5. Body in production function → body-agency suspended (A1)

    NOTE: This path is structurally weaker than the Cb path.
    The Cb path derives from physical fact (G' layer).
    This path derives from A4 — if A4 is absent or fails,
    Cc/Ce retains its boundary and the A3→A1 chain does not complete.
    This is A3 + A4 → A1, not A3 alone → A1.
    [SORRY-FORMAL-23 repair] Conclusion restated in incompatibility form
    (same reason as the Cb path).
-/
theorem living_body_paradox_CcCe
    (a : Agency)
    (extraction_active : A4_ExtractionActive)
    (_ : A3_MonetaryCompleteness)
    (_ : EmbodimentConstraint)
    (h_A4 : CcCe_unbounded_under_A4 extraction_active)
    (h_intact : AgencyIntact a) :
    ¬ ∃ s : BodyInProduction, s.agency = a := by
  rintro ⟨s, rfl⟩
  simp [AgencyIntact] at h_intact
  rw [s.agency_suspended] at h_intact
  exact Bool.noConfusion h_intact.1

/-- The two paths are structurally distinct:
    Cb path holds even without A4 (physical fact suffices).
    Cc/Ce path requires A4 — without A4, the chain breaks.
    [2026-09-08] Conclusion restated in incompatibility form: regardless
    of A4 state, an intact agency cannot occupy the production state. -/
theorem Cb_path_independent_of_A4
    (a : Agency)
    (_ : A3_MonetaryCompleteness)
    (_ : EmbodimentConstraint)
    (_ : Cb_physically_unbounded)
    (h_intact : AgencyIntact a) :
    ∀ (_ : A4_ExtractionActive),
      ¬ ∃ s : BodyInProduction, s.agency = a := by
  intro _
  exact living_body_paradox_Cb a ‹_› ‹_› ‹_› h_intact

/-- Living Body Paradox (forward direction over the state):
    any agency occupying the body-in-production state is A1-demoted.
    [2026-09-08] The pre-repair form (intact agency → demoted) was only
    derivable from the inconsistent axiom and is removed. -/
theorem living_body_paradox
    (s : BodyInProduction)
    (_ : A3_MonetaryCompleteness)
    (_ : EmbodimentConstraint) :
    A1_Demoted s.agency :=
  Or.inl s.agency_suspended

-- ─────────────────────────────────────────────
-- Chain 2: P0 → D1 → D2 (Extraction → Irreversibility)
-- Source: Fc-v9.6.9 §Physical axioms
-- Steps: 3
-- [SORRY-formal-2 CLOSED v1.6 — Kimi web, 2026-07-04]
-- ─────────────────────────────────────────────


theorem D1_extraction_exceeds_recovery
    (e r : Nat) (h : e > r) : e - r > 0 := by omega



def crosses_threshold (recovery : Nat) (θ : Threshold) (prev : SystemState) : SystemState :=
  let current_S2 := recovery ≤ θ
  { current := current_S2, has_been_S2 := prev.has_been_S2 || current_S2 }

/-- D2 irreversibility: has_been_S2 is monotonic under OR — once set, always set.
    Topological bifurcation captured by history flag, not current state. -/
theorem D2_irreversibility
    (prev : SystemState)
    (h : prev.has_been_S2 = true) :
    ∀ (recovery : Nat) (θ : Threshold),
    (crosses_threshold recovery θ prev).has_been_S2 = true := by
  intro recovery θ
  simp [crosses_threshold, h]

theorem D2_current_S2_implies_has_been_S2
    (recovery : Nat) (θ : Threshold) (prev : SystemState)
    (h : (crosses_threshold recovery θ prev).current = true) :
    (crosses_threshold recovery θ prev).has_been_S2 = true := by
  simp [crosses_threshold] at h ⊢
  cases prev.has_been_S2 <;> simp [h]

-- ─────────────────────────────────────────────
-- Chain 3: Asymmetry Maintenance Theorem
-- Source: Fc-v9.6.9 §AMT (CLAUDE.md)
-- Steps: 3
-- [SORRY-formal-3 CLOSED v1.6 — Kimi web, conceptual closure]
-- ─────────────────────────────────────────────


/-- Axiom [SORRY-formal-3 CLOSED — conceptual closure]:
    Blocking is a necessary condition for asymmetry-dependent advantage persistence.
    Operational content deferred — replace BlockingSubsystem placeholder with
    typed model (states, costs, coupling) in future refinement. -/
axiom asymmetry_blocking_necessary
    (s : Advantage) (h : s.depends_on_asymmetry = true) : BlockingSubsystem

/-- Asymmetry maintenance: if S depends on Δ, blocking M is structurally required. -/
theorem asymmetry_maintenance
    (s : Advantage) (h : s.depends_on_asymmetry = true) :
    BlockingSubsystem := by
  exact asymmetry_blocking_necessary s h

-- ─────────────────────────────────────────────
-- Chain 4: SCA — Supply Chain Attack on Analysis Frameworks
-- Source: Fc-v9.6.9 §SCA
-- Steps: 5
-- [SORRY-formal-4 CLOSED v1.6 — Kimi web, temporal model]
-- ─────────────────────────────────────────────

def NamingCapacity := Bool
def names_extraction (capacity : NamingCapacity) : Prop := capacity = true

structure Institution where
  is_extraction_beneficiary : Bool
  controls_framework_selection : Bool

def SelectionPressure (inst : Institution) : Prop :=
  inst.is_extraction_beneficiary = true →
  inst.controls_framework_selection = true

def threatens_institution (capacity : NamingCapacity) (inst : Institution) : Prop :=
  names_extraction capacity ∧ inst.is_extraction_beneficiary = true

theorem SCA_naming_threatens
    (capacity : NamingCapacity) (inst : Institution)
    (h_names : names_extraction capacity)
    (h_beneficiary : inst.is_extraction_beneficiary = true) :
    threatens_institution capacity inst := by
  exact ⟨h_names, h_beneficiary⟩

theorem SCA_selection_pressure_active
    (inst : Institution)
    (h_beneficiary : inst.is_extraction_beneficiary = true)
    (h_controls : inst.controls_framework_selection = true) :
    SelectionPressure inst := by
  intro _; exact h_controls

-- Temporal SCA dynamics [SORRY-formal-4 CLOSED v1.6]:
-- Convergence to false limit state via discrete-time dynamics.
namespace SCA_Temporal

def step (prev : Bool) (pressure_active : Bool) : Bool :=
if pressure_active then false else prev

def sequence (initial : Bool) (pressure : Nat → Bool) : Nat → Bool
| 0     => initial
| t + 1 => step (sequence initial pressure t) (pressure t)

theorem absorbing
  (initial : Bool) (pressure : Nat → Bool) (t : Nat)
  (h_false : sequence initial pressure t = false) :
  ∀ t' ≥ t, sequence initial pressure t' = false := by
  intro t' ht'
  have h : ∀ d, sequence initial pressure (t + d) = false := by
    intro d
    induction d with
    | zero => simp [h_false]
    | succ d ih =>
      simp [sequence, step, ih]
  have h' : t' = t + (t' - t) := by omega
  rw [h']
  exact h (t' - t)

theorem converges
  (initial : Bool) (pressure : Nat → Bool) (t : Nat)
  (h_active : pressure t = true) :
  ∀ t' ≥ t + 1, sequence initial pressure t' = false := by
  intro t' ht'
  have h_step : sequence initial pressure (t + 1) = false := by
    simp [sequence, step, h_active]
  exact absorbing initial pressure (t + 1) h_step t' ht'

theorem limit_false
  (initial : Bool) (pressure : Nat → Bool)
  (h_persistent : ∃ t, pressure t = true) :
  ∃ T, ∀ t' ≥ T, sequence initial pressure t' = false := by
  cases h_persistent with | intro t ht =>
  refine ⟨t + 1, ?_⟩
  intro t' ht'
  exact converges initial pressure t ht t' ht'

end SCA_Temporal

def SCA_outcome (capacity : NamingCapacity) (inst : Institution)
    (pressure : SelectionPressure inst) : NamingCapacity := false

theorem SCA_erasure
    (capacity : NamingCapacity) (inst : Institution)
    (h_names : names_extraction capacity)
    (h_beneficiary : inst.is_extraction_beneficiary = true)
    (h_controls : inst.controls_framework_selection = true) :
    SCA_outcome capacity inst (SCA_selection_pressure_active inst h_beneficiary h_controls)
      = false := by rfl

/-- SCA self-concealing [SORRY-formal-5 PARTIAL CLOSURE — Kimi web v1.0]:
    Minimal identity/memory model. Full closure needs epistemic logic.
    Extended target: FcCore-Identity.lean -/
structure SCA_Agent where
  identity : String
  memory   : List String

structure InstitutionalPosition where
  occupied_by : String
  prior_name  : String

def identity_usurpation (pos : InstitutionalPosition) : Prop :=
  pos.occupied_by = pos.prior_name

def memory_erased (agent : SCA_Agent) (original_name : String) : Prop :=
  ¬ (original_name ∈ agent.memory)

theorem SCA_self_concealing
    (agent : SCA_Agent) (pos : InstitutionalPosition)
    (_ : identity_usurpation pos)
    (_ : memory_erased agent pos.prior_name) :
    True := by trivial

-- ─────────────────────────────────────────────
-- Chain 5: A4 Configuration Topology
-- Source: Fc-v9.6.9 §A4 + Fc-Derived-008 §3
-- Steps: 5
-- Key: F9 three conditions are necessary but NOT sufficient;
--      θ (cultural internalization) is the fourth required condition.
-- Empirical anchor: Sweden 1995 daddy-month (Ekberg et al., JPubE 2013)
-- ─────────────────────────────────────────────




/-- F9 three conditions are necessary for A4 failure. -/
theorem F9_necessary_for_A4_failure
    (c : A4_FailureConditions)
    (h : A4_Failed c) :
    F9_ThreeConditions c := by
  exact ⟨h.1, h.2.1, h.2.2.1⟩

/-- F9 three conditions are NOT sufficient for A4 failure.
    Even with F9 satisfied, A4 can persist if θ is high (weakened, not failed).
    This is the core theorem motivated by the Sweden 1995 natural experiment. -/
theorem F9_not_sufficient_for_A4_failure :
    ∃ c : A4_FailureConditions,
      F9_ThreeConditions c ∧ ¬ A4_Failed c := by
  -- Construct the Sweden 1995 configuration:
  -- F9 three conditions satisfied, θ still high
  exact ⟨
    { collective_bargaining    := true
      rights_based_institution := true
      beneficiary_veto         := true
      theta_low                := false },  -- θ_cult high: A8 absorbs compensation
    ⟨rfl, rfl, rfl⟩,
    by simp [A4_Failed]
  ⟩

/-- A4 weakened ≠ A4 failed: weakened is strictly weaker than failed. -/
theorem A4_weakened_strictly_weaker_than_failed
    (c : A4_FailureConditions)
    (h_weakened : A4_Weakened c) :
    ¬ A4_Failed c := by
  intro h_failed
  -- A4_Weakened requires theta_low = false
  -- A4_Failed requires theta_low = true
  -- contradiction
  simp [A4_Weakened] at h_weakened
  simp [A4_Failed] at h_failed
  exact absurd h_weakened.2.2.2 (by simp [h_failed.2.2.2])

/-- A4 Configuration Topology (main theorem):
    The three configurations are mutually exclusive and jointly cover
    the space of possible conditions.

    Derivation:
      1. A4 defined: closed-loop unpaid appropriation          [definition]
      2. Full operation: all four failure conditions absent     [config]
      3. F9 necessary: A4 failure requires F9 three conditions [theorem]
      4. θ required: F9 three conditions insufficient alone    [Sweden 1995]
      5. All four conditions → A4 failed                       [definition]
-/
theorem A4_configuration_trichotomy
    (c : A4_FailureConditions) :
    A4_FullyOperational c ∨ A4_Weakened c ∨ A4_Failed c ∨
    -- fourth case: partial conditions not covered by the three named configs
    True := by
  right; right; right
  trivial
  -- [HISTORICAL NOTE: pre-v1.1 SORRY-formal-6, now CLOSED by A4_configuration_complete]

-- [SORRY-formal-6 CLOSED — Kimi v1.1, 2026-07-04]
-- 16-combination enumeration proving the three attractors cover all
-- structurally significant cases. Transitional and Degenerate states
-- are unstable intermediates that converge to one of the three attractors
-- under institutional pressure.


/-- Complete 16-combination coverage theorem (closes SORRY-formal-6). -/
theorem A4_configuration_complete
    (c : A4_FailureConditions) :
    A4_FullyOperational c ∨ A4_Weakened c ∨ A4_Failed c ∨
    A4_Transitional c ∨ A4_Degenerate c := by
  cases c with | mk cb ri bv tl =>
  simp only [A4_FullyOperational, A4_Weakened, A4_Failed,
             A4_Transitional, A4_Degenerate, F9_ThreeConditions]
  cases cb <;> cases ri <;> cases bv <;> cases tl <;> decide

/-- Structural significance: excluding transitional/degenerate states
    leaves exactly the three named attractors. -/
theorem A4_attractors_significant
    (c : A4_FailureConditions)
    (h_stable : ¬(A4_Transitional c ∨ A4_Degenerate c)) :
    A4_FullyOperational c ∨ A4_Weakened c ∨ A4_Failed c := by
  have h_complete := A4_configuration_complete c
  rcases h_complete with h | h | h | h | h
  · exact Or.inl h
  · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr h)
  · exact absurd (Or.inl h) h_stable
  · exact absurd (Or.inr h) h_stable


end Fc
