#!/bin/csh
echo Combining the NMSZ Charleston and other CEUS haz curves, output files are Binary hazard curves
echo Cshell script for Solaris systems. May need modification for others.
if ($1 == alt ) goto alt
hazallXL.v2 combine.ceus_f.1hz.crv
hazallXL.v2 combine.ceus_f.5hz.crv
hazallXL.v2 combine.ceus_f.pga.crv
ls -l CEUShazard.2007.*.crv
exit 0
alt:
echo Alternate period set, 0.1 s, 0.3 s, 0.5 s, and 2.0 s, respectively.
hazallXL.v2 combine.ceus_f.10hz.crv
hazallXL.v2 combine.ceus_f.3hz.crv
hazallXL.v2 combine.ceus_f.2hz.crv
hazallXL.v2 combine.ceus_f.2sc.crv
ls -l CEUShazard.2007.*.crv
exit 0
