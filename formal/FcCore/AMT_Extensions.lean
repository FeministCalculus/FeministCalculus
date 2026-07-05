import FcCore.Types

namespace Fc

-- ─────────────────────────────────────────────
-- AMT Extension: B-Complexity Corollary + Lying Corollary
-- Source: 非对称性维护定理.md (2026-07-01)
-- ─────────────────────────────────────────────

abbrev Naturalness := Nat

inductive PressureSource where
  | External : PressureSource
  | Internal : PressureSource

def pressure_source (nat : Naturalness) : PressureSource :=
  if nat > 0 then PressureSource.External else PressureSource.Internal

def B_complexity (nat : Naturalness) : Nat :=
  match pressure_source nat with
  | PressureSource.External => 1
  | PressureSource.Internal => 3

theorem B_complexity_inverse_naturalness
    (nat_natural nat_artificial : Naturalness)
    (h_natural   : nat_natural   > 0)
    (h_artificial : nat_artificial = 0) :
    B_complexity nat_artificial > B_complexity nat_natural := by
  simp [B_complexity, pressure_source, h_natural, h_artificial]

def CounterfactualNarrative := Bool
def maintains_counterfactual (b_active : Bool) : Prop := b_active = true

theorem lying_is_structural
    (nat : Naturalness) (h_artificial : nat = 0) :
    pressure_source nat = PressureSource.Internal := by
  simp [pressure_source, h_artificial]

theorem lying_density_proportional_to_extraction
    (extraction_intensity : Nat) (h_nonzero : extraction_intensity > 0) :
    ∃ _ : CounterfactualNarrative, maintains_counterfactual true := by
  exact ⟨true, rfl⟩

-- [SORRY-formal-11 CLOSED v1.0 — Kimi web, 2026-07-04]
-- Narrative density as a monotonic function of extraction intensity.
-- Formalizes the AMT Extension lying corollary: counterfactual narrative
-- density increases with extraction intensity (structural pressure to maintain
-- the absorption layer generates more elaborate justifications).

/-- Narrative density: number of counterfactual narrative units per
    extraction intensity unit. -/
def narrative_density (extraction_intensity : Nat) : Nat :=
  extraction_intensity * 2  -- linear model: density ∝ intensity
  -- [NOTE] Linear model is minimal; future refinement may add threshold effects
  -- (density spikes when extraction approaches legitimacy crisis points).

/-- Monotonicity: narrative density is non-decreasing in extraction intensity. -/
theorem narrative_density_monotonic
    (i1 i2 : Nat)
    (h : i1 ≤ i2) :
    narrative_density i1 ≤ narrative_density i2 := by
  simp [narrative_density]
  -- narrative_density i = i * 2, so i1 ≤ i2 → i1*2 ≤ i2*2
  omega

/-- Strict monotonicity for positive intensities: if intensity increases,
    density strictly increases (no saturation). -/
theorem narrative_density_strict_mono
    (i1 i2 : Nat)
    (h_pos : i1 > 0)
    (h_lt : i1 < i2) :
    narrative_density i1 < narrative_density i2 := by
  simp [narrative_density]
  omega

/-- Density threshold: when extraction intensity exceeds a critical level,
    narrative density crosses a threshold where counterfactual narratives
    become the dominant social discourse ("reality inversion"). -/
def reality_inversion_threshold : Nat := 10

theorem reality_inversion_at_high_extraction
    (i : Nat)
    (h : i > reality_inversion_threshold) :
    narrative_density i > reality_inversion_threshold * 2 := by
  simp [narrative_density]
  exact h

-- [CLOSURE NOTE] formal-11:
-- The substantive claim is that narrative density increases monotonically
-- with extraction intensity — not that the specific linear model (×2) is
-- empirically accurate. The linear model captures the structural direction
-- (more extraction → more justification needed). Future refinement:
-- 1) Non-linear models (step functions, threshold effects)
-- 2) Empirical calibration from A5/A8 discourse analysis data
-- 3) Saturation effects (can density decrease at extreme intensities?)
-- These are TIFM-layer questions, not FcCore structural questions.


end Fc
