# KiCad_Component_DB
---
# KiCad File Types
I often forget what file extensions are related to which data type. Here's an overview of the file extensions we will encouter while working in with KiCad components.

> `<file_name>.pretty` - Directory, contains footprint data.<br>
> `<file_name>.kicad_mod` - Footprint data. <br>
> `<file_name>.kicad_sym` - Symbol Data.
---
# Naming Conventions
- **Passive** provide a special use case for the `CCC-NNN-VVVV` scheme
- We will encode the value in `VVVV` variation, see [examples](https://github.com/git-plm/parts/blob/main/partnumbers.md#examples)
    - Passives that share `CCC-NNN` should be **identical in every metric except value**

## Libraries and Naming
The part codes used for this project are very similar, though slightly modified from this [part numbering template](https://github.com/git-plm/parts/blob/main/partnumbers.md) Key changes are as follows..

**New Part Types**
* **MRK** - Added a "markings" library for graphics and logos. These are generally "symbols" that won't appear on the BOM.
* **FAB** - Fabrication specific objects. Such as fiducials, tooling holes, and mouse bites. There are a few markings which are specifically used by fabrication. For example JLCJLCJLC. These belong in the FAB library.
* **MEC** - Things I consider mechanical. Primarily mounting holes, heat sinks, and standoffs. 

**Modified Part Types**
* Changed the transistor name from XTR to TRN. To me XTR was too similar to XFRM (transformer) or TXR (transceiver).
* Changed MPU to SOC.
* Changed PWR to REL. Given I only intend to put relays in this library I believe RLY is more appropriate and less confusing.
* Changed CON to CNT. CON is not an allowed folder name in windows.

**Overlapping Technologies**<br>
There are many components that could fit into multiple libraries. To avoid confusion these devices will be outlined below. This was based on my own preferences with limited rhyme or reason (fair warning).

| Part              | Should Go In  | Not                           |
|-------------------|---------------|-------------------------------|
| TVS Diodes        | DIO           | CPD                           |
| LED               | DIO           | OPT                           |
| Solid State Relay | RLY           | OPT                           |
| Test Points       | FAB           | CON, MEC, MRK                 |
| Fabrication Markings | FAB        | MRK                           |


**Database Tales**<br>
Below is a list of all the libraries stored in this repo, along with a short description of their contents.
* **Database Name** - The name of the SQLite table
* **Database Code** - Used for the file structure. You will interact with these names in KiCad.
* **Description** - Library description that appears in KiCad.

| Code | Database Name              | Description                              |
|------|----------------------------|------------------------------------------|
| ANA  | Analog                     | Op-amps, Comparators, A/D, D/A           |
| CAP  | Capacitor                  | Capacitors                               |
| CNT  | Connector                  | Connectors                               |
| CPD  | Protection                 | Circuit Protection Devices (MOV, Varistor, Fuse, ect) |
| DIO  | Diode                      | Diodes (Zener, TVS, LED, Schottky, Standard)|
| FAB  | Fabrication                | Fabrication specific elements (Fiducial, Tooling Holes, Mouse Bites)           |
| ICS  | IntegratedCircuit          | General Integrated Circuits              |
| IND  | Magnetics                  | Inductors, Transformers, Chokes, Magnetics |
| MCU  | Microcontroller            | Microcontrollers, Modules, etc.          |
| MEC  | Mechanical                 | Mechanical components (Mounting holes, etc)|
| MRK  | Marking                    | Symbols, Logos and Graphics... ie Non-BOM |
| OPT  | Optoelectronic             | Optocouplers, phototransistor, SSR etc.  |
| OSC  | Oscillator                 | Oscillators, Crystals                    |
| REG  | Regulator                  | Regulators (LDO, Buck, Boost, Flyback, ect) |
| RES  | Resistor                   | Resistors                                |
| RFM  | Radio                      | RF Modules, ICs, and Related components  |
| RLY  | Relay                      | Relays, SSR, etc                         |
| SEN  | Sensor                     | Environmental Sensors                    |
| SOC  | SystemOnChip               | SOC, SOM, SBC, MPU etc.                  |
| SWI  | Switch                     | All Types of Mechanical Switch           |
| TRN  | Transistor                 | BJT, FET, IGBT                           |


## Resistors
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

## Inductors
The lowest value I intend to capture is about 1nH. So I'll make `1000` equal to 1nH. This gives me the range from 0.01nH to 9.99H (jeez that's big).

Example of the encoding scheme. Note the the `NNN` digits will increment on ANY spec change other than inductance.

- 100nH 3.00x3.00 2A: **IND-000-1002**
- 120uH 3.00x3.00 2A: **IND-000-1205**
- 100nH 2.90x2.90 4A: **IND-001-1002**

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

Pin one indicator. Use them. Include pin 1 indicator on fabrication layer.<br><br>


---
# KiCad Database Setup
Big shout out to <a href="https://github.com/SumantKhalate/KiCad-libdb"> SumantKhalate </a> for posting his setup notes on GitHub, they were a life saver.<br>
At some point I'd like to do a video demo of the full setup, but lets kick that can down the road.