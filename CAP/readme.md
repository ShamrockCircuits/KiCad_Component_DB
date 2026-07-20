CAP - Capacitor Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
All Capacitors.
No Batteries. (However Lithium-Ion Capacitors are allowed)

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, capacitors have used the `NNN` and `VVVV` digits to classify the component as described below.

`VVVV` uses 3-digits to encode the value, and one digit to encode the dielectric type. The **third digit** `xxVx` is the number of **zeros in pF**. For example, 103 is 10000pF or 10nF. The remaining digit `xxxV` encodes the dielectric as shown below...
 - 0 - None
 - 1 - X5R
 - 2 - X7R
 - 3 - C0G/NP0
 - *4 to 9 - spare*

The 3-digit code `NNN` should be incremented whenever any parameter, other than capacitance, is changed. In this way components listed under the same `NNN` code should be **identical in every metric except capacitance**.

Example of the encoding scheme.

- 100nF 0603 X5R: **CAP-000-1041**
- 100nF 0603 X7R: **CAP-000-1042**
- 220nF 0805 X5R: **CAP-001-2241**

# FUTURE NOTE
If you are unable to encode the capacitor value in the 3-digits assign `VVVV` as `000V`. Where the last `V` still signifies the dielectric. *NOTE - I haven't had to do this yet, it might change when I encounter my first issue*