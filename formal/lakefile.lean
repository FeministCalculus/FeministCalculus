import Lake
open Lake DSL

package FcCore where
  -- Fc框架Lean形式化项目

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.31.0"

@[default_target]
lean_lib FcCore where
  roots := #[`FcCore]
