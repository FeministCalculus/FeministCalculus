-- FcCore: shared foundational types and simple definitions
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
  bears_Cb : Bool
  bears_Cc : Bool
  bears_Ce : Bool

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


def P0_CostBenefitSeparation : Prop := True
abbrev ExtractionRate := Nat
abbrev RecoveryRate := Nat

abbrev Threshold := Nat

/-- SystemState with hysteresis: once S2, always S2.
    has_been_S2 captures path dependence.
    [SORRY-formal-2 CLOSED]: stateful model replacing pure function. -/
structure SystemState where
  current     : Bool
  has_been_S2 : Bool

def SystemState.S1 : SystemState := { current := false, has_been_S2 := false }
def SystemState.S2 : SystemState := { current := true,  has_been_S2 := true  }

structure Advantage where
  depends_on_asymmetry : Bool

def SymmetrizationMechanism := True
def BlockingSubsystem := True

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

/-- Transitional: F9 partially satisfied — A4 partially weakened at institutional layer. -/
def A4_Transitional (c : A4_FailureConditions) : Prop :=
  (¬F9_ThreeConditions c) ∧ (¬A4_FullyOperational c)

/-- Degenerate: θ_low alone without F9 — culturally weakened but no institutional structure.
    No structural significance: θ reduction without institutional support is unstable. -/
def A4_Degenerate (c : A4_FailureConditions) : Prop :=
  c.theta_low = true ∧ ¬F9_ThreeConditions c

/-- Independent organization: the prerequisite for beneficiaries
    to function as negotiating subjects. -/
structure OrganizationPrerequisite where
  org_exists : Bool
  -- BET-HIDDEN-1 distinction:
  was_erased : Bool  -- true = A7-OE actively destroyed it
                     -- false = never formed (different reversal difficulty)

def OrgPrereq_Present (o : OrganizationPrerequisite) : Prop :=
  o.org_exists = true

def OrgPrereq_Erased (o : OrganizationPrerequisite) : Prop :=
  o.org_exists = false ∧ o.was_erased = true

def OrgPrereq_Absent (o : OrganizationPrerequisite) : Prop :=
  o.org_exists = false ∧ o.was_erased = false

/-- A7-OE (active erasure type): institution actively destroys
    the prerequisite for independent organization.
    Distinct from A7-passive (merely maintaining extraction without erasure). -/
def A7_OE_Active (o : OrganizationPrerequisite) : Prop :=
  o.was_erased = true

/-- Reversal cost: the institutional effort required to restore a prerequisite
    from a given state. Cost is measured in "institutional energy units" (abstract). -/
abbrev ReversalCost := Nat

/-- Marginal cost of extraction for the extractor:
    When costs are transferred to the bearing subject (A4),
    the extractor's marginal cost tends to zero. -/
abbrev MarginalCostToExtractor := Nat

/-- A5 recognition demand: the extractor's need for external recognition
    does not exhibit diminishing marginal utility — more recognition
    generates more need, not satiation. -/
structure A5_RecognitionDemand where
  current_level    : Nat
  marginal_utility : Nat  -- utility of one more unit of recognition


/-- Positional good: value depends on relative standing, not absolute level.
    The reference point updates with each unit of recognition received. -/
structure PositionalGood where
  current_level    : Nat
  reference_point  : Nat  -- the baseline that "feels like zero"

/-- A7's design goal: maintain the absorption layer's stability.
    A7 is not primarily a "violent institution" — its function is to ensure
    the bearing subject cannot exit the extraction structure.
    Exit = externalities return to extractor → system destabilizes. -/
structure A7_InstitutionalBehavior where
  blocks_exit          : Bool   -- true = prevents subject from exiting
  is_nonaction         : Bool   -- "non-action" (failing to protect)
  is_active_complicity : Bool   -- "active complicity" (aiding extractor)

def A7_DesignGoal (b : A7_InstitutionalBehavior) : Prop :=
  b.blocks_exit = true


/-- A7-Capture effectiveness:
    When the extractor's violence is directionally aligned with A7's
    institutional tendency (both seek to block exit), A7 is effectively
    captured — the institution works in the extractor's favor without
    requiring explicit coordination. -/
structure A7_Capture where
  extractor_violence_direction : Bool   -- true = targets exit-seeking subject
  A7_institutional_tendency    : Bool   -- true = blocks exit

def A7_Capture_Effective (cap : A7_Capture) : Prop :=
  cap.extractor_violence_direction = true ∧
  cap.A7_institutional_tendency    = true

/-- Care burden: hours of unpaid care labor borne by the subject.
    Determined by opportunity cost — lower income → lower opportunity cost
    of care → more care taken on. -/
structure CareBurden where
  hours      : Nat
  income     : Nat   -- income level of care-bearer


/-- Labor market performance proxy: observable output used by employers
    to update statistical discrimination. -/
structure LaborPerformance where
  observable_output : Nat
  care_hours        : Nat   -- care hours crowd out labor market hours


/-- Option set: the choices available to a subject at decision time. -/
structure OptionSet where
  options        : Nat     -- number of available options
  filtered_by_A2 : Bool  -- true = A2 has pre-reduced the option set


namespace InstitutionalEvolution

/-- Institution type at time t: whether it has exit-blocking behavior. -/
def InstitutionType := Bool  -- true = has A7-like exit-blocking, false = no exit-blocking

end InstitutionalEvolution

namespace A8_Distinguishability

/-- External auditor's perspective: knows the full option set and the
    filtering ratio, can compare the presented set to the full set. -/
structure AuditorPerspective where
  full_set        : OptionSet
  filtered_set    : OptionSet
  filter_ratio    : Nat
  filter_active   : Bool  -- true = filtering occurred


def Fc_audit_enabled (subject_knows_filtering : Bool) : Prop :=
  subject_knows_filtering = true

end A8_Distinguishability

namespace A6_Collapse_Trajectory

/-- A6 state at time t: maintenance cost (Crs) and expected return (Q). -/
structure A6_State where
  Crs : Nat  -- bloodline maintenance cost
  Q   : Nat  -- expected return on lineage investment

/-- A6 viability at time t: Q > Crs. -/
def A6_Viable_State (s : A6_State) : Prop := s.Q > s.Crs

/-- A6 collapsed at time t: Crs ≥ Q. -/
def A6_Collapsed_State (s : A6_State) : Prop := s.Crs ≥ s.Q

end A6_Collapse_Trajectory

structure ViolenceInfrastructure where
  location_tracking  : Bool   -- can locate target in real time
  delivery_network   : Bool   -- can reach target physically
  financial_leverage : Bool   -- can trap target through debt (A4-Financial)

/-- Commodification status: whether a subject has been reduced to a
    market-exchangeable object in a given institutional context. -/
structure CommodificationStatus where
  demoted_by_A1   : Bool   -- A1 has established the subject as appropriable
  priced_by_A2    : Bool   -- A2 has assigned a market price to their functions
  contracted_by_A3 : Bool  -- A3 has packaged their embodied labor as a contract


end Fc
