#!/bin/csh
# this script combines WUS and CEUS hazard files. CEUS sampled at half density dx dy
set PATH = ( /home/harmsen/bin $PATH)
if ($1 == ALT || $1 == alt ) goto ALT
#if ($1 == 67 || $1 == wt67 ) goto WT67
echo write matrix of US hazard for 3 frequencies and 3 return times
combineL.v2 < combineL.1hz.10pc50
combineL.v2 < combineL.1hz.2pc50
combineL.v2 < combineL.1hz.5pc50
combineL.v2 < combineL.5hz.10pc50
combineL.v2 < combineL.5hz.2pc50
combineL.v2 < combineL.5hz.5pc50
combineL.v2 < combineL.pga.10pc50
combineL.v2 < combineL.pga.2pc50
combineL.v2 < combineL.pga.5pc50
exit 0
#WT67:
#if ($2 == LOWPR ) goto LOWPR
#combineL.v2 < combineL67.1hz.2pc50
#combineL.v2 < combineL67.5hz.2pc50
#combineL.v2 < combineL67.pga.2pc50
#combineL.v2 < combineL67.1hz.10pc50
#combineL.v2 < combineL67.5hz.10pc50
#combineL.v2 < combineL67.pga.10pc50
#combineL.v2 < combineL67.1hz.5pc50
#combineL.v2 < combineL67.5hz.5pc50
#combineL.v2 < combineL67.pga.5pc50
#LOWPR:
#combineL.v2 < combineL67.1hz.0.5pc50
#combineL.v2 < combineL67.5hz.0.5pc50
#combineL.v2 < combineL67.pga.0.5pc50
#echo Alternate wt WUS files have been combined with ceus files
#exit 0
ALT:
echo write matrix of US hazard for 4 spectral frequencies and 3 return times
combineL.v2 < combineL.10hz.10pc50
combineL.v2 < combineL.10hz.2pc50
combineL.v2 < combineL.10hz.5pc50
combineL.v2 < combineL.3hz.10pc50
combineL.v2 < combineL.3hz.2pc50
combineL.v2 < combineL.3hz.5pc50
combineL.v2 < combineL.2hz.10pc50
combineL.v2 < combineL.2hz.2pc50
combineL.v2 < combineL.2hz.5pc50
combineL.v2 < combineL.2sc.10pc50
combineL.v2 < combineL.2sc.2pc50
combineL.v2 < combineL.2sc.5pc50
echo Completed. Return times that were computed are 2%50 10%50 and 5%50yrs.
exit 0
