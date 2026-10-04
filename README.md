# Lab 1 – Sensor Measurement Data

This repository contains measurement data and MATLAB/Excel files from Lab 1
## Repository structure

```text
lab1/
├── Potentiometer/
│   ├── *.mat
│   ├── *.xlsx
│   └── block_upper_lower.png
│
└── magnetic/
    ├── Vout_mV/
    │   ├── *.mat
    │   └── *.xlsx
    ├── n_new/
    │   ├── 1/{no_shield,shield}/
    │   ├── 2/{no_shield,shield}/
    │   └── 3/{no_shield,shield}/
    ├── s_new/
    │   ├── 1/{no_shield,shield}/
    │   ├── 2/{no_shield,shield}/
    │   └── 3/{no_shield,shield}/
    ├── average_s_n_new/
    └── simulink.png
```

## Contents

- `Potentiometer/` – analog/digital measurement data, MATLAB files, Excel files, and a block diagram image.
- `magnetic/Vout_mV/` – magnetic-sensor output-voltage data in MATLAB and Excel formats.
- `magnetic/n_new/` – measurement sets organized by round (`1`–`3`) and `shield` / `no_shield` conditions.
- `magnetic/s_new/` – measurement sets organized by round (`1`–`3`) and `shield` / `no_shield` conditions.
- `magnetic/average_s_n_new/` – reserved directory for averaged/processed results.
- `magnetic/simulink.png` – Simulink setup/reference image.

## File formats

- `.mat` – MATLAB data files
- `.xlsx` – Excel measurement/result files
- `.png` – experiment/setup images

## Notes

The original measurement files are kept unchanged so they can be opened and analyzed directly in MATLAB or Excel.
