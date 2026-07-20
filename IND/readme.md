IND - Inductor Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
Inductors, Transformers, Chokes, Magnetics

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, inductors have used the `NNN` and `VVVV` digits to classify the component as described below.

The lowest value I intend to capture is about 1nH. So I'll make `1000` equal to 1nH. This gives me the range from 0.01nH to 9.99H (jeez that's big).

The 3-digit code `NNN` should be incremented whenever any parameter, other than inductance, is changed. In this way components listed under the same `NNN` code should be **identical in every metric except inductance**.

Example of the encoding scheme.
- 100nH 3.00x3.00 2A: **IND-000-1002**
- 120uH 3.00x3.00 2A: **IND-000-1205**
- 100nH 2.90x2.90 4A: **IND-001-1002**