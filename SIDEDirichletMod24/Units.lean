/-
  SIDEDirichletMod24/Units.lean
  =============================

  THE UNITS MODULO 24 AS THE PRODUCT OF THREE GROUPS OF ORDER TWO.
  This programme's work (act b757, ruling (R367)(6)(ii)); plain Lean 4, no Mathlib, the toolchain unchanged.

  The map sending a residue u prime to 24 to its three signs -- the values of the quadratic characters of conductors 3, 4 and 8, read
  from u modulo 3, u modulo 4 and u modulo 8 -- is a bijection from the eight residues onto the eight triples of signs, and carries the
  product modulo 24 to the product of signs place by place. A sign is a Bool, `true` where the character's value is -1, so the product
  of two signs is their exclusive-or (`!=` on Bool). This is the statement the docstring of Basic.lean :80-:81 says the squares (§2) and
  the count (§1) force. Each statement over the residues is closed by `decide`: the eight residues, the 64 pairs among them, the eight
  triples.

  RIDING WITH IT: for natural numbers 2 ≤ a < b, a * b = a + b + 1 exactly when a = 2 and b = 3 (in ordinary terms, (a - 1)(b - 1) = 2;
  the proof here bounds a * b from below by 3 * b where a ≥ 3).
-/
import SIDEDirichletMod24.Basic

namespace SIDEDirichletMod24

/-- The eight residues prime to 24. -/
def units24 : List Nat := [1, 5, 7, 11, 13, 17, 19, 23]

/-- The three signs of a residue, each `true` where the character's value is -1: the character of conductor 3 at `u ≡ 2 (mod 3)`, of
conductor 4 at `u ≡ 3 (mod 4)`, of conductor 8 at `u ≡ 3, 5 (mod 8)`. -/
def signs (u : Nat) : Bool × Bool × Bool :=
  (u % 3 == 2, u % 4 == 3, u % 8 == 3 || u % 8 == 5)

/-- The product of two triples of signs place by place: the exclusive-or of each place. -/
def signMul (s t : Bool × Bool × Bool) : Bool × Bool × Bool :=
  (s.1 != t.1, s.2.1 != t.2.1, s.2.2 != t.2.2)

/-- The eight triples of signs. -/
def allSigns : List (Bool × Bool × Bool) :=
  [(false, false, false), (false, false, true), (false, true, false), (false, true, true),
   (true, false, false), (true, false, true), (true, true, false), (true, true, true)]

/-- The list holds exactly the residues below 24 prime to 24. -/
theorem units24_spec : ∀ u, u < 24 → (u ∈ units24 ↔ Nat.gcd u 24 = 1) := by decide

/-- The product modulo 24 of two residues prime to 24 is one. -/
theorem units24_mul_mem : ∀ u ∈ units24, ∀ v ∈ units24, (u * v) % 24 ∈ units24 := by decide

/-- **Injective**: distinct residues have distinct signs. -/
theorem signs_injective : ∀ u ∈ units24, ∀ v ∈ units24, signs u = signs v → u = v := by decide

/-- **Onto**: every triple of signs is the signs of a residue. -/
theorem signs_onto : ∀ t ∈ allSigns, ∃ u ∈ units24, signs u = t := by decide

/-- The eight triples listed are every triple. -/
theorem allSigns_complete (a b c : Bool) : (a, b, c) ∈ allSigns := by
  cases a <;> cases b <;> cases c <;> decide

/-- **The product goes to the product**: at all 64 pairs, the signs of `u * v mod 24` are the place-by-place product of the signs. -/
theorem signs_mul : ∀ u ∈ units24, ∀ v ∈ units24, signs ((u * v) % 24) = signMul (signs u) (signs v) := by decide

/-- **THE ISOMORPHISM**: `signs` is injective on the eight residues prime to 24, onto the triples of signs, and carries the product modulo
24 to the place-by-place product of signs: the units modulo 24 are isomorphic to the product of three groups of order two, by the
quadratic characters of conductors 3, 4 and 8. -/
theorem units24_iso_signs :
    (∀ u ∈ units24, ∀ v ∈ units24, signs u = signs v → u = v) ∧
    (∀ a b c : Bool, ∃ u ∈ units24, signs u = (a, b, c)) ∧
    (∀ u ∈ units24, ∀ v ∈ units24, signs ((u * v) % 24) = signMul (signs u) (signs v)) :=
  ⟨signs_injective, fun a b c => signs_onto _ (allSigns_complete a b c), signs_mul⟩

/-- **RIDING WITH IT**: for `2 ≤ a < b`, `a * b = a + b + 1` exactly at `(a, b) = (2, 3)`. -/
theorem mul_eq_add_add_one_iff (a b : Nat) (ha : 2 ≤ a) (hab : a < b) :
    a * b = a + b + 1 ↔ a = 2 ∧ b = 3 := by
  constructor
  · intro h
    cases Nat.lt_or_ge a 3 with
    | inl h3 =>
      have ha2 : a = 2 := by omega
      subst ha2
      omega
    | inr h3 =>
      have h1 : 3 * b ≤ a * b := Nat.mul_le_mul h3 (Nat.le_refl b)
      omega
  · intro h
    obtain ⟨rfl, rfl⟩ := h
    decide

end SIDEDirichletMod24
