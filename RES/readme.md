RES - Resistor Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
Resistors, Resistor networks, potentiometers

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, resistors have used the `NNN` and `VVVV` digits to classify the component as described below.

The 4-digit `VVVV` is used to encode the component value. For example 1234 is 1.23*10^4 (12.3kΩ). If you are unable to encode the exact value it is still recommended that you encode the closest possible value (as opposed some random value like 9999).

The 3-digit code `NNN` should be incremented whenever any parameter, other than resistance, is changed. In this way components listed under the same `NNN` code should be **identical in every metric except resistance**.

Example Codes below:
- 1K   0805 1%: **RES-002-1003**
- 3.3K 0805 1%: **RES-002-3303**
- 2.2K 0805 5%: **RES-003-2203** (different tolerance)
- 1  0603 0.1%: **RES-004-1000** (different tolerance and package)
- 10 0603 0.1%  **RES-004-1001**

# FUTURE NOTE
There has been no agreement yet how to encode values below 0.01Ω. I will either (1) **ignore the version digits**, or (2) change the encoding scheme for mΩ resistors.