ANA - Analog Component Library

Please check that your device is listed below before adding it to this library.
Check that the component type does not already exist in a different library before adding below.
Consider making an entirely new library before adding a new component type below.

__Supported Component Types__
Opamps, Comparators, ADC, DAC, Digital Potentiometer

# Taxonomy
All components share the same base format `CCC-NNN-VVVV`. To help organize this component category, analog device have used the `NNN` digits to classify the device type as described below.

- `1N`x - Opamp
    - `10`x - General Purpose
    - `11`x - Precision, Low Noise
    - `12`x - High Speed > 20MHz GBWP
    - `13`x - Chopper, Zero Drift
    - `14`x - Instrumentation Amplifier
    - `15`x - High Power > 500mA
    - `16`x - Current Sense
    - `17`x to `18`x - <un>Unassigned</un>
    - `19`x - Other
    - Third digit defines number of channels

- `2N`x - Comparator
    - `20`x - General Purpose
    - `21`x - High Speed
    - `22`x - Window
    - `23`x to `28`x - <un>Unassigned</un> 
    - `29`x - Other
    - Third digit defines number of channels

- `3N`x - ADCs
    - `30`x - Successive Approximation Register
    - `31`x - Sigma Delta
    - `32`x to `38`x - <un>Unassigned</un> 
    - `39`x - Other

- `4N`x -  DAC
    - `40`x to `48`x - <un>Unassigned</un> 
    - `49`x - Other

- `9N`x - Other
    - `90`X - Digital Potentiometer
    - `99`X - Other

- xx`N` - Number of channels
    - xx`0` - More than 8 channel
    - xx`1` - Single Channel
    - xx`2` - Dual Channel
    - xx`3` - Three Channel
    - ...
    - xx`9` - Other

# Examples
  Component    | Description    | IPN (example)    
 ---------|----------|---------
