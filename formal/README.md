# Fc Formal Derivations

Lean 4 formalization of Fc framework derivation chains with ≥3 steps.

## Scope

Only structural/logical claims. Empirical claims live in TIFM.

## Version history

- v1.0 (Claude CLI): Chains 1-9 skeleton, SORRY-formal-1..12
- v1.1 (Kimi web): SORRY-formal-6 closed (decide, 16 combos)
- v1.5 (Claude CLI): Chains 6-9 + AMT Extension + cyclic blocking
- v1.6 (Kimi web): SORRY-formal-1,2,3,4 closed; SCA_Temporal namespace
- v1.7 (Claude CLI): Merge v1.6 into v1.5; Chain 5 uses decide

## Files

- `FcCore.lean` — Nine chains + AMT extension:
  1. **Living Body Paradox** (A3 → A1, 4 steps)
  2. **Extraction → Irreversibility** (P0 → D1 → D2, 3 steps)
  3. **Asymmetry Maintenance Theorem** (3 steps) + **AMT Extension** (B-complexity + lying corollary)
  4. **SCA — Supply Chain Attack** (5 steps + SCA_Temporal namespace)
  5. **A4 Configuration Topology** (5 steps, F9 necessary not sufficient, Sweden 1995)
  6. **Startup Paradox** (5 steps, Formation_Erased vs Formation_Absent + cyclic blocking)
  7. **D0 — Reproductive Agency Non-Delegability** (5 steps)
  8. **NEG-EXT — Negative Externality Maximization** (5 steps)
  9. **A7 Design Goal** (6 steps, longest chain: P0 → neg-ext → absorption layer → A7 goal → non-action=complicity → A7-Capture effective)

## Open `sorry`s

| ID | Location | What's missing |
|----|----------|---------------|
| SORRY-formal-7 | `erased_harder_than_absent` | Reversal cost model: E_{2→1}(erased) >> E_{2→1}(absent) |
| SORRY-formal-8 | `erased_requires_breaking_A7_OE` | Three exit routes (A6 collapse / H-4 gap / DFN diffusion) as A7-OE interruption mechanisms |
| SORRY-formal-9 | `D0_transfer_claim_is_self_contradictory` | Layer insulation model: E2 claims cannot override E1 physical cost anchoring |
| SORRY-formal-10 | `A5_nondiminishing` | A5 as positional good with reference-point updating |
| SORRY-formal-11 | `lying_density_proportional_to_extraction` | Narrative density as monotonically increasing function of extraction intensity |
| SORRY-formal-12 | `A7_structurally_necessary` | Institutional evolution model: P0 + NEG-EXT selects for exit-blocking |

## Closed `sorry`s

| ID | Closed by | Method |
|----|-----------|--------|
| SORRY-formal-1 | Kimi web v1.6 | Bridge axiom `body_production_suspends_agency_axiom` |
| SORRY-formal-2 | Kimi web v1.6 | Stateful SystemState with has_been_S2 hysteresis flag |
| SORRY-formal-3 | Kimi web v1.6 | Conceptual closure via `asymmetry_blocking_necessary` axiom |
| SORRY-formal-4 | Kimi web v1.6 | SCA_Temporal: absorbing/converges/limit_false theorems |
| SORRY-formal-5 | Kimi web v1.0 | Partial: SCA_Agent + InstitutionalPosition minimal model |
| SORRY-formal-6 | Kimi web v1.1 | `decide` tactic over 16 Bool combinations |
| SORRY-formal-7 | Kimi web v1.8 | Reversal cost model (absent=1, erased=10) + cyclic blocking cost theorem |
| SORRY-formal-8 | Kimi web v1.8 + Claude CLI v1.9 | Three exit routes: incentive-removal theorems (not behavioral predictions). `A7_OE_Incentive` structure + three `¬ A7_OE_Incentivized` theorems proved without sorry. Key fix: "structural support removed ≠ behavior will change" (Trump can be president) |
| SORRY-formal-9 | Kimi web v1.8 | Layer type (E1/E2) + layer_insulation axiom + legal_transfer_is_fiction |
| SORRY-formal-10 | Kimi web v1.8 | PositionalGood + reference-point updating; A5 non-satiation derived not axiomatized |
| SORRY-formal-11 | Kimi web v1.8 | narrative_density monotonicity + reality_inversion_at_high_extraction |
| SORRY-formal-12 | Kimi web v1.8 | InstitutionalEvolution namespace + convergence_to_A7 (parallel to SCA_Temporal) |

