#!/bin/csh
# combines fault hazard with gridded hazard
if ($1 == ALT || $1 == alt ) goto ALT
hazallXL.v2 combine.2008h.1hz
hazallXL.v2 combine.2008h.5hz
hazallXL.v2 combine.2008h.pga
echo Hazard curves for WUS sources prepared. file names WUShazard.2008.*
ls -l WUShazard.2008.*
exit 0
exit 0
ALT:
hazallXL.v2 combine.2008h.10hz
hazallXL.v2 combine.2008h.3hz
hazallXL.v2 combine.2008h.2hz
hazallXL.v2 combine.2008h.2sc
echo Hazard curves for WUS sources prepared. file names WUShazard.2008.*
ls -l WUShazard.2008.*

echo Alternate periods are the newer additions to this family
exit 0
