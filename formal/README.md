# Fc Formal Derivations

Lean 4 formalization of Fc framework derivation chains with ≥3 steps.

## Scope

Only structural/logical claims. Empirical claims live in TIFM.

## Files

- `FcCore.lean` — Six chains + one consequence formalized:
  1. **Living Body Paradox** (A3 → A1, 4 steps)
  2. **Extraction → Irreversibility** (P0 → D1 → D2, 3 steps)
  3. **Asymmetry Maintenance Theorem** (3 steps)
  4. **SCA — Supply Chain Attack** (5 steps, selection pressure not conspiracy)
  5. **A4 Configuration Topology** (5 steps, F9 necessary not sufficient, Sweden 1995)
  6. **Startup Paradox** (5 steps, Formation_Erased vs Formation_Absent)
  7. **D0 — Reproductive Agency Non-Delegability** (5 steps, cost-anchoring → non-delegability → agency-exercise vs system-failure)

## Open `sorry`s

| ID | Location | What's missing |
|----|----------|---------------|
| SORRY-formal-1 | `living_body_paradox` | Bridge axiom: body inclusion in production function ↔ suspension of body self-determination |
| SORRY-formal-2 | `D2_irreversibility` | Hysteresis: stateful model where S2 persists even if recovery rises above θ |
| SORRY-formal-3 | `asymmetry_maintenance` | Necessity claim: ¬∃ stable S without B, given active M |
| SORRY-formal-4 | `SCA_outcome` / `SCA_erasure` | Temporal model: selection pressure necessarily drives naming capacity to false over time |
| SORRY-formal-5 | ~~SCA corollary~~ **PARTIAL CLOSURE (Claude web v1.0, 2026-07-04)**: minimal identity/memory model; `identity_usurpation` + `memory_erased` types capture structural intent; full closure needs epistemic logic / modal type theory → `FcCore-Identity.lean` |
| SORRY-formal-6 | ~~`A4_configuration_trichotomy`~~ | ~~Exhaustive partition of all 16 condition combinations~~ **CLOSED (Kimi v1.1, 2026-07-04)**: `decide` tactic + Transitional/Degenerate definitions cover all 16 combinations |
| SORRY-formal-7 | `erased_recovery_is_cyclically_blocked` | A7-OE necessarily detects and suppresses before prerequisite reaches formation threshold |
| SORRY-formal-8 | `erased_requires_breaking_A7_OE` | Formalize three exit routes (A6 collapse / H-4 gap / DFN diffusion) as A7-OE interruption mechanisms |

| SORRY-formal-9 | `D0_transfer_claim_is_self_contradictory` | Layer insulation model: E2 institutional claims cannot override E1 physical cost anchoring |

## Proved without sorry

- `F9_necessary_for_A4_failure`
- `F9_not_sufficient_for_A4_failure` (Sweden 1995 witness)
- `A4_weakened_strictly_weaker_than_failed`
- `SCA_naming_threatens`
- `SCA_selection_pressure_active`
- `startup_paradox`
- `startup_paradox_full`
- `China_is_erased_not_absent`
- `erased_harder_than_absent`
- `absent_recovery_path` — absent: one step, no active opposition
- `erased_recovery_is_cyclically_blocked` — erased: A7-OE re-erases on each attempt
- `A4_configuration_complete` — all 16 Bool combinations covered via `decide` (closes SORRY-formal-6)
- `A4_attractors_significant` — excluding transitional/degenerate leaves exactly three attractors

## Key structural result

**Absent vs Erased asymmetry:**
- Absent: recovery path is open. Conditions improve → prerequisite forms.
- Erased: recovery path is cyclically blocked. A7-OE re-erases on each attempt.
- Consequence: all three L6 exit routes (A6 collapse, H-4 gap, DFN diffusion)
  target A7-OE itself, not just condition accumulation.

- `D0_nondelegable` — cost anchoring → decision right belongs to subject
- `D0_nonoccurrence_is_agency_exercise` — non-initiation = agency exercise, not failure
- `D0_transfer_claim_is_self_contradictory` — institutional transfer claim contradicts physical non-transferability
- `D0_full_derivation` — cost non-transferable regardless of institutional claims

## To add next

- D0 reproductive agency (non-delegability chain)
- NEG-EXT (extraction demand → no market clearing point)
