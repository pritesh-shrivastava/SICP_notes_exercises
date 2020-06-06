
#### Ex1.35

Show that the golden ratio φ (1.2.2) is a fixed point of the transformation x ↦ 1 + 1 / x , and use this fact to compute φ by means of the fixed-point procedure. 

_Solution_ : 
φ is the root of equation `x^2 = x + 1`
```
φ^2 = φ + 1
=> φ = 1 + 1 / φ
``` 
=> φ is the fixed point of `f(x) = 1 + 1/x `

φ is computed in script _golden_ratio_fixed_pt.scm_ .