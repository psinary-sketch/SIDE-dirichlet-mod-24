# SIDE-dirichlet-mod-24 v0.1

The cubit substrate of Dirichlet characters mod 24 and the count-level **Identity-Formation Bijection**.

## Status

| | |
|---|---|
| Toolchain | `leanprover/lean4:v4.29.0-rc8` |
| Mathlib | not required (vanilla Lean 4) |
| Theorems | 30 |
| sorry | 0 |
| axioms | 0 |
| Author | J. York Seale (NaturalScience) |
| Programme | A PLACE TO STAND, Phase 2, May 2026 |

Keystone paper: `IDENTITY_FORMATION_BIJECTION.md` (Phase 2 paper 1)
Python prototype: `bijection_analysis.py`

Sibling kernels:
- `SIDE-spinor-calibration v0.1` (cubit edge-stratum calibration)
- `SIDE-steane-arithmetic v0.1` (cubit vertex Hamming protection)

## Build

```bash
lake build
```

Self-contained — no Mathlib, no external dependencies.

## What's verified

### §1–§4 — (ℤ/24)* has the cubit structure (ℤ/2)³

- `phi_24_eq_eight` — φ(24) = 8 by enumeration of coprime residues
- `all_units_order_two_or_one` — every unit of (ℤ/24)* squares to 1 mod 24
- `crt_decomposition` — CRT: φ(8) · φ(3) = φ(24) = 8 = 4 · 2
- `klein_eight_structure` — (ℤ/8)* is the Klein four-group
- `z_mod_3_units` — (ℤ/3)* = ℤ/2
- `units_eq_cubit` — |(ℤ/24)*| = |(ℤ/2)³| = 8

### §5 — The seven Trivium discriminants

- `disc_divides_24` — All seven discriminants have |D| dividing 24
- `unique_disc_24` — ℚ(√−6) has the unique magnitude-24 discriminant

### §6 — Count-level bijection

- `count_bijection` — 7 nontrivial characters mod 24 ↔ 7 Trivium fields
- `total_count_bijection` — 8 ↔ 8 (with ℚ ↔ trivial character)

### §7 — Element-level obstruction

- `strata_sums_match` — Both Hamming (3,3,1) and formation (2,3,2,0) sum to 7
- `element_obstruction` — But the distributions DIFFER: (3,3,1) ≠ (2,3,2)
- `middle_stratum_matches` — The transformation/weight-2 stratum DOES match (count 3 = n₂)

### §8 — Diagonal identification

- `diagonal_eq_modulus` — ℚ(√−6)'s discriminant magnitude 24 = |(ℤ/2)³| · |(ℤ/3)*|
- `diagonal_eq_tower_level_3` — 24 = level-3 of the {2,3}-doubling tower

### §9 — Federation cubit unification

- `cubit_unification` — |cubit| = |chars mod 24| = |units mod 24| = |Trivium fields + ℚ|

## What's NOT verified

- The element-level functorial bijection between Trivium fields and mechanism classes. This is the Identity-Formation Bijection conjecture (Phase 2 paper 1, open). The kernel proves the count-level bijection and identifies the element-level obstruction.
- Mathematical structure of Dirichlet characters themselves (kernel uses arithmetic of (ℤ/24)* only; full character theory would require Mathlib).
- Class number assignment to each Trivium field (this is *programme-side input* — class numbers are looked up, not derived in the kernel). See the *Class-Number Anomaly* finding doc for the diagonal/non-principal identification.

## Federation context

Three kernels operate on the same cubit substrate, each verifying a different structural role:

| Kernel | Substrate role | Cube decomposition used |
|---|---|---|
| SIDE-spinor-calibration v0.1 | Calibration via ‖v‖²·ζ(−1)=−1 | Edge stratum (3, 6, 3) |
| SIDE-steane-arithmetic v0.1 | Protection via [[7,1,3]] code | Vertex Hamming (3, 3, 1) |
| **SIDE-dirichlet-mod-24 v0.1** | **Character bijection 8 ↔ 8** | **(ℤ/24)* ≅ (ℤ/2)³ structure** |

Three views of the same cubit: cube edges (calibration), cube vertices (protection), and group automorphisms (characters). The cubit is the convergence point of all three.

Total federation kernels: **12**.

## License

CC-BY 4.0. Cite as:

> Seale, J. Y. (2026). *SIDE-dirichlet-mod-24 v0.1: The cubit substrate of Dirichlet characters mod 24.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

*Eight characters, seven fields, one cubit. The bijection is at the count level.*
