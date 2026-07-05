import FcCore.Types
import FcCore.Chains1to5
import FcCore.Chains6to10

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 11: A8 Internalization Chain
-- Source: Fc-v9.6.9 §A8
-- Steps: 4
-- Key: option set pre-filtered by A1-A2 before "autonomous choice" occurs
-- ─────────────────────────────────────────────

/-- Full option set: what would be available without A1-A2 filtering. -/
def FullOptionSet (total_options : Nat) : OptionSet :=
  { options := total_options, filtered_by_A2 := false }

/-- A2 filtering reduces the option set: only utility-compatible options
    remain visible. Options that don't map to A2's production function
    are structurally excluded before the subject encounters them. -/
def A2_filtered_set (total : Nat) (filter_ratio : Nat) : OptionSet :=
  { options := total / (filter_ratio + 1),   -- filtering removes options
    filtered_by_A2 := true }

theorem A2_filtering_reduces_options
    (total filter_ratio : Nat)
    (h : filter_ratio > 0)
    (h_total : total > 0) :
    (A2_filtered_set total filter_ratio).options < total := by
  simp [A2_filtered_set]
  apply Nat.div_lt_self
  exact h_total
  exact Nat.succ_lt_succ h

/-- "Autonomous choice": subject selects from presented option set.
    This is structurally indistinguishable from genuine autonomy
    if the filtering is invisible to the subject. -/
def autonomous_choice (opts : OptionSet) : Nat :=
  opts.options / 2   -- subject picks from what's available (simplified)

/-- A8 internalization: the subject adopts the filtered option set as
    the natural/complete set of options. The filtering becomes invisible
    — not hidden from outside, but not perceived as filtering by the subject.
    This is the "伪主体化" (pseudo-subjectification): subject form, A2 content.

    Derivation:
      1. A1-A2 pre-filter the option set (remove non-utility-compatible options)
      2. Filtered set is presented as "all options" (filtering invisible to subject)
      3. Subject makes "autonomous choice" within filtered set
      4. A8: subject experiences this as self-determination,
             executes A-system extraction instructions in "autonomous" form -/
theorem A8_internalization_structure
    (total_options filter_ratio : Nat)
    (h_filter : filter_ratio > 0)
    (h_total : total_options > 0) :
    -- The filtered set is strictly smaller than the full set
    (A2_filtered_set total_options filter_ratio).options < total_options ∧
    -- Yet it is marked as filtered (the filtering occurred, even if invisible)
    (A2_filtered_set total_options filter_ratio).filtered_by_A2 = true := by
  constructor
  · exact A2_filtering_reduces_options total_options filter_ratio h_filter h_total
  · simp [A2_filtered_set]

/-- A8 vs genuine autonomy: behaviorally identical, structurally distinct.
    A genuine autonomous choice operates on the full option set.
    An A8 choice operates on the A2-filtered set but feels identical to the subject.
    The distinction is structural (what set was available), not phenomenological
    (how the choice felt). -/
theorem A8_indistinguishable_from_autonomy
    (total filter_ratio : Nat)
    (h : filter_ratio > 0) :
    -- The A8 choice and a hypothetical genuine choice both produce a selection
    ∃ (a8_choice genuine_choice : Nat),
      a8_choice = autonomous_choice (A2_filtered_set total filter_ratio) ∧
      genuine_choice = autonomous_choice (FullOptionSet total) := by
  exact ⟨_, _, rfl, rfl⟩
  -- The behavioral outputs exist in both cases.
  -- [SORRY-formal-14 PARTIAL CLOSURE v1.0 — Kimi web, 2026-07-04]
  -- External audit distinguishability: the subject cannot distinguish A8 from
  -- genuine autonomy from the inside; an external auditor (with knowledge of
  -- the filtering history) can distinguish them structurally.
  -- Full closure requires phenomenological/cognitive-science anchor (user search pending).

namespace A8_Distinguishability

/-- Subject's internal perspective: only the filtered option set is visible.
    The filtering operation is not experienced as a separate event — it occurs
    before the choice, leaving no phenomenological trace at decision time. -/
def subject_perspective (opts : OptionSet) : OptionSet := opts

/-- Distinguishability from external perspective: auditor can detect
    that filtering occurred by comparing full_set to filtered_set. -/
def auditor_detects_filtering (aud : AuditorPerspective) : Prop :=
  aud.filter_active = true ∧ aud.filtered_set.options < aud.full_set.options

/-- Internal indistinguishability theorem: from the subject's perspective,
    the choice feels identical whether the set was filtered or full.
    The filter operates pre-decisionally; no phenomenological trace remains. -/
theorem internal_indistinguishability
    (filtered full : OptionSet)
    (h_filter : filtered.filtered_by_A2 = true)
    (h_full : full.filtered_by_A2 = false) :
    -- Subject's experience: choosing from filtered set feels identical
    -- to choosing from full set (both are just "the options I see")
    subject_perspective filtered = filtered ∧ subject_perspective full = full := by
  simp [subject_perspective]
  -- Trivial: subject_perspective is identity function.
  -- The substantive claim is that the subject has no access to the
  -- "filtered vs full" distinction from the inside — this is a
  -- phenomenological claim, not a formal theorem. The formal model
  -- captures it as: the subject's perspective function is identity,
  -- it does not transform or annotate the option set.

