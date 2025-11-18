# KiCad_Component_DB
# KiCad File Types
I often forget what file extensions are related to which data type. Here's an overview of the file extensions we will encouNter while working in with KiCad components.

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
| Solder Bridge     | FAB           | CON, MEC                      |


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


## Resistors / RES
4-digit encoding. For example 1234 is 1.23*10^4 (12.3kΩ). If you are unable to encode the exact value it is still recommended that you encode the closest possible value.

- 1K   0805 1%: **RES-002-1003**
- 3.3K 0805 1%: **RES-002-3303**
- 2.2K 0805 5%: **RES-003-2203** (different tolerance)
- 1  0603 0.1%: **RES-004-1000**
- 10 0603 0.1%  **RES-004-1001**

There has been no agreement yet how to encode values below 0.01Ω. I will either (1) **ignore the version digits**, or (2) change the encoding scheme for mΩ resistors. Likely I will follow option (1).

## Capacitors / CAP
Value uses 3-digit encoding. Where the **third digit** is the number of **zeros in pF**. For example, 103 is 10nF. The remaining digit is used to encode the dielectric type. Common combinations (that I typically use) have been encoded roughly  in accordance with their popularity.  
 - 0 - None
 - 1 - X5R
 - 2 - X7R
 - 3 - C0G/NP0
 - *4 to 9 - spare*

Example of the encoding scheme.

- 100nF 0603 X5R: **CAP-000-1041**
- 100nF 0603 X7R: **CAP-000-1042**
- 220nF 0805 X5R: **CAP-001-2241**

If you are unable to encode the capacitor value in the 3-digits assign `VVVV` as `000V`. Where the last `V` still signifies the dielectric. *NOTE - I haven't had to do this yet, it might change when I encounter my first issue*

## Inductors / IND
The lowest value I intend to capture is about 1nH. So I'll make `1000` equal to 1nH. This gives me the range from 0.01nH to 9.99H (jeez that's big).

Example of the encoding scheme. Note the the `NNN` digits will increment on ANY spec change other than inductance.

- 100nH 3.00x3.00 2A: **IND-000-1002**
- 120uH 3.00x3.00 2A: **IND-000-1205**
- 100nH 2.90x2.90 4A: **IND-001-1002**

## Connectors / CNT
Last four digits will be encoded as follows. The **first digit** signifies the pin gender.
- 0 - Female
- 1 - Male
- 2 - Genderless
- 3 - Hermaphrodite
- 4 - PCB Footprint 
 <br>*from a layout perspective the connector is just a footprint w/o a part, some programming headers for example*
- 5... 9 - Others


## Symbols & Footprints
Since the same symbol/footprint might be reused by several IPNs, the symbol/footprint **name should not contain any IPN data**. Instead we will use **generic sequential numbering**. For example the first diode symbol will be `SYM-DIO-0000`, the next would be **SYM-DIO-0001**. Details about the symbol can be stored in the meta data of the symbol.

Similarly footprint names will be generated sequentially, starting with `FTP-DIO-0000`.

There is no link between `SYM-<CAT>-1234` and `FTP-<CAT>-1234`.
For example `SYM-<CAT>-1234` could use `FTP-<CAT>-0200`. *NOTE - Future me... I'm already somewhat regretting this decision. Having the name look so similar, tricks me into thinking they're related very often.*


**Why no footprint or symbol variants?**
The database provides atomic parts. Each IPN has to be assigned only a single symbol and a single footprint. If we start adding symbol and footprint variants, then I would need to create a unique IPN for every possible combination.

### Creating New Footprints
Reminders for myself...

Silkscreen Text -> W/H/T -> 0.6/0.6/0.1mm

Fabrication reference designator should be placed center on the component. Make it whatever text size is reasonable to fit within the part. Max out at the same width, height and thickness as the silkscreen.

Pin one indicator. Use them. Include pin 1 indicator on fabrication layer.<br><br>


---
# KiCad Database Setup
Big shout out to <a href="https://github.com/SumantKhalate/KiCad-libdb"> SumantKhalate </a> for posting his setup notes on GitHub, they were a life saver.<br>
At some point I'd like to do a video demo of the full setup, but lets kick that can down the road.

## Reminder For Me... Setting Up New KiCad Install
To setup this project on a new computer or fresh install of KiCad (in addition to the database setup above). We basically just need to add some paths to the symbol and footprint manager... we could do this directly in KiCad but I find it easier to modify the json files stored in **"C:\Users\your_name\AppData\Roaming\kicad\9.0"**.

### Modify kicad_common.json - Create a new env
The new environment variable tells KiCad where our database is stored. All parts in the database will use the path **KICAD_USER_CUSTOM_LIB**.
<pre>
  "environment": {
    "vars": {
      "KICAD_USER_3DMODEL_DIR": "${KIPRJMOD}\\3dmodels",
      "KICAD_USER_CUSTOM_LIB": "C:\\APPS\\KiCad_Component_DB" <------- ADD ME
    }
  },  </pre>

### Modify "sym-lib-table" - Add Symbols
Open **sym-lib-table** in a text editor and paste the following at the bottom of the file. 

