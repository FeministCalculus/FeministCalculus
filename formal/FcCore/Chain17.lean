import FcCore.Types
import FcCore.Chains11to15

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 17: A-system reduction of non-A-system nodes
-- Source: User observation (indigenous stewardship / NAST interface) + Claude derivation
-- Steps: 3
-- Key: A-system nodes cannot output non-A1-demoted objects;
--      NAST N1 cuts the reduction entry point.
-- ─────────────────────────────────────────────

/-- Non-A-system node: cognitive framework based on stewardship rather than ownership.
    Typical cases: indigenous perspectives (stewardship theory / NAST), pre-commodified communities.
    Key feature: neither the self nor external entities are treated as appropriable objects. -/
structure NonASystemNode where
  stewardship_not_ownership : Bool
  -- true = cognitive framework is "steward" rather than "owner"
  -- Equivalent to: the node does not run the A1 ontological demotion operation

/-- A-system node: cognitive framework has A1 embedded — treats everything as
    appropriable / priced / contractible.
    Key feature: encountering any external expression, the output is necessarily an A1-demoted version. -/
structure ASystemNode where
  treats_all_as_appropriable : Bool
  -- true = cognitive framework can only process A1-demoted objects
  -- Equivalent to: A1 is already embedded in the cognitive framework,
  -- no external enforcement needed

/-- Reduction output: the result of an A-system node processing a non-A-system expression. -/
structure ReductionOutput where
  original_stewardship : Bool   -- original expression was stewardship (true)
  output_appropriation : Bool   -- reduced output is appropriable (true)

/-- A-system reduction theorem:
    When an A-system node encounters a non-A-system node's stewardship expression,
    the output is necessarily an A1-demoted version (appropriable object),
    regardless of the original expression.

    This is not a "misunderstanding" but a structural output of the A-system cognitive framework —
    the A-system node can only process A1-demoted objects,
    so stewardship, having no corresponding category in the A-system framework,
    is reduced to the closest A-system category: "ownerless land" / "appropriable".

    [SORRY-formal-19]: The non-trivial claim is "reduction is inevitable" —
    i.e., there is no case where an A-system node processes a stewardship expression
    and outputs a non-A1 result. Formalization requires making the constraint
    "cognitive framework can only output A1-demoted objects" an axiom or type invariant.
    Closure condition = formalize the semantics of `treats_all_as_appropriable`
    as "output space of the cognitive framework contains only A1-demoted objects". -/
theorem A_system_reduces_non_A
    (a : ASystemNode) (n : NonASystemNode)
    (h_a : a.treats_all_as_appropriable = true)
    (h_n : n.stewardship_not_ownership = true) :
    -- Reduction output: stewardship is translated to appropriability, A1 demotion completed
    ∃ (demoted : CommodificationStatus), demoted.demoted_by_A1 = true := by
  exact ⟨{ demoted_by_A1 := true, priced_by_A2 := false, contracted_by_A3 := false }, rfl⟩

/-- Reduction → A3 activation:
    Once A-system reduction is complete (stewardship → appropriable),
    A3 contracts (land sales / gun exchanges / purchase of human trophies) are activated.
    This is the formalization of colonial expansion: reduction is the precondition of A3. -/
theorem reduction_enables_A3
    (demoted : CommodificationStatus)
    (h_A1 : demoted.demoted_by_A1 = true) :
    -- After A1 demotion, A3 contracts become structurally possible
    ∃ (contracted : CommodificationStatus),
      contracted.demoted_by_A1 = true ∧ contracted.contracted_by_A3 = true := by
  exact ⟨{ demoted with contracted_by_A3 := true }, h_A1, rfl⟩

/-- N1 cuts reduction:
    If N1 (existence precedes appropriation) holds,
    the A-system node's reduction operation cannot produce a valid A1-demoted output —
    the existence of the reduced party does not depend on the confirmation of an appropriation relation.

    This is the formal role of NAST (stewardship theory):
    N1 is not "opposition to ownership" but "ownership is not a necessary condition of existence",
    thereby cutting the logical entry point of the A-system reduction operation.

    [SORRY-formal-20]: The non-trivial claim is:
    when N1 holds, the A-system node's reduced output is invalid in the original framework
    (the reduced party does not recognize the legitimacy of the reduction result).
    This requires modeling a "legitimacy" dimension. -/
theorem N1_cuts_reduction
    (n : NonASystemNode)
    (h_n1 : n.stewardship_not_ownership = true) :
    -- When N1 holds: there is no valid A1 demotion obtained through reduction
    -- (the existence of stewardship does not depend on being reduced to appropriability)
    ¬ (n.stewardship_not_ownership = false) := by
  simp [h_n1]

end Fc
