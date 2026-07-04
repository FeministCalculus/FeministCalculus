-- Fc Framework: Formal Derivation Chains
-- Lean 4
-- Only chains with ≥3 steps are formalized here.
-- Natural language source: Fc-v9.6.9-REVISED-Core.md
--
-- Convention:
--   `sorry` = [SORRY] in Fc notation — gap identified, proof pending
--   Propositions are structural claims, not empirical ones.
--   Empirical grounding lives in TIFM, not here.

namespace Fc

-- ─────────────────────────────────────────────
-- G' Layer: Descriptive Ground (no normative force)
-- ─────────────────────────────────────────────

/-- G1': Humans are a social species. -/
axiom G1_social : True

/-- G2': Species continuity depends on reproductive labor (Cb/Cc/Ce). -/
axiom G2_reproduction_required : True

/-- G3': Social institutions are human constructs. -/
axiom G3_institutions_constructed : True

-- ─────────────────────────────────────────────
-- Core types
-- ─────────────────────────────────────────────

/-- A subject whose body bears the material costs of reproductive cycles. -/
structure BearingSubject where
  bears_Cb : Bool  -- biological cost
  bears_Cc : Bool  -- care cost
  bears_Ce : Bool  -- emotional cost

/-- Monetary exchange claim: that reproductive labor has a monetary equivalent. -/
def MonetaryClaim := True

/-- Embodiment constraint: reproductive labor is inseparable from the body performing it. -/
def EmbodimentConstraint := True

/-- Agency: subject's decision rights over their own body, will, and space. -/
structure Agency where
  body_self_determined : Bool
  will_self_determined : Bool
  space_self_determined : Bool

def AgencyIntact (a : Agency) : Prop :=
  a.body_self_determined = true ∧
  a.will_self_determined = true ∧
  a.space_self_determined = true

/-- A1: Ontological demotion — subject's agency is institutionally suspended. -/
def A1_Demoted (a : Agency) : Prop :=
  a.body_self_determined = false ∨
  a.will_self_determined = false ∨
  a.space_self_determined = false

-- ─────────────────────────────────────────────
-- Chain 1: Living Body Paradox (A3 → A1)
-- Source: Fc-v9.6.9 §A3 + Key Derivation
-- Steps: 4
-- ─────────────────────────────────────────────

/-- A3 monetary completeness claim: reproductive labor can be monetized. -/
def A3_MonetaryCompleteness : Prop := MonetaryClaim

/-- Embodiment fact: monetizing reproductive labor requires including the body
    in the production function (because labor is inseparable from the body). -/
def monetization_requires_body_inclusion : A3_MonetaryCompleteness → EmbodimentConstraint → Prop :=
  fun _ _ => True  -- structural claim, not contingent

/-- Including the body in the production function suspends the subject's
    self-determination over their body dimension. -/
theorem body_inclusion_suspends_body_agency
    (a : Agency)
    (h : a.body_self_determined = true) :
    -- Including body in production function → body no longer self-determined
    (a.body_self_determined = false) ∨ A1_Demoted a := by
  right
  -- Body dimension suspension is what A1 body-dimension means
  sorry  -- [SORRY-formal-1]: requires axiom linking "inclusion in production function"
         -- to "suspension of self-determination". Not derivable from types alone —
         -- needs explicit bridge axiom. Closure: add axiom body_production_iff_unselfdet.

/-- Living Body Paradox (main theorem):
    A3 monetary completeness, when applied to embodied reproductive labor,
    structurally produces A1 ontological demotion (body dimension).

    Derivation:
      1. A3: reproductive labor has monetary equivalent           [premise]
      2. Embodiment: reproductive labor is inseparable from body  [physical fact]
      3. Therefore: monetizing requires including body in production function
      4. Including body in production function = suspending body-agency (A1)
      5. Therefore: A3 applied to embodied labor → A1             [conclusion]
-/
theorem living_body_paradox
    (a : Agency)
    (_ : A3_MonetaryCompleteness)
    (_ : EmbodimentConstraint)
    (h_intact : AgencyIntact a) :
    A1_Demoted a := by
  -- Step 3-4 require the bridge axiom flagged in SORRY-formal-1
  sorry  -- [SORRY-formal-1]: bridge axiom pending

-- ─────────────────────────────────────────────
-- Chain 2: P0 → D1 → D2 (Extraction → Irreversibility)
-- Source: Fc-v9.6.9 §Physical axioms
-- Steps: 3
-- ─────────────────────────────────────────────

/-- P0: Cost-benefit separation in reproductive cycles.
    Cost-bearing nodes and benefit-receiving nodes are structurally separated. -/
def P0_CostBenefitSeparation : Prop := True

/-- Extraction rate: rate at which non-bearing nodes appropriate
    reproductive outputs without equivalent return. -/
def ExtractionRate := ℕ

/-- Recovery rate: natural recovery capacity of the bearing subject. -/
def RecoveryRate := ℕ

/-- D1: When extraction rate exceeds recovery rate,
    cumulative recovery enters a declining trend. -/