<pre>
  (lib (name "libdb")(type "Database")(uri "${KICAD_USER_CUSTOM_LIB}/libdb.kicad_dbl")(options "")(descr "Custom Component Database"))
  (lib (name "0-ANA")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/ANA/ANA.kicad_sym")(options "")(descr "Op-amps, Comparators, A/D, D/A"))
  (lib (name "0-CAP")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CAP/CAP.kicad_sym")(options "")(descr "Capacitors"))
  (lib (name "0-CNT")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CNT/CNT.kicad_sym")(options "")(descr "Connectors"))
  (lib (name "0-CPD")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CPD/CPD.kicad_sym")(options "")(descr "Circuit Protection Devices (MOV, Varistor, Fuse, ect)"))
  (lib (name "0-DIO")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/DIO/DIO.kicad_sym")(options "")(descr "Diodes (Zener, TVS, LED, Schottky, Standard)"))
  (lib (name "0-FAB")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/FAB/FAB.kicad_sym")(options "")(descr "Fabrication specific elements (Fiducial, Tooling Holes, Mouse Bites)"))
  (lib (name "0-ICS")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/ICS/ICS.kicad_sym")(options "")(descr "General Integrated Circuits"))
  (lib (name "0-IND")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/IND/IND.kicad_sym")(options "")(descr "Inductors, Transformers, Chokes, Magnetics"))
  (lib (name "0-MCU")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MCU/MCU.kicad_sym")(options "")(descr "Microcontrollers, Modules, etc."))
  (lib (name "0-MEC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MEC/MEC.kicad_sym")(options "")(descr "Mechanical components (Mounting holes, etc)"))
  (lib (name "0-MRK")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MRK/MRK.kicad_sym")(options "")(descr "Symbols, Logos and Graphics... ie Non-BOM"))
  (lib (name "0-OPT")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/OPT/OPT.kicad_sym")(options "")(descr "Optocouplers, phototransistor, SSR etc."))
  (lib (name "0-OSC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/OSC/OSC.kicad_sym")(options "")(descr "Oscillators, Crystals"))
  (lib (name "0-REG")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/REG/REG.kicad_sym")(options "")(descr "Regulators (LDO, Buck, Boost, Flyback, ect)"))
  (lib (name "0-RES")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RES/RES.kicad_sym")(options "")(descr "Resistors"))
  (lib (name "0-RFM")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RFM/RFM.kicad_sym")(options "")(descr "RF Modules, ICs, and Related components"))
  (lib (name "0-RLY")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RLY/RLY.kicad_sym")(options "")(descr "Relays, SSR, etc"))
  (lib (name "0-SEN")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SEN/SEN.kicad_sym")(options "")(descr "Environmental Sensors"))
  (lib (name "0-SOC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SOC/SOC.kicad_sym")(options "")(descr "SOC, SOM, SBC, MPU etc."))
  (lib (name "0-SWI")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SWI/SWI.kicad_sym")(options "")(descr "All Types of Mechanical Switch"))
  (lib (name "0-TRN")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/TRN/TRN.kicad_sym")(options "")(descr "BJT, FET, IGBT"))
</pre>

### Modify "fp-lib-table" - Add Symbols
Open **fp-lib-table** in a text editor and paste the following at the bottom of the file.

<pre>
  (lib (name "1-PACKAGES")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/_PACKAGES/PACKAGES.pretty")(options "")(descr "Generic packages used across multiple libraries"))
  (lib (name "0-ANA")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/ANA/ANA.pretty")(options "")(descr "Op-amps, Comparators, A/D, D/A"))
  (lib (name "0-CAP")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CAP/CAP.pretty")(options "")(descr "Capacitors"))
  (lib (name "0-CNT")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CNT/CNT.pretty")(options "")(descr "Connectors"))
  (lib (name "0-CPD")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/CPD/CPD.pretty")(options "")(descr "Circuit Protection Devices (MOV, Varistor, Fuse, ect)"))
  (lib (name "0-DIO")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/DIO/DIO.pretty")(options "")(descr "Diodes (Zener, TVS, LED, Schottky, Standard)"))
  (lib (name "0-FAB")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/FAB/FAB.pretty")(options "")(descr "Fabrication specific elements (Fiducial, Tooling Holes, Mouse Bites)"))
  (lib (name "0-ICS")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/ICS/ICS.pretty")(options "")(descr "General Integrated Circuits"))
  (lib (name "0-IND")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/IND/IND.pretty")(options "")(descr "Inductors, Transformers, Chokes, Magnetics"))
  (lib (name "0-MCU")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MCU/MCU.pretty")(options "")(descr "Microcontrollers, Modules, etc."))
  (lib (name "0-MEC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MEC/MEC.pretty")(options "")(descr "Mechanical components (Mounting holes, etc)"))
  (lib (name "0-MRK")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/MRK/MRK.pretty")(options "")(descr "Symbols, Logos and Graphics... ie Non-BOM"))
  (lib (name "0-OPT")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/OPT/OPT.pretty")(options "")(descr "Optocouplers, phototransistor, SSR etc."))
  (lib (name "0-OSC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/OSC/OSC.pretty")(options "")(descr "Oscillators, Crystals"))
  (lib (name "0-REG")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/REG/REG.pretty")(options "")(descr "Regulators (LDO, Buck, Boost, Flyback, ect)"))
  (lib (name "0-RES")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RES/RES.pretty")(options "")(descr "Resistors"))
  (lib (name "0-RFM")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RFM/RFM.pretty")(options "")(descr "RF Modules, ICs, and Related components"))
  (lib (name "0-RLY")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/RLY/RLY.pretty")(options "")(descr "Relays, SSR, etc"))
  (lib (name "0-SEN")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SEN/SEN.pretty")(options "")(descr "Environmental Sensors"))
  (lib (name "0-SOC")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SOC/SOC.pretty")(options "")(descr "SOC, SOM, SBC, MPU etc."))
  (lib (name "0-SWI")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/SWI/SWI.pretty")(options "")(descr "All Types of Mechanical Switch"))
  (lib (name "0-TRN")(type "KiCad")(uri "${KICAD_USER_CUSTOM_LIB}/TRN/TRN.pretty")(options "")(descr "BJT, FET, IGBT"))
</pre>

### Check It Worked
Once done save all the files and reopen KiCad... Things should now be working.
In the future I may mark all these libraries as hidden since we should ONLY be interacting with them through the lib-db.