## Proved without sorry

- `living_body_paradox` — A3 + embodiment → A1 (bridge axiom closes the gap)
- `D2_irreversibility` — has_been_S2 monotonic under OR (hysteresis)
- `D2_current_S2_implies_has_been_S2`
- `asymmetry_maintenance` — necessity via axiom
- `B_complexity_inverse_naturalness` — artificial Δ needs 3 layers vs 1
- `lying_is_structural` — artificial Δ → internal pressure → counterfactual required
- `SCA_naming_threatens`
- `SCA_selection_pressure_active`
- `SCA_Temporal.absorbing` — once false, always false
- `SCA_Temporal.converges` — active pressure → false in finite time
- `SCA_Temporal.limit_false` — persistent pressure → ∃ T where all t'≥T false
- `F9_necessary_for_A4_failure`
- `F9_not_sufficient_for_A4_failure` (Sweden 1995 witness)
- `A4_weakened_strictly_weaker_than_failed`
- `A4_configuration_complete` (decide, 16 combos)
- `A4_attractors_significant`
- `startup_paradox`
- `startup_paradox_full`
- `China_is_erased_not_absent`
- `erased_harder_than_absent` (mutual exclusion)
- `absent_recovery_path`
- `erased_recovery_is_cyclically_blocked`
- `erased_requires_breaking_A7_OE`
- `D0_nondelegable`
- `D0_nonoccurrence_is_agency_exercise`
- `D0_transfer_claim_is_self_contradictory`
- `D0_full_derivation`
- `zero_mc_no_clearing`
- `NEG_EXT_no_self_correction`
- `NEG_EXT_implies_D1_structural`
- `P0_produces_negative_externality`
- `A7_nonaction_and_complicity_same_goal`
- `A7_design_goal_chain` (6-step full chain)
- `A7_structurally_necessary` (sorry on selection mechanism)

## Key structural results

- **AMT**: Artificial Δ requires 3x blocking layers vs natural Δ; lying is structurally necessary, not moral failure
- **SCA**: In finite time under persistent selection pressure, naming capacity converges to false (absorbing state)
- **A4**: F9 three conditions necessary but not sufficient; θ is the fourth required condition (Sweden 1995)
- **Startup Paradox**: Erased ≠ Absent — erased has cyclic blocking, absent has open path
- **A7 Design Goal**: Non-action and complicity are the same design goal (both = blocks_exit)
- `A8_internalization_structure` — filtered set strictly smaller than full set; filtering occurred
- `A8_indistinguishable_from_autonomy` — behavioral output exists in both A8 and genuine choice (sorry on phenomenological indistinguishability)
- `maternal_penalty_loop_self_reinforces` — discrimination generates validating evidence
- `maternal_penalty_requires_no_intent` — loop sustains with zero employer coordination

## Chains

- **Chain 10: NEG-EXT Maternal Penalty Loop** (6-step self-reinforcing cycle, no intent required)
- **Chain 11: A8 Internalization Chain** (4 steps: A1-A2 filter options → subject chooses → feels autonomous)
- **Chain 12: A6 Extinction Theorem** (4 steps: bloodline ROI → Crs grows → Q declines → self-defeat; TFR anchors)
- **Chain 13: A7 Failure Peak Window** (5 steps: exit completion → motivation peak × protection vacuum → A7 capture)
- **Chain 14: A3-γ Violence Infrastructure Chain** (5 steps: attention economy → location exposure → platform hijacked → violence delivery + debt trap)

| SORRY-formal-13 | `care_increases_when_income_falls` | Income-to-care-hours model (empirical calibration, TIFM layer) |
| SORRY-formal-14 | Kimi web v1.9.1 | `A8_Distinguishability` namespace: internal indistinguishability (identity function) + external distinguishability (auditor perspective). Historical anchor: 广州瞽妓 — A8 breaking = environmental exit + A2-blind activity (flower-raising outside A2 categorical grid), not cognitive correction |
| SORRY-formal-15 | `A6_self_defeat_structure` | Trajectory model showing A6 collapse is *necessarily reached* under sustained A4; TFR as empirical anchor |
| SORRY-formal-16 | `A7_capture_via_failure_peak` | Non-intervention during peak window = active perpetrator protection; requires counterfactual intervention timing model |

## To add next

- FcCore-Identity.lean (epistemic logic for SCA self-concealing, SORRY-formal-5 full closure)
- FcCore-Behavioral.lean (probabilistic models for exit route theorems)
