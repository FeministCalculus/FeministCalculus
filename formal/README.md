# Fc Formal Derivations

Lean 4 formalization of Fc framework derivation chains with ≥3 steps.

## Scope

Only structural/logical claims. Empirical claims live in TIFM.

## Files

- `FcCore.lean` — Six chains formalized:
  1. **Living Body Paradox** (A3 → A1, 4 steps)
  2. **Extraction → Irreversibility** (P0 → D1 → D2, 3 steps)
  3. **Asymmetry Maintenance Theorem** (3 steps)
  4. **SCA — Supply Chain Attack** (5 steps, selection pressure not conspiracy)
  5. **A4 Configuration Topology** (5 steps, F9 necessary not sufficient, Sweden 1995)
  6. **Startup Paradox** (5 steps, Formation_Erased vs Formation_Absent)

## Open `sorry`s

| ID | Location | What's missing |
|----|----------|---------------|
| SORRY-formal-1 | `living_body_paradox` | Bridge axiom: body inclusion in production function ↔ suspension of body self-determination |
| SORRY-formal-2 | `D2_irreversibility` | Hysteresis: stateful model where S2 persists even if recovery rises above θ |
| SORRY-formal-3 | `asymmetry_maintenance` | Necessity claim: ¬∃ stable S without B, given active M |
| SORRY-formal-4 | `SCA_outcome` / `SCA_erasure` | Temporal model: selection pressure necessarily drives naming capacity to false over time |
| SORRY-formal-5 | SCA corollary | Identity model: agents who removed signpost end up where signpost was (self-concealment) |
| SORRY-formal-6 | `A4_configuration_trichotomy` | Exhaustive partition: enumerate all 16 condition combinations |
| SORRY-formal-7 | `erased_harder_than_absent` | Reversal cost model: E_{2→1}(erased) >> E_{2→1}(absent) |

## Proved without sorry

- `F9_necessary_for_A4_failure`
- `F9_not_sufficient_for_A4_failure` (Sweden 1995 witness)
- `A4_weakened_strictly_weaker_than_failed`
- `SCA_naming_threatens`
- `SCA_selection_pressure_active`
- `startup_paradox` — erased prerequisite → not present
- `startup_paradox_full` — A7-OE active + exists=false → erased ∧ not present
- `China_is_erased_not_absent` — Formation_Erased, not Formation_Absent
- `erased_harder_than_absent` — mutual exclusion (reversal cost argument in sorry)

## To add next

- D0 reproductive agency (non-delegability chain)
- NEG-EXT (extraction demand → no market clearing point)
