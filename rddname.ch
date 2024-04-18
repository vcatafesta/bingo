//#DEFINE FOXPRO
#IFDEF FOXPRO
  #include "sixnsx.ch"
  #define MEMOEXT ".SMT"
  #define INDEXEXT ".NSX"
  #define RDDNAME "SIXNSX"
  #Define CEXT    "NSX"
#ELSE
  #include "sixntx.ch"
  #define MEMOEXT ".DBT"
  #define INDEXEXT ".NTX"
  #define RDDNAME "DBFNTX"
  #Define CEXT    "NTX"
#ENDIF