theorem D1_extraction_exceeds_recovery
    (e r : ℕ)
    (h : e > r) :
    -- Cumulative recovery trend is declining
    -- (modeled here as: net recovery per cycle is negative)
    e - r > 0 := by
  omega

/-- D2 setup: Recovery has a physical threshold θ.
    When recovery falls to or below θ, the system crosses
    from recoverable state S1 to unrecoverable state S2. -/
def Threshold := ℕ

inductive SystemState where
  | S1 : SystemState  -- recoverable
  | S2 : SystemState  -- unrecoverable

def crosses_threshold (recovery : ℕ) (θ : Threshold) : SystemState :=
  if recovery ≤ θ then SystemState.S2 else SystemState.S1

/-- D2 irreversibility: once in S2, the crossing is a topological bifurcation,
    not a gradient — it cannot be reversed by simply reducing extraction. -/
theorem D2_irreversibility
    (recovery : ℕ) (θ : Threshold)
    (h : crosses_threshold recovery θ = SystemState.S2) :
    -- The system is in S2 regardless of subsequent extraction reduction
    crosses_threshold recovery θ = SystemState.S2 := by
  exact h
  -- Note: this is trivially true by definition.
  -- [SORRY-formal-2]: the substantive claim is that even if recovery increases
  -- back above θ, S2 persists (hysteresis / path dependence).
  -- This requires a stateful model, not a pure function.
  -- Closure: model SystemState as carrying history, add hysteresis axiom.

-- ─────────────────────────────────────────────
-- Chain 3: Asymmetry Maintenance Theorem
-- Source: Fc-v9.6.9 §Asymmetry Maintenance Theorem (CLAUDE.md)
-- Steps: 3
-- ─────────────────────────────────────────────

/-- An advantage S that depends on asymmetry Δ. -/
structure Advantage where
  depends_on_asymmetry : Bool

/-- A symmetrization mechanism M that could eliminate Δ. -/
def SymmetrizationMechanism := True

/-- A blocking subsystem B that prevents M from operating. -/
def BlockingSubsystem := True

/-- If S depends on Δ, and M would eliminate Δ (collapsing S),
    then S must contain B to block M. -/
theorem asymmetry_maintenance
    (s : Advantage)
    (h : s.depends_on_asymmetry = true) :
    -- S structurally requires a blocking subsystem
    ∃ _ : BlockingSubsystem, True := by
  exact ⟨True.intro, trivial⟩
  -- [SORRY-formal-3]: this proves existence trivially (any True witnesses).
  -- The substantive claim is that B is *necessary* and *internal* to S,
  -- not just that some B exists somewhere.
  -- Closure: reformulate as: ¬∃ stable S without B, given active M.

-- ─────────────────────────────────────────────
-- Chain 4: SCA — Supply Chain Attack on Analysis Frameworks
-- Source: Fc-v9.6.9 §SCA (Supply Chain Attack on feminist analysis)
-- Steps: 5
-- Key distinction: selection pressure, not conspiracy
-- ─────────────────────────────────────────────

/-- A naming capacity: the ability to name extraction structure Cb
    in a way that can propagate through institutional channels. -/
def NamingCapacity := Bool

/-- A framework F has naming capacity if it can name the extraction structure. -/
def names_extraction (capacity : NamingCapacity) : Prop := capacity = true

/-- An institution is an extraction beneficiary if it captures value
    from the extraction structure F names. -/
structure Institution where
  is_extraction_beneficiary : Bool
  controls_framework_selection : Bool

/-- Selection pressure (not conspiracy): an institution that benefits from
    extraction will, through normal operation, differentially amplify
    frameworks that do not name it as defendant. No coordination required. -/
def SelectionPressure (inst : Institution) : Prop :=
  inst.is_extraction_beneficiary = true →
  inst.controls_framework_selection = true

/-- A framework is threatening to an institution if it names the institution
    as the extraction beneficiary (makes it the defendant). -/
def threatens_institution (capacity : NamingCapacity) (inst : Institution) : Prop :=
  names_extraction capacity ∧ inst.is_extraction_beneficiary = true

/-- SCA Step 1→2: If a framework names extraction, and the institution
    benefits from extraction, the framework threatens the institution. -/
theorem SCA_naming_threatens
    (capacity : NamingCapacity)
    (inst : Institution)
    (h_names : names_extraction capacity)
    (h_beneficiary : inst.is_extraction_beneficiary = true) :
    threatens_institution capacity inst := by
  exact ⟨h_names, h_beneficiary⟩

/-- SCA Step 2→3: Selection pressure is active when institution
    benefits from extraction and controls framework selection. -/
theorem SCA_selection_pressure_active
    (inst : Institution)
    (h_beneficiary : inst.is_extraction_beneficiary = true)
    (h_controls : inst.controls_framework_selection = true) :
    SelectionPressure inst := by
  intro _
  exact h_controls

/-- The result of selection pressure over time:
    threatening frameworks are suppressed (naming capacity → false),
    non-threatening frameworks are amplified. -/
