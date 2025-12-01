SWI - Switch Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
Buttons (tactile, rocker)

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, mechanical switches have used the `NNN` digits to classify the device type as described below.

  - `0`xx - \<un\>Unassigned\</un\>

  - `1`xx - Push Actuated
    - `10`x - Tactile Switch (PCB Mount, momentary)
    - `11`x - Pushbutton (Panel Mount / Standard)
    - `12`x - Snap Action / Microswitch (Limit Switch)
    - `13`x to `18`x - \<un\>Unassigned\</un\>
    - `19`x - Other

  - `2`xx - Slide & Toggle Actuated
    - `20`x - Toggle Switch (Bat Handle)
    - `21`x - Slide Switch
    - `22`x - DIP Switch
    - `23`x to `28`x - \<un\>Unassigned\</un\>
    - `29`x - Other

  - `3`xx - Rotary Actuated
    - `30`x - Mechanical Rotary Selector
    - `31`x - Mechanical Encoder
    - `32`x to `38`x - \<un\>Unassigned\</un\>
    - `39`x - Other

  - `4`xx to `8`xx - \<un\>Unassigned\</un\>

  - `9`xx - Other

  - xx`N` - Poles / Positions Configuration
    - *For standard switches (Toggle/Push), this defines Poles.*
    - *For Array switches (DIP), this defines Number of switches.*
    - xx`0` - More than 8 positions / poles
    - xx`1` - 1-Pole / 1-Position (ex: SPST or SPDT)
    - xx`2` - 2-Pole / 2-Position 
    - xx`3` - 3-Pole / 3-Position
    - xx`4` - 4-Pole / 4-Position
    - xx`5` - 5-Pole / 5-Position
    - xx`6` - 6-Pole / 6-Position
    - xx`7` - 7-Pole / 7-Position
    - xx`8` - 8-Pole / 8-Position
    - xx`9` - Other

# Examples

Component | Description | IPN (example)
---------|----------|---------
**B3F-1000** | Tactile Switch, SPST-NO, Through Hole | `SWI-101-0001`
**100SP1** | Toggle Switch, SPDT, Panel Mount | `SWI-201-0001`
**KAE-04** | DIP Switch, 4 Switch (4x SPST) | `SWI-224-0001`
**SS-12D** | Slide Switch, SPDT | `SWI-211-0001`