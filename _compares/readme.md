## Purpose
The `_compares` folder is indented for any parts comparison or analysis of alternates. The expected file structure is shown below. Relevant datasheets references by the comparison must be uploaded to the same sub-folder. When starting a new comparison, copy a template from the `_compares\_templates` folder. Eventually each component type should have its own template. 

Storing test results and similar data is discouraged. Info in this folder should generally contain paper analysis only. If circuit testing is/was required, mention it in the comparison, and link to its results.

**NOTE**- <u>Not every IPN needs its own comparison</u> to qualify alternates. However, it is strongly encouraged for mechancially or electriclaly complex components to aid in tracability and reduce risk.

<pre>
_compares/
├─ RES-013-0020/
│  ├─ compare.xlsx
│  ├─ mfr_mpn.pdf
│  ├─ mfr_mpn_2.pdf
│  ├─ mfr_mpn_3.pdf
├─ TRN-002-0400/
│  ├─ compare.xlsx
│  ├─ mfr_mpn.pdf
├─ _templates/
│  ├─ res_compare.xlsx
</pre>