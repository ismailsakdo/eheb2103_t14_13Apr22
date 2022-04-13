* Encoding: UTF-8.

DATASET ACTIVATE DataSet0.

WEIGHT BY freq.

SORT CASES  BY type.
SPLIT FILE LAYERED BY type.

CROSSTABS
  /TABLES=exposure BY outcome
  /FORMAT=AVALUE TABLES
  /STATISTICS=RISK 
  /CELLS=COUNT
  /COUNT ROUND CELL.

SPLIT FILE OFF.

///

USE ALL.
COMPUTE filter_$=(type = 1).
VARIABLE LABELS filter_$ 'type = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=exposure BY outcome
  /FORMAT=AVALUE TABLES
  /STATISTICS=RISK 
  /CELLS=COUNT
  /COUNT ROUND CELL.

///


USE ALL.
COMPUTE filter_$=(type = 2).
VARIABLE LABELS filter_$ 'type = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 2 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=exposure BY outcome
  /FORMAT=AVALUE TABLES
  /STATISTICS=RISK 
  /CELLS=COUNT
  /COUNT ROUND CELL.



