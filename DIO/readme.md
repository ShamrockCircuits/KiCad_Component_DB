DIO - Diode Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
TVS, Schottky, Zener, Standard, LED

# Taxonomy

- `N`xx - Device Type

    - `0`xx - Standard Silicon Diode
        ---
        - x`0`x - Maximum Reverse Voltage
        - x`0`x - 0 ≤ VR<sub>max</sub> ≤ 25V
        - x`1`x - 25 < VR<sub>max</sub> ≤ 50V
        - x`2`x - 50 < VR<sub>max</sub> ≤ 100V
        - x`3`x - 100 < VR<sub>max</sub> ≤ 200V
        - x`4`x - 200 < VR<sub>max</sub> ≤ 500V
        - x`5`x - 500 < VR<sub>max</sub> ≤ 1000V
        - x`6`x - VR<sub>max</sub> greater than 1000V
        - x`7`x - <un>Unassigned</un>
        - x`8`x - <un>Unassigned</un>
        - x`9`x - Other / Specialty
        ---
        - xx`0` - Maximum Continuous or Average Current
        - xx`0` - 0 ≤ Io<sub>avg</sub> ≤ 100mA
        - xx`1` - 100 < Io<sub>avg</sub> ≤ 250mA
        - xx`2` - 250 < Io<sub>avg</sub> ≤ 500mA
        - xx`3` - 100 < Io<sub>avg</sub> ≤ 500mA
        - xx`4` - 0.5 < Io<sub>avg</sub> ≤ 1.0A
        - xx`5` - 1.0 < Io<sub>avg</sub> ≤ 2.5A
        - xx`6` - 2.5 < Io<sub>avg</sub> ≤ 5A
        - xx`7` - 5 < Io<sub>avg</sub> ≤ 10A
        - xx`8` - <un>Unassigned</un>
        - xx`9` - Other / Specialty

    - `1`xx - Schottky Diode
    - `2`xx - Zener Diode

    - `3`xx - TVS Diode
        - x`N`x - Reverse Standoff Voltage (VWM)
        - `30`x - 0 ≤ VWM<sub>typ</sub> ≤ 2.5V
        - `31`x - 2.5 < VWM<sub>typ</sub> ≤ 4.5V
        - `32`x - 4.5 < VWM<sub>typ</sub> ≤ 8.5V
        - `34`x - 8.5 < VWM<sub>typ</sub> ≤ 12V
        - `35`x - <un>Unassigned</un>
        - `36`x - <un>Unassigned</un>
        - `37`x - <un>Unassigned</un>
        - `38`x - <un>Unassigned</un>
        - `39`x - Other

    - `4`xx - Light Emitting Diode
        - `40`x - white
        - `41`x - Red
        - `42`x - Green
        - `43`x - Blue
        - `44`x - Yellow
        - `45`x - Orange/Amber
        - `46`x - <un>Unassigned</un>
        - `47`x - <un>Unassigned</un>
        - `48`x - <un>Unassigned</un>
        - `49`x - Other, Specialty, Multi

    - `5`xx - Photodiode
    - `6`xx - <un>Unassigned</un>
    - `7`xx - <un>Unassigned</un>   
    - `8`xx - <un>Unassigned</un>
    - `9`xx - OTHER

- xx`N` - Number of elements / lines or _some_other_spec_tbd_
    - *This somewhat depends on the device type... care to be taken when adding new parts*
    - xx`0` - More than 4 elements / lines
    - xx`1` - 1 element / line
    - xx`2` - 2 elements / lines
    - xx`3` - 3 elements / lines
    - xx`4` - 4 elements / lines
    - xx`5` - <un>Unassigned</un>
    - xx`6` - <un>Unassigned</un>
    - xx`7` - <un>Unassigned</un>
    - xx`8` - <un>Unassigned</un>
    - xx`9` - Other
