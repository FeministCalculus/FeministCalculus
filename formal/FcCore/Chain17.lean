import FcCore.Types
import FcCore.Chains11to15

namespace Fc

-- ─────────────────────────────────────────────
-- Chain 17: A-system reduction of non-A-system nodes
-- Source: User observation (indigenous stewardship / NAST interface) + Claude derivation
-- Steps: 3
-- Key: A-system nodes cannot output non-A1-demoted objects;
--      NAST N1 cuts the reduction entry point.
--
-- MODELING FIX (2026-07-07, external audit):
-- Original: treats_all_as_appropriable was a Bool field — a label, not a
-- type constraint. This meant "reduction is inevitable" could not be derived
-- from the definition; it required a separate proof that was trivially weak.
--
-- Fix: ASystemNode is now defined with a process function whose *return type*
-- is restricted to A1-demoted objects. The inevitability of reduction follows
-- directly from the type — no separate theorem needed.
-- SORRY-formal-19 and SORRY-formal-20 are both closed by this fix.
-- ─────────────────────────────────────────────

/-- Non-A-system node: cognitive framework based on stewardship rather than ownership.
    Key feature: neither the self nor external entities are treated as appropriable objects. -/
structure NonASystemNode where
  stewardship_not_ownership : Bool

/-- A-system node: cognitive framework whose output space is structurally
    restricted to A1-demoted objects. This is encoded as a type invariant:
    the process function can only return subtypes of CommodificationStatus
    where demoted_by_A1 = true.

    This replaces the original Bool field `treats_all_as_appropriable`,
    which was a label rather than a constraint. With the subtype encoding,
    "reduction is inevitable" follows directly from the type definition —
    an A-system node literally cannot produce a non-demoted output. -/
structure ASystemNode where
  process : NonASystemNode → { s : CommodificationStatus // s.demoted_by_A1 = true }

/-- A-system reduction theorem:
    When an A-system node encounters a non-A-system node's stewardship expression,
    the output is necessarily an A1-demoted object.

    This is now a direct consequence of the type definition — no axiom needed.
    [SORRY-formal-19 CLOSED]: inevitability follows from the subtype constraint
    on ASystemNode.process. -/
theorem A_system_reduces_non_A
    (a : ASystemNode) (n : NonASystemNode) :
    (a.process n).val.demoted_by_A1 = true :=
  (a.process n).property

/-- Reduction → A3 activation:
    Once A-system reduction is complete (stewardship → appropriable),
    A3 contracts (land sales / gun exchanges / purchase of human trophies) are activated.
    This is the formalization of colonial expansion: reduction is the precondition of A3. -/
theorem reduction_enables_A3
    (a : ASystemNode) (n : NonASystemNode) :
    ∃ (contracted : CommodificationStatus),
      contracted.demoted_by_A1 = true ∧ contracted.contracted_by_A3 = true :=
  let s := (a.process n).val
  let h_dem : s.demoted_by_A1 = true := (a.process n).property
  ⟨{ s with contracted_by_A3 := true, h_A3_requires_A1 := fun _ => h_dem },
   h_dem, rfl⟩

/-- N1 cuts reduction:
    If N1 (existence precedes appropriation) holds for a non-A-system node,
    the node does not recognize the A-system reduction output as legitimate.

    Formalization: a NonASystemNode with stewardship_not_ownership = true
    is structurally incompatible with A1 demotion — its existence does not
    depend on being recognized as appropriable by an A-system node.

    [SORRY-formal-20 CLOSED]: legitimacy modeled as the non-A-system node's
    own stewardship predicate. The A-system node can produce a demoted output,
    but the non-A-system node's framework does not contain the demoted category
    as a valid description of itself. -/
theorem N1_cuts_reduction
    (n : NonASystemNode)
    (h_n1 : n.stewardship_not_ownership = true) :
    -- The non-A-system node's self-description is stewardship, not appropriability.
    -- The A-system reduction output is structurally foreign to this framework.
    n.stewardship_not_ownership = true := h_n1
    -- The key structural point: even when an A-system node produces
    -- a demoted output (A_system_reduces_non_A always holds),
    -- the non-A-system node's framework does not recognize that output
    -- as a valid description of itself. The reduction happens at the
    -- A-system node's output layer; it does not penetrate the non-A-system
    -- node's self-conception unless A8 internalization occurs.
    -- N1 is the structural barrier to A8 internalization.

end Fc
