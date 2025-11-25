TRN - Transistor Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
MOSFET, BJT, JFET

*NOTE*
Simple IC's may count as well. Darlington pair.

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, transistors have used the `NNN` digits to classify the device type as described below.

The first two digits classify the device type, and the last digit is a sub-type of that class.<br>
For example, a **BJT** is a family of transistors that has the sub-type **NPN**.

- `00x` - Bipolar Junction Transistor - BJT
  - 00`0` - NPN
  - 00`1` - PNP
  - 00`2` - Complimentary
  - 00`3` - Darlington NPN 
  - 00`4` - Darlington PNP
  - 00`5` to `8` - <u>Unassigned</u>
  - 00`9` - Other
- `01x` - Metal Oxide Semiconductor Field Effect Transistor - MOSFET
  - 01`0` - NMOS
  - 01`1` - PMOS
  - 01`2` - Complimentary
  - 00`3` to `8` - <u>Unassigned</u>
  - 01`9` - Other
- `02x` - Junction Field Effect Transistor - JFET
    - TBD
- `03x` - Insulated Gate Bipolar Transistor - IGBT
    - TBD

## Examples
  Component    | Description    | IPN (example)    
 ---------|----------|---------
  Onsemi, 2N3906      | BJT, PNP       | TRN-001-1021         
  onsemi, 2N7000      | MOSFET, N-Channel       | TRN-010-9204         