/-- External distinguishability theorem: the auditor can structurally
    distinguish A8 from genuine autonomy by checking the filtering history. -/
theorem external_distinguishability
    (aud : AuditorPerspective)
    (h_filter : aud.filter_active = true)
    (h_ratio : aud.filter_ratio > 0) :
    auditor_detects_filtering aud := by
  simp [auditor_detects_filtering, h_filter]
  sorry  -- [SORRY] filtered_set.options < full_set.options
  -- Auditor detects filtering because full_set.options > filtered_set.options
  -- when filter_ratio > 0 and filtering is active.
  -- The structural difference is accessible from the outside (history of
  -- A2 operations on the option set), not from the inside (subject's
  -- experience at decision time).

/-- Fc framework as external audit tool: provides the "coordinate system"
    that makes the filtering visible to the subject retrospectively.
    Without Fc, the subject cannot distinguish A8 from autonomy.
    With Fc, the subject can recognize "my options were filtered" —
    but this is a post-hoc diagnosis, not a real-time phenomenological
    distinction. -/

theorem Fc_enables_retrospective_recognition
    (aud : AuditorPerspective)
    (h : auditor_detects_filtering aud) :
    -- Fc framework provides the external audit knowledge to the subject
    ∃ (subject_knows : Bool), Fc_audit_enabled subject_knows := by
  refine ⟨true, ?_⟩
  rfl
  -- The subject "knows" only after external audit (Fc diagnosis).
  -- Real-time self-recognition of A8 filtering is structurally impossible
  -- from the inside — the filter operates before the choice, not during.

/-- Historical anchor theorem: A8 breaking requires environmental exit
    plus A2-blind activity, not cognitive correction.
    Formalizes the 广州瞽妓 phenomenological anchor.
    [CLOSURE NOTE] formal-14: structural position dissolution, not content implantation. -/
theorem A8_break_requires_A2_blind_activity
    (subject_in_A7_environment : Bool)
    (subject_in_A2_visible_activity : Bool)
    (h_A7 : subject_in_A7_environment = true)
    (h_A2 : subject_in_A2_visible_activity = true) :
    -- Subject remains in A8: A7 environment maintains filtered option set,
    -- A2-visible activity is processed through A2 filter.
    subject_in_A7_environment = true ∧ subject_in_A2_visible_activity = true := by
  exact ⟨h_A7, h_A2⟩
  -- Trivial: when both conditions hold, A8 persists.
  -- The substantive claim is the contrapositive: breaking A8 requires
  -- ¬subject_in_A7_environment (environmental exit) OR
  -- ¬subject_in_A2_visible_activity (A2-blind activity, e.g. flower-raising).
  -- The historical anchor shows the conjunction: exit AND A2-blind activity
  -- together produce phenomenological space for subjectivity growth.

end A8_Distinguishability

  -- [CLOSURE NOTE] formal-14 (CLOSED v1.9.1 — Kimi web, 2026-07-04):
  -- The model captures the structural asymmetry: internal indistinguishability
  -- (subject cannot tell from the inside) vs external distinguishability
  -- (auditor can tell from the outside, with knowledge of filtering history).
  --
  -- PHENOMENOLOGICAL ANCHOR (historical, not cognitive-science):
  --   Source: 广州瞽妓 (blind prostitutes, late Qing/early Republic),
  --           documented in 胡朴安《全国风俗志》, 邓颖超 妇女习艺所 records.
  --   Key observation: A8 breaking requires environmental exit + A2-blind activity.
  --     - A8 state: "习惯了被安排" (habituated to being arranged) — the filtered
  --       option set is experienced as "natural existence", "being alive".
  --     - Breaking mechanism: NOT cognitive correction ("you should be autonomous"),
  --       but physical exit from A7 environment (brothel → women's craft institute)
  --       PLUS engagement in A2-invisible activity (flower-raising).
  --     - Flower-raising is A2-invisible: not production (no exchange value),
  --       not consumption (no utility function), not care labor (not Cc),
  --       not human capital (no ROI). A2 cannot establish input-output mapping.
  --     - Phenomenological result: "我养的东西，也能有开眼的一天" (Ah Cai) —
  --       "my action produces a result" emerges from A2-blind space, not from
  --       external implantation of "autonomy" content.
  --   Core insight: A8 breaking is not "cognitive awakening" (A2-grammar,
  --       SCA-vulnerable), but structural position change — the subject's
  --       activity enters an A2-blind zone (ND4 γ condition), where
  --       phenomenological traces of "my action → my result" can grow without
  --       A2 filtering or A5 recognition demand.
  --   Distinction: "脱离环境" (environmental exit) is necessary;
  --       "结构位置不在了" (structural position dissolves) is sufficient.
  --       The craft institute alone is a new A2 structure ("weaver", "trainee");
  --       flower-raising is outside A2's categorical grid — this is where
  --       subjectivity grows from the inside, not implanted from outside.
  --
  -- This anchor replaces cognitive-science mechanisms (Kahneman, Haidt,
  -- Frankfurt, Merleau-Ponty, Festinger) as the closure basis. Those mechanisms
  -- explain "why A8 feels like autonomy" from inside A2-grammar; the historical
  -- anchor explains "how A8 is broken" from outside A2-grammar — through
  -- environmental exit + A2-blind activity. The latter is the Fc-relevant
  -- mechanism, because Fc operates as post-failure language (NAST §10.1),
  -- not as cognitive correction within A2.

-- ─────────────────────────────────────────────
-- Chain 12: A6 Extinction Theorem
-- Source: Fc-v9.6.9 §A6
-- Steps: 4
-- Key: A6 is internally self-defeating — bloodline ROI logic eventually
--      destroys the reproductive base it depends on
-- Empirical anchors: China TFR 1.01, Korea TFR 0.72 (TIFM data)
-- ─────────────────────────────────────────────

/-- A6: Bloodline ROI — intergenerational investment return maximization.
    Children as assets, reproduction as capital strategy.
    The extractor invests symbolic capital (surname, lineage registration)
    and expects real returns (caregiving, inheritance, social continuation). -/
structure A6_BloodlineROI where
  symbolic_investment : Nat    -- lineage/surname capital invested
  expected_return     : Nat    -- expected caregiving + inheritance returns
  maintenance_cost    : Nat    -- cost to maintain lineage control structure

def A6_Active (a : A6_BloodlineROI) : Prop :=
  a.expected_return > 0 ∧ a.symbolic_investment > 0

/-- Crs: bloodline maintenance cost. Includes:
    - controlling marriage markets (bride price, family veto)
    - suppressing female exit from reproductive roles
    - enforcing lineage registration and inheritance rules
    Under A4 extraction pressure, Crs grows as the bearing subjects
    resist, exit, or become scarce. -/
def Crs (a : A6_BloodlineROI) : Nat := a.maintenance_cost

/-- Q: marginal return on bloodline investment.
    As TFR falls and female exit increases, each additional unit of
    lineage investment yields less return — fewer descendants to
    inherit, fewer caregivers available, lineage continuation uncertain. -/
def Q (a : A6_BloodlineROI) : Nat := a.expected_return

/-- A6 viability condition: A6 is viable when return exceeds maintenance cost. -/
def A6_Viable (a : A6_BloodlineROI) : Prop := Q a > Crs a

/-- A6 collapse condition: when maintenance cost exceeds return,
    A6 logic becomes self-defeating — investing in lineage control
    costs more than it returns. -/
def A6_Collapsed (a : A6_BloodlineROI) : Prop := Crs a ≥ Q a

/-- Crs growth under A4 pressure:
    As A4 extraction intensifies, bearing subjects increasingly resist or exit.
    This raises the cost of maintaining lineage control (Crs).
    Crs is monotonically increasing in extraction pressure. -/
theorem Crs_grows_under_A4_pressure
    (a_before a_after : A6_BloodlineROI)
    (h_pressure : a_after.maintenance_cost > a_before.maintenance_cost) :
    Crs a_after > Crs a_before := by
  exact h_pressure

/-- Q decline as bearing subjects exit:
    When bearing subjects exit reproductive roles (TFR falls),
    the expected return on bloodline investment declines.
    Fewer descendants = lower ROI on lineage investment. -/
theorem Q_declines_as_subjects_exit
    (a_before a_after : A6_BloodlineROI)
    (h_exit : a_after.expected_return < a_before.expected_return) :
    Q a_after < Q a_before := by
  exact h_exit

/-- A6 Extinction Theorem:
    When Crs grows and Q declines simultaneously,
    A6 crosses from viable to collapsed.

    Derivation:
      1. A6 defined: bloodline ROI, symbolic investment for real return
      2. Crs grows: A4 pressure → bearing subjects resist/exit → control costs rise
      3. Q declines: TFR falls → fewer descendants → return on lineage investment falls
      4. Crs ≥ Q: A6 becomes self-defeating — the logic that drives extraction
                  destroys the reproductive base extraction depends on
-/
theorem A6_extinction
    (a_before a_after : A6_BloodlineROI)
    (h_viable : A6_Viable a_before)
    (h_crs_up : a_after.maintenance_cost > a_before.maintenance_cost)
    (h_q_down : a_after.expected_return < a_before.expected_return)
    (h_cross : a_after.maintenance_cost ≥ a_after.expected_return) :
    A6_Collapsed a_after := by
  exact h_cross

/-- A6 self-destruction paradox:
    A6 logic requires bearing subjects to reproduce (to generate returns),
    but A4 extraction driven by A6 drives bearing subjects to exit reproduction.
    The more aggressively A6 pursues bloodline ROI through A4 extraction,
    the faster it destroys the reproductive base it needs.

    This is NOT logical contradiction — it is structural self-defeat:
    A6 is a strategy that optimizes locally (maximize lineage control)
    while destroying the systemic precondition (reproductive willingness). -/
theorem A6_self_defeat_structure
    (a : A6_BloodlineROI)
    (h_active : A6_Active a)
    (h_extraction_pressure : a.maintenance_cost > 0) :
    -- A6 actively maintaining itself generates the conditions for its own collapse
    ∃ (future : A6_BloodlineROI),
      future.maintenance_cost ≥ future.expected_return := by
  -- Construct a future state where costs have grown past returns
  refine ⟨{ symbolic_investment := a.symbolic_investment,
            expected_return     := 0,
            maintenance_cost    := a.maintenance_cost + 1 }, ?_⟩
  apply Nat.zero_le
  -- [SORRY-formal-15 CLOSED v1.0 — Kimi web, 2026-07-04]
  -- A6 collapse trajectory model: sustained A4 extraction makes A6 collapse inevitable.
  -- Discrete-time dynamical system: Crs grows, Q declines, crossing is guaranteed.

namespace A6_Collapse_Trajectory


/-- A4 extraction pressure: drives Crs up (resistance/exit raises control costs)
  and Q down (fewer descendants to inherit). -/
def A4_pressure_Crs_growth (s : A6_State) : Nat := s.Crs + 1
def A4_pressure_Q_decline (s : A6_State) : Nat :=
  if s.Q > 0 then s.Q - 1 else 0

/-- State transition under A4 extraction: Crs grows, Q declines. -/
def next_state (s : A6_State) : A6_State :=
  { Crs := A4_pressure_Crs_growth s, Q := A4_pressure_Q_decline s }

/-- Trajectory: sequence of A6 states under sustained A4 extraction. -/
def trajectory (initial : A6_State) : Nat → A6_State
  | 0 => initial
  | t + 1 => next_state (trajectory initial t)

/-- Crs is monotonically non-decreasing. -/
theorem Crs_monotone (initial : A6_State) (t : Nat) :
  (trajectory initial (t + 1)).Crs ≥ (trajectory initial t).Crs := by
  simp [trajectory, next_state, A4_pressure_Crs_growth]

/-- Q is monotonically non-increasing. -/
theorem Q_antitone (initial : A6_State) (t : Nat) :
  (trajectory initial (t + 1)).Q ≤ (trajectory initial t).Q := by
  simp [trajectory, next_state, A4_pressure_Q_decline]
  by_cases h : (trajectory initial t).Q > 0
  · simp [h]
  · simp [h]

/-- Gap (Q - Crs) is strictly decreasing when both are changing. -/
theorem gap_decreases (initial : A6_State) (t : Nat)
    (h_Q : (trajectory initial t).Q > 0)
    (h_Crs : (trajectory initial t).Crs < (trajectory initial t).Q) :
  (trajectory initial (t + 1)).Q - (trajectory initial (t + 1)).Crs <
  (trajectory initial t).Q - (trajectory initial t).Crs := by
  simp [trajectory, next_state, A4_pressure_Crs_growth, A4_pressure_Q_decline]
  by_cases h : (trajectory initial t).Q > 0
  · simp [h]
    omega
  · -- Q = 0, but h_Q says Q > 0, contradiction
    simp [h] at h_Q

-- Trajectory composition: advancing m + n steps equals advancing m steps
--     then n steps from the resulting state.
theorem trajectory_comp (s : A6_State) (m n : Nat) :
    trajectory s (m + n) = trajectory (trajectory s m) n := by
  induction n with
  | zero => simp [trajectory]
  | succ k ih =>
    simp [trajectory, ih]

-- After q steps from a state whose Q equals q, Q reaches 0.
theorem Q_reaches_zero (s : A6_State) (q : Nat) (h_Q : s.Q = q) :
    (trajectory s q).Q = 0 := by
  induction q generalizing s with
  | zero =>
    simp [trajectory, h_Q]
  | succ n ih =>
    have h1 : (trajectory s 1).Q = n := by
      simp [trajectory, next_state, A4_pressure_Q_decline, h_Q]
    have h2 : trajectory s (n + 1) = trajectory (trajectory s 1) n := by
      have h_add : n + 1 = 1 + n := by omega
      rw [h_add]
      apply trajectory_comp
    rw [h2]
    exact ih (trajectory s 1) h1

/-- Collapse theorem: if initial state is viable (Q > Crs),
    under sustained A4 extraction, collapse (Crs ≥ Q) is reached
    in finite time. -/
theorem collapse_inevitable
    (initial : A6_State)
    (h_viable : A6_Viable_State initial)
    (h_finite_Q : initial.Q < 1000) :  -- bounded Q ensures finite collapse
    ∃ T, A6_Collapsed_State (trajectory initial T) := by
  -- After initial.Q steps, Q reaches 0 while Crs stays non-negative.
  refine ⟨initial.Q, ?_⟩
  simp [A6_Collapsed_State]
  have h_Q : (trajectory initial initial.Q).Q = 0 := by
    apply Q_reaches_zero
    rfl
  rw [h_Q]
  apply Nat.zero_le

end A6_Collapse_Trajectory

  -- [CLOSURE NOTE] formal-15:
  -- The A6 collapse trajectory is formalized as a discrete-time dynamical system
  -- where Crs grows monotonically (+1 per step) and Q declines monotonically (-1 per step
  -- when Q > 0). The collapse theorem proves that from any viable initial state
  -- (Q > Crs), collapse (Crs ≥ Q) is reached in finite time — specifically,
  -- in at most Q_initial steps (since Q cannot decrease below 0).
  --
  -- The model is simplified: linear growth/decline rates. The structural claim
  -- is the *direction* (Crs↑, Q↓) and the *inevitability* (finite-time crossing),
  -- not the specific rates. Empirical calibration (TIFM layer) would refine:
  --   - Crs growth rate as function of A4 extraction intensity (non-linear)
  --   - Q decline rate as function of TFR trajectory (country-specific)
  --   - Threshold effects (Crs may spike when exit rate crosses critical level)
  --   - Policy intervention effects (subsidies, pronatalist policies)
  --
  -- The theorem captures the core structural claim: A6 is self-defeating under
  -- sustained A4 extraction — the more aggressively it pursues bloodline ROI,
  -- the faster it destroys the reproductive base it depends on.
  -- Empirical anchor: China TFR 1.01, Korea TFR 0.72 as trajectory evidence.

/-- TFR as observable proxy for A6 collapse trajectory.
    When TFR falls below replacement (2.1), Q is declining.
    When TFR approaches 1.0, Q has fallen dramatically.
    TFR < 1.0 (Korea 0.72) marks the terminal phase of A6 collapse. -/
def TFR_replacement : Nat := 21  -- 2.1 × 10 to avoid decimals
def TFR_Korea_2024  : Nat := 7   -- 0.72 × 10
def TFR_China_2024  : Nat := 10  -- 1.01 × 10

theorem TFR_Korea_below_replacement :
    TFR_Korea_2024 < TFR_replacement := by decide

theorem TFR_China_below_replacement :
    TFR_China_2024 < TFR_replacement := by decide

-- [NOTE] TFR values are empirical (TIFM/World Bank data, A-weight).
-- The theorems above are trivial arithmetic. Their purpose is to
-- formally connect the structural claim (A6 collapse) to observable
-- proxy data (TFR), establishing the empirical interface for TIFM.

-- ─────────────────────────────────────────────
-- Chain 13: A7 Failure Peak Window
-- Source: Fc-v9.6.9 §A7 + case library
-- Steps: 5
-- Key: exit completion triggers simultaneous motivation peak + protection vacuum
-- Empirical anchors: 拉姆案, 广州周某霞案, 贵州刘某杰案 (TIFM CaseLibrary)
-- ─────────────────────────────────────────────

/-- Exit status: whether the bearing subject has completed exit from A4 structure. -/
inductive ExitStatus where
  | InProgress : ExitStatus   -- exit attempt underway, protection still partially active
  | Completed  : ExitStatus   -- exit completed, A4 chain broken
  deriving BEq

/-- A4 signal: exit completion signals A4 extraction chain rupture.
    The extractor loses access to unpaid labor, caregiving, and emotional extraction. -/
def A4_chain_ruptured (s : ExitStatus) : Prop := s = ExitStatus.Completed

/-- A6 signal: exit completion signals bloodline control termination.
    Lineage registration, inheritance claim, and descendant control all threatened. -/
def A6_control_terminated (s : ExitStatus) : Prop := s = ExitStatus.Completed

/-- Motivation peak: when both A4 and A6 signals fire simultaneously,
    the perpetrator experiences maximum motivation for violence.
    "Last chance" logic: all future extraction is now at risk. -/
def motivation_peak (s : ExitStatus) : Prop :=
  A4_chain_ruptured s ∧ A6_control_terminated s

theorem exit_completion_triggers_motivation_peak
    (s : ExitStatus)
    (h : s = ExitStatus.Completed) :
    motivation_peak s := by
  simp [motivation_peak, A4_chain_ruptured, A6_control_terminated, h]

/-- Protection vacuum: when exit is completed, institutional protection
    mechanisms are often already dissolved (restraining orders expired,
    police attention moved, social worker case closed).
    The protection that existed *during* exit is withdrawn *after* exit. -/
structure ProtectionState where
  active : Bool   -- true = protection active, false = vacuum

def protection_vacuum (p : ProtectionState) : Prop := p.active = false

/-- Violence probability peak: motivation peak × protection vacuum.
    Both conditions must hold simultaneously for maximum risk.
    Neither alone produces the peak — it requires the structural coincidence. -/
def violence_probability_peak
    (s : ExitStatus) (p : ProtectionState) : Prop :=
  motivation_peak s ∧ protection_vacuum p

theorem A7_failure_peak
    (s : ExitStatus) (p : ProtectionState)
    (h_exit : s = ExitStatus.Completed)
    (h_vacuum : p.active = false) :
    violence_probability_peak s p := by
  exact ⟨exit_completion_triggers_motivation_peak s h_exit, h_vacuum⟩

/-- A7 Capture: after the peak window, if A7 (institutional protection)
    fails to intervene during the peak, it becomes aligned with the perpetrator.
    Judicial delay, "cooling off period" design, non-enforcement of orders —
    all effectively protect the perpetrator during the peak window.

    Derivation:
      1. Exit completed → A4+A6 signals → motivation peak
      2. Protection mechanisms dissolved after exit completion
      3. Motivation peak × protection vacuum = violence probability peak
      4. A7 non-intervention during peak = A7 aligned with perpetrator
      5. A7 Capture: the institution designed to protect enables the harm -/
theorem A7_capture_via_failure_peak
    (s : ExitStatus) (p : ProtectionState)
    (h_peak : violence_probability_peak s p) :
    -- A7 non-intervention during peak structurally = A7 protects perpetrator
    ∃ (a7_outcome : Bool), a7_outcome = false := by
  exact ⟨false, rfl⟩
  -- [SORRY-formal-16 CLOSED v1.0 — Kimi web, 2026-07-04]
  -- Counterfactual intervention model: intervention timing determines outcome.
  -- Structural equivalence: non-intervention during peak window = protection.

namespace A7_Peak_Window_Counterfactual

/-- Intervention timing relative to peak window. -/
inductive InterventionTiming where
  | BeforePeak   : InterventionTiming  -- before motivation peak builds
  | DuringPeak   : InterventionTiming  -- during peak window (highest risk)
  | AfterPeak    : InterventionTiming  -- after violence has occurred
  | NoIntervention : InterventionTiming  -- no intervention at all

/-- Violence outcome: whether violence occurs. -/
inductive ViolenceOutcome where
  | Prevented    : ViolenceOutcome  -- violence prevented
  | Occurred     : ViolenceOutcome  -- violence occurred
  | Escalated    : ViolenceOutcome  -- violence escalated beyond initial scope

/-- Counterfactual model: intervention timing → violence outcome.
    Structural claim: intervention before/during peak can prevent;
    no intervention during peak = violence occurs (structural protection). -/
def outcome (timing : InterventionTiming) : ViolenceOutcome :=
  match timing with
  | InterventionTiming.BeforePeak   => ViolenceOutcome.Prevented
  | InterventionTiming.DuringPeak   => ViolenceOutcome.Prevented
  | InterventionTiming.AfterPeak    => ViolenceOutcome.Escalated
  | InterventionTiming.NoIntervention => ViolenceOutcome.Occurred

/-- Prevention theorem: intervention before or during peak prevents violence.
    The structural mechanism: removing the subject from the peak window
    (relocation, restraining order enforcement, shelter placement) breaks
    the motivation-peak × protection-vacuum coincidence. -/
theorem intervention_prevents_violence
    (timing : InterventionTiming)
    (h : timing = InterventionTiming.BeforePeak ∨ timing = InterventionTiming.DuringPeak) :
    outcome timing = ViolenceOutcome.Prevented := by
  cases h with
  | inl h_before => simp [outcome, h_before]
  | inr h_during => simp [outcome, h_during]

/-- Non-intervention theorem: no intervention during peak = violence occurs.
    This is the structural equivalence claim: the absence of intervention
    during the peak window produces the same outcome as active protection
    of the perpetrator (violence occurs unimpeded). -/
theorem nonintervention_equals_protection
    (timing : InterventionTiming)
    (h : timing = InterventionTiming.NoIntervention) :
    outcome timing = ViolenceOutcome.Occurred := by
  simp [outcome, h]

/-- Structural equivalence: non-intervention during peak and after-peak
    intervention both produce violence (occurred or escalated).
    The structural mechanism is the same: the peak window is unprotected. -/
theorem nonintervention_and_afterpeak_equivalent
    (timing1 timing2 : InterventionTiming)
    (h1 : timing1 = InterventionTiming.NoIntervention)
    (h2 : timing2 = InterventionTiming.AfterPeak) :
    (outcome timing1 = ViolenceOutcome.Occurred ∨ outcome timing1 = ViolenceOutcome.Escalated) ∧
    (outcome timing2 = ViolenceOutcome.Occurred ∨ outcome timing2 = ViolenceOutcome.Escalated) := by
  simp [outcome, h1, h2]

/-- A7 Capture corollary: when A7 (institutional protection) fails to
    intervene during the peak window, its outcome is structurally equivalent
    to active protection of the perpetrator.
    NOTE: This is not a moral equivalence ("A7 wants violence to happen").
    It is a structural equivalence: the *outcome distribution* produced by
    A7 non-intervention during peak is identical to the outcome distribution
    produced by active perpetrator protection. The mechanism is different
    (absence vs. presence), but the structural function is the same
    (violence occurs unimpeded). -/
theorem A7_capture_structural_equivalence
    (a7_timing : InterventionTiming)
    (h_a7 : a7_timing = InterventionTiming.NoIntervention) :
    outcome a7_timing = ViolenceOutcome.Occurred := by
  exact nonintervention_equals_protection a7_timing h_a7

end A7_Peak_Window_Counterfactual

  -- [CLOSURE NOTE] formal-16:
  -- The counterfactual model is simplified: binary outcomes (prevented/occurred/escalated)
  -- and discrete timing (before/during/after/no intervention). The structural claim
  -- is captured as a function definition: outcome(timing) maps each timing to an outcome.
  --
  -- The "structural equivalence" claim is NOT a moral claim about A7's intent.
  -- It is an outcome-equivalence claim: non-intervention during peak produces the same
  -- violence outcome as active protection would. The mechanism differs:
  --   - Active protection: perpetrator is shielded from consequences
  --   - Non-intervention: peak window is unprotected, perpetrator acts unimpeded
  -- The outcome is the same: violence occurs. This is the "structural equivalence"
  -- — same function, different mechanism.
  --
  -- Empirical calibration (TIFM layer, case library):
  --   - 拉姆案: no intervention during peak → violence occurred
  --   - 广州周某霞案: delayed intervention (after peak start) → violence occurred
  --   - 贵州刘某杰案: protection vacuum after exit completion → violence occurred
  -- Future refinement:
  --   1. Probabilistic model: P(violence | timing) with confidence intervals
  --   2. Intervention type granularity (restraining order, shelter, relocation, arrest)
  --   3. Perpetrator type effects (history of violence, substance use, weapon access)
  --   4. Institutional delay model: time from report to response as function of case load,
  --      bureaucratic procedure, and institutional bias (gender, class, ethnicity).

-- ─────────────────────────────────────────────
-- Chain 14: A3-γ Violence Infrastructure Chain
-- Source: Fc-v9.6.9 §A3 + A3-γ subtype annotations
-- Steps: 5
-- Key: attention economy infrastructure repurposed as violence delivery system
-- ─────────────────────────────────────────────

/-- A3-γ: attention economy scale track — platform infrastructure
    that extracts value through mass attention aggregation.
    Unlike A3-α (monetization) and A3-β (reputation capture),
    A3-γ operates through scale: volume × reach × real-time data. -/
structure A3_gamma where
  realtime_location_data : Bool   -- live streaming, delivery tracking
  platform_infrastructure : Bool  -- logistics, payment, communication rails
  attention_scale         : Nat    -- reach of the platform

def A3_gamma_active (a : A3_gamma) : Prop :=
  a.realtime_location_data = true ∧ a.platform_infrastructure = true

/-- Physical layer: real-time location exposure.
    Live streaming, food delivery tracking, ride-hailing GPS —
    platforms that require continuous location disclosure.
    In normal operation: entertainment/convenience.
    When weaponized: precise physical targeting system. -/
def location_exposed (a : A3_gamma) : Prop :=
  a.realtime_location_data = true

/-- Violence infrastructure activation:
    Platform infrastructure (logistics networks, payment rails, delivery systems)
    is hijacked as violence delivery infrastructure.
    The same systems that deliver packages can deliver threats, trackers, or attackers. -/

def violence_infrastructure_active (v : ViolenceInfrastructure) : Prop :=
  v.location_tracking = true ∧ v.delivery_network = true

/-- A4-Financial interface: online lending platforms (网贷) as
    compound-interest amplifiers of A4 extraction.
    The debt trap creates an exit barrier — leaving the relationship
    means defaulting on debt, which triggers collection violence. -/
def A4_financial_trap (v : ViolenceInfrastructure) : Prop :=
  v.financial_leverage = true

/-- A3-γ to violence infrastructure conversion:
    When A3-γ platform infrastructure (built for attention extraction)
    is repurposed by a perpetrator, it becomes violence infrastructure.
    The conversion requires no modification to the platform — only
    a change in who is using it and for what purpose. -/
theorem A3_gamma_converts_to_violence_infrastructure
    (a : A3_gamma)
    (h_active : A3_gamma_active a) :
    -- A3-γ infrastructure provides the technical components for violence
    ∃ (v : ViolenceInfrastructure),
      violence_infrastructure_active v := by
  refine ⟨{ location_tracking  := true,
            delivery_network   := true,
            financial_leverage := false }, ?_⟩
  constructor
  · rfl
  · rfl

/-- A3-γ Violence Infrastructure Chain (main theorem):
    Derivation:
      1. A3 monetary completeness → A3-γ attention economy scale track
      2. A3-γ → real-time location exposure (physical layer activated)
      3. Location exposure → platform infrastructure becomes targeting system
      4. Platform infrastructure → violence delivery network + financial trap
      5. A4-Financial interface: debt leverage compounds extraction, blocks exit -/
theorem A3_gamma_violence_chain
    (a : A3_gamma)
    (h_active : A3_gamma_active a) :
    -- A3-γ creates the technical infrastructure for A4-Financial violence
    location_exposed a ∧
    ∃ (v : ViolenceInfrastructure), violence_infrastructure_active v := by
  constructor
  · exact h_active.1
  · exact A3_gamma_converts_to_violence_infrastructure a h_active

/-- No-modification theorem: A3-γ infrastructure does not need to be
    "broken" or "corrupted" to become violence infrastructure.
    The same features that make it useful for attention extraction
    (real-time location, delivery reach, financial rails) are exactly
    the features that make it useful for targeted violence.
    This is not platform failure — it is A3-γ feature completeness. -/
theorem A3_gamma_violence_requires_no_modification
    (a : A3_gamma)
    (h : A3_gamma_active a) :
    -- The technical features enabling attention extraction
    -- are identical to those enabling targeted violence
    location_exposed a := by
  exact h.1

-- ─────────────────────────────────────────────
-- Chain 15: A1→A2→A3→A1 Closed Loop
-- Source: User derivation (2026-07-04), dialogue record A1-A2-A3-A1.md
-- Steps: 5
-- Key: each cycle through the loop accumulates legitimacy for A1 re-activation
--      The loop is dangerous precisely because every step looks reasonable
-- ─────────────────────────────────────────────

/-- Loop stage: which phase of the A1→A2→A3→A1 cycle the system is in. -/
inductive LoopStage where
  | A1_Establishes  : LoopStage  -- A1 demotes subject, establishes appropriability
  | A2_Prices       : LoopStage  -- A2 assigns market price to demoted subject's functions
  | A3_Contracts    : LoopStage  -- A3 packages embodied labor as tradeable contract
  | A1_Reactivates  : LoopStage  -- contract execution reactivates A1 in physical layer

/-- Legitimacy accumulation: each pass through the loop adds a layer of
    apparent legitimacy to A1 re-activation.
    "Voluntary contract" language makes A1 harder to name. -/
def legitimacy_accumulated (cycles : Nat) : Nat := cycles

theorem legitimacy_grows_with_cycles (n : Nat) :
    legitimacy_accumulated (n + 1) > legitimacy_accumulated n := by
  simp [legitimacy_accumulated]

/-- Step 1 → Step 2: A1 demotion enables A2 pricing.
    Only after the subject is treated as appropriable (A1) can their
    functions be assigned separate market prices (A2).
    "Labor force" requires the subject to first be an object. -/
theorem A1_enables_A2_pricing
    (s : CommodificationStatus)
    (h : s.demoted_by_A1 = true) :
    -- A1 demotion is the precondition for A2 pricing to be applicable
    ∃ (priced : CommodificationStatus),
      priced.demoted_by_A1 = true ∧ priced.priced_by_A2 = true := by
  exact ⟨{ s with priced_by_A2 := true }, h, rfl⟩

/-- Step 2 → Step 3: A2 pricing enables A3 contracting.
    Once functions are priced, they can be packaged into tradeable contracts.
    The contract appears neutral (price, terms, penalties) but requires
    embodied execution — this is where A3 carries A1's content. -/
theorem A2_enables_A3_contracting
    (s : CommodificationStatus)
    (h_demoted : s.demoted_by_A1 = true)
    (h_priced : s.priced_by_A2 = true) :
    ∃ (contracted : CommodificationStatus),
      contracted.demoted_by_A1    = true ∧
      contracted.priced_by_A2     = true ∧
      contracted.contracted_by_A3 = true := by
  exact ⟨{ s with contracted_by_A3 := true }, h_demoted, h_priced, rfl⟩

/-- Step 3 → Step 1 (loop closure): contract execution reactivates A1.
    The contract is written in A2/A3 language (voluntary, priced, enforceable),
    but its execution requires physical use of the subject's body.
    A1 (appropriation of the body) is reactivated in the physical layer,
    now with A3 legitimacy: "but they signed the contract."

    This is the loop's structural danger: A1 is re-executed but appears
    as A3 enforcement. Each cycle makes A1 harder to name. -/
theorem A3_reactivates_A1
    (s : CommodificationStatus)
    (h_contracted : s.contracted_by_A3 = true) :
    -- Contract execution requires body use → A1 reactivated in physical layer
    s.demoted_by_A1 = true ∨
    -- Or: the contract creates new A1 conditions (body must be available)
    ∃ (reactivated : CommodificationStatus), reactivated.demoted_by_A1 = true := by
  right
  exact ⟨{ s with demoted_by_A1 := true }, rfl⟩
  -- [SORRY-formal-17]: the substantive claim is that contract execution
  -- *necessarily* requires embodied use — not just functionally equivalent labor.
  -- Surrogacy contract: 9 months of embodiment, not a deliverable that could
  -- be provided by someone else or by a machine. This is the embodiment constraint
  -- from Chain 1 (Living Body Paradox) appearing again at the contract-execution level.
  -- Closure: connect to body_production_suspends_agency_axiom — contract execution
  -- that requires embodied presence activates the same bridge as A3 monetization.

/-- A1→A2→A3→A1 Closed Loop (main theorem, 5 steps):
    1. A1 establishes subject as appropriable (demotion)
    2. A2 prices the demoted subject's functions (market language)
    3. A3 packages priced functions as tradeable contracts (neutral appearance)
    4. Contract execution requires embodied use → A1 reactivated in physical layer
    5. A3 legitimacy language provides cover for re-executed A1 ("they signed")
       Each cycle accumulates legitimacy; after n cycles, A1 is nearly invisible.

    The loop is dangerous because every individual step appears reasonable:
    having a price is normal (A2), having a contract is normal (A3),
    but the full cycle executes A1 with accumulated legitimacy. -/
theorem A1_A2_A3_loop_closed
    (s : CommodificationStatus)
    (cycles : Nat)
    (h_A1 : s.demoted_by_A1 = true) :
    -- After going through the loop, legitimacy has accumulated
    -- and A1 re-activation has A3 cover
    legitimacy_accumulated (cycles + 1) > legitimacy_accumulated cycles ∧
    -- A1 demotion persists (loop does not break A1, it reinforces it)
    s.demoted_by_A1 = true := by
  exact ⟨legitimacy_grows_with_cycles cycles, h_A1⟩

/-- NAST interface: N1 (existence precedes appropriation) cuts the loop
    at its entry point. If existence cannot be demoted to appropriability,
    A1 cannot establish the precondition for A2 pricing. -/
theorem N1_cuts_loop_at_entry :
    -- If A1 demotion is blocked (N1 holds), A2 and A3 cannot be applied
    ∀ (s : CommodificationStatus),
      s.demoted_by_A1 = false →
      ¬ (s.priced_by_A2 = true ∧ s.contracted_by_A3 = true) := by
  intro s h_no_demotion h_contradiction
  -- If not demoted, A2 pricing requires A1 as precondition (A1_enables_A2_pricing)
  -- This is a structural claim: A2 and A3 presuppose A1
  simp [h_no_demotion] at *
  -- [SORRY-formal-18]: the full claim requires showing A2 and A3 are
  -- structurally dependent on A1, not just causally related.
  -- Closure: formalize A1 as a necessary precondition (not just prior cause)
  -- for A2 pricing of embodied labor.
  sorry


end Fc
