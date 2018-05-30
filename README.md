# A Control.ST.Random and FFI program that crashes Idris 1.3

...during compilation, but compiles fine on Idris 1.2.

## Repro

```
idris -o roller -p contrib Main.idr
```