def SCA_outcome (capacity : NamingCapacity) (inst : Institution)
    (pressure : SelectionPressure inst) : NamingCapacity :=
  -- Under selection pressure from a beneficiary institution,
  -- naming capacity is driven to false over time
  false
  -- [SORRY-formal-4]: this is asserted by definition, not derived.
  -- The substantive claim is that selection pressure *necessarily* produces
  -- this outcome over sufficient time — requires a temporal model.
  -- Closure: add axiom or model with time parameter showing
  -- lim(t→∞) NamingCapacity = false under active SelectionPressure.

/-- SCA Main Theorem:
    A framework that names extraction, operating within an institution
    that benefits from extraction and controls framework selection,
    will have its naming capacity eliminated through selection pressure.

    Derivation:
      1. Framework F names extraction structure (Name_K(Cb) ≠ ∅)
      2. Institution I benefits from extraction
      3. I controls which frameworks propagate
      4. Selection pressure (not conspiracy): I differentially suppresses F
      5. Over time: Name_K(Cb) → ∅
-/
theorem SCA_erasure
    (capacity : NamingCapacity)
    (inst : Institution)
    (h_names : names_extraction capacity)
    (h_beneficiary : inst.is_extraction_beneficiary = true)
    (h_controls : inst.controls_framework_selection = true) :
    -- The naming capacity is eliminated
    SCA_outcome capacity inst (SCA_selection_pressure_active inst h_beneficiary h_controls)
      = false := by
  rfl
  -- Trivially true by definition of SCA_outcome.
  -- [SORRY-formal-4] still applies: the definition asserts the outcome
  -- rather than deriving it from a temporal dynamics model.

/-- Key corollary: the people who removed the signpost end up standing
    where the signpost was, calling themselves by the same name.
    (Informal — captures why SCA is self-concealing.) -/
-- This corollary cannot be formalized without a model of identity
-- and institutional memory. Noted here as [SORRY-formal-5].
-- Closure: requires modeling agent identity across time steps.

-- ─────────────────────────────────────────────
-- Chain 5: A4 Configuration Topology
-- Source: Fc-v9.6.9 §A4 + Fc-Derived-008 §3
-- Steps: 5
-- Key: F9 three conditions are necessary but NOT sufficient;
--      θ (cultural internalization) is the fourth required condition.
-- Empirical anchor: Sweden 1995 daddy-month (Ekberg et al., JPubE 2013)
-- ─────────────────────────────────────────────

/-- A4: Structural extraction — the closed-loop unpaid appropriation
    of reproductive/sexual/emotional labor. -/
def A4_ExtractionActive := Bool

/-- The four conditions required for A4 to fully fail (all must hold). -/
structure A4_FailureConditions where
  collective_bargaining    : Bool  -- F9-1: economic dependency severed
  rights_based_institution : Bool  -- F9-2: care monopoly severed
  beneficiary_veto         : Bool  -- F9-3: decision rights restored
  theta_low                : Bool  -- A8-θ: cultural internalization weakened

/-- F9 three conditions: the first three of the four failure conditions.
    These are necessary but not sufficient to close A4. -/
def F9_ThreeConditions (c : A4_FailureConditions) : Prop :=
  c.collective_bargaining    = true ∧
  c.rights_based_institution = true ∧
  c.beneficiary_veto         = true

/-- A4 run configuration: all four conditions absent — A4 fully operational. -/
def A4_FullyOperational (c : A4_FailureConditions) : Prop :=
  c.collective_bargaining    = false ∧
  c.rights_based_institution = false ∧
  c.beneficiary_veto         = false ∧
  c.theta_low                = false

/-- A4 weakened configuration: F9 three conditions present, but θ still high.
    A4 fails at the formal institutional layer but persists at execution layer.
    Empirical: Sweden 1995 — fathers' formal leave-taking rose (54%→18% zero days),
    but MALESHARE (sick-child care share) showed no statistically significant change. -/
def A4_Weakened (c : A4_FailureConditions) : Prop :=
  c.collective_bargaining    = true ∧
  c.rights_based_institution = true ∧
  c.beneficiary_veto         = true ∧
  c.theta_low                = false  -- θ still high: A8 absorbs institutional compensation

/-- A4 failed configuration: all four conditions present. -/
def A4_Failed (c : A4_FailureConditions) : Prop :=
  c.collective_bargaining    = true ∧
  c.rights_based_institution = true ∧
  c.beneficiary_veto         = true ∧
  c.theta_low                = true

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
      theta_low                := false },  -- θ high: A8 absorbs compensation
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
  -- [SORRY-formal-6]: the three named configurations do not partition the full
  -- condition space — there are 2^4 = 16 possible combinations.
  -- The trichotomy (operational / weakened / failed) covers the analytically
  -- relevant cases but is not exhaustive.
  -- Closure: enumerate all 16 cases, show the three named ones are the
  -- structurally significant ones (others are transitional or degenerate).

end Fc
