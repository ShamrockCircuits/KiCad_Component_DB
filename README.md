# KiCad_Component_DB
---
# KiCad File Types
I often forget what file extensions are related to which data type. Here's an overview of the file extensions we will encouter while working in with KiCad components.

> `<file_name>.pretty` - Directory, contains footprint data.

> `<file_name>.kicad_mod` - Footprint data.

> `<file_name>.kicad_sym` - Symbol Data.
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

## Symbols & Footprints
Since the same symbol/footprint might be reused by several IPNs, the symbol/footprint **name should not contain any IPN data**. Instead we will use generic sequential numbering. For example the first diode symbol will be `SYM-DIO-0000`, the next would be **SYM-DIO-0001**. Details about the symbol can be stored in the meta data of the symbol.

Similarly footprint names will be generated sequentially, starting with `FTP-DIO-0000`.

There is no link between `SYM-<CAT>-1234` and `FTP-<CAT>-1234`.
For example `SYM-<CAT>-1234` could use `FTP-<CAT>-0200`.


**Why no footprint or symbol variants?**
The database provides atomic parts. Each IPN has to be assigned only a single symbol and a single footprint. If we start adding symbol and footprint variants, then I would need to create a unique IPN for every possible combination.

### Creating New Footprints
Silkscreen Text -> W/H/T -> 0.6/0.6/0.1mm

Fabrication reference designator should be placed center on the component. Make it whatever text size is reasonable to fit within the part. Max out at the same width, height and thickness as the silkscreen.

Pin one indicator. Use them. Include pin 1 indicator on fabrication layer.