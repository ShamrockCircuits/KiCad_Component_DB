REG - Regulator Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
Buck/boost Converter, LDO, Switcher IC

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, regulators have used the `NNN` digits to classify the device type as described below.

The first digit specifies the power domain, and the next two digits classify the topology.
Power management devices and regulators are complicated to organize... I'm intentionally leaving **REG** taxonomy somewhat blank.
As new devices are added I will see what classifications are required.

- `Nxx` - Power Domain
    - `0`xx - AC/DC
    - `1`xx - DC/DC
    - `2`xx - DC/AC
    - `3`xx to `8`xx - <u>Unassigned</u>
    - `9`xx - Other / Mixed

- `xNN` - Topology
    - x`10` to x`19` - LDO
        - x`10` - References
        - x`11` - Low Current <0.25A
        - x`12` - High Current >=0.25A
        - x`13` to `18` - <u>Unassigned</u>
        - x`19` - OTHER

    - x`20` to x`29` - Switching Controller
        - x`21` - Boost
        - x`22` - Buck
        - x`23` - Buck-Boost
        - x`24` - Cuk
        - x`25` - Flyback
        - x`26` - Sepic
        - x`27` - Push-Pull
        - x`27` to `28` - <u>Unassigned</u>
        - x`29` - OTHER

    - x`30` to x`39` - Voltage Regulators
        - x`31` - Boost
        - x`32` - Buck
        - x`33` - Buck-Boost
        - x`37` to `38` - <u>Unassigned</u>
        - x`39` - OTHER

    - x`40` to x`99` - <u>Unassigned</u>