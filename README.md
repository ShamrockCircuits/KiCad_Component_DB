# KiCad_Component_DB
---
# Naming Conventions
- Generally followed this [Part Numbering Template](https://github.com/git-plm/parts/blob/main/partnumbers.md)
- **Passive** provide a special use case for the `CCC-NNN-VVVV` scheme
- We will encode the value in `VVVV` variation, see [examples](https://github.com/git-plm/parts/blob/main/partnumbers.md#examples)
    - Passives that share `CCC-NNN` should be **identical in every metric except value**
## Resisitors
4-digit encoding. For example 1234 is 1.23*10^4 (12.3kΩ). If you are unable to encode the exact value it is still recommended that you encode the closest possible value.

- 1K   0805 1%: **RES-002-1003**
- 3.3K 0805 1%: **RES-002-3303**
- 2.2K 0805 5%: **RES-003-2203** (different tolerance)
- 1  0603 0.1%: **RES-004-1000**
- 10 0603 0.1%  **RES-004-1001**

There has been no agreement yet how to encode values below 1Ω. I will either (1) **ignore the version digits**, or (2) change the encoding scheme for mΩ resistors. Likely I will follow option (1).

## Capacitors
Value uses 3-digit encoding. Where the **third digit** is the number of **zeros in pF**. For example, 103 is 0.01uF. The remaining digit is used to encode the dielectric type. Common combinations (that I typically use) have been encoded roughly  in accordance with their popularity.  
 - 0 - None
 - 1 - X5R
 - 2 - X7R
 - 3 - C0G/NP0
 - *4 to 9 - spare*

Example of the encoding scheme.

- 100nF 0603 X5R: **CAP-000-1041**
- 100nF 0603 X7R: **CAP-000-1042**
- 220nF 0805 X5R: **CAP-001-2241**

If you are unable to encode the capacitor value in the 3-digits assign `VVVV` as `000V`. Where the last `V` still signifies the dielectric.