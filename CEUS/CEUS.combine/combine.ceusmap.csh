#!/bin/csh
if ($1 == alt ) goto alt
echo this script makes map probabilistic motions, 2%50 and 10%50 pe
echo This script was designed for running on a Solaris OS computer. Windows needs work.
hazallXL.v2 combine.ceus_f.1hz.10pc50
hazallXL.v2 combine.ceus_f.1hz.2pc50
hazallXL.v2 combine.ceus_f.5hz.10pc50
hazallXL.v2 combine.ceus_f.5hz.2pc50
hazallXL.v2 combine.ceus_f.pga.10pc50
hazallXL.v2 combine.ceus_f.pga.2pc50
ls -l CEUShazard.2007.*.2pc50 CEUShazard.2007.*.10pc50
exit 0
alt:
hazallXL.v2 combine.ceus_f.10hz.2pc50
hazallXL.v2 combine.ceus_f.2hz.2pc50
hazallXL.v2 combine.ceus_f.2sc.2pc50
hazallXL.v2 combine.ceus_f.3hz.2pc50
ls -l CEUShazard.2007.*.2pc50
exit 0
