# Fc Formal Derivations

Lean 4 formalization of Fc framework derivation chains with ≥3 steps.

## Scope

Only structural/logical claims. Empirical claims live in TIFM.

## Files

- `FcCore.lean` — Four chains formalized:
  1. **Living Body Paradox** (A3 → A1, 4 steps)
  2. **Extraction → Irreversibility** (P0 → D1 → D2, 3 steps)
  3. **Asymmetry Maintenance Theorem** (3 steps)
  4. **SCA — Supply Chain Attack** (5 steps, selection pressure not conspiracy)

## Open `sorry`s

| ID | Location | What's missing |
|----|----------|---------------|
| SORRY-formal-1 | `living_body_paradox` | Bridge axiom: body inclusion in production function ↔ suspension of body self-determination |
| SORRY-formal-2 | `D2_irreversibility` | Hysteresis: stateful model where S2 persists even if recovery rises above θ |
| SORRY-formal-3 | `asymmetry_maintenance` | Necessity claim: ¬∃ stable S without B, given active M |
| SORRY-formal-4 | `SCA_outcome` / `SCA_erasure` | Temporal model: selection pressure necessarily drives naming capacity to false over time |
| SORRY-formal-5 | SCA corollary | Identity model: agents who removed signpost end up where signpost was (self-concealment) |

## To add next

- A4 configuration topology (run/weakened/failed)
- Startup paradox (L6 from cognitive erosion chain)
