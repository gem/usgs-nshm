#!/bin/csh
# combines fault hazard curves from three branches (central + and -) for WUS, 2008
echo This script combines the fault hazard curves for WUS sources with gnd epistemic uncert
echo Set arg 1 to 2008 for dip-uncert branching, set arg1 to nodip for 0-wt to dip branching
if ($1 == 2008 ) goto 2008
if ($1 == 2hz ) goto 2hz
if ($1 == cb ) goto cb
if ($1 == dipuncert) goto 2008
2008:
hazallXL.v2 combine.1hz.2008.crv.p
hazallXL.v2 combine.1hz.2008.crv.m
hazallXL.v2 combine.1hz.2008.crv
hazallXL.v2 combine.5hz.2008.crv
hazallXL.v2 combine.5hz.2008.crv.p
hazallXL.v2 combine.5hz.2008.crv.m
hazallXL.v2 combine.pga.2008.crv
hazallXL.v2 combine.pga.2008.crv.p
hazallXL.v2 combine.pga.2008.crv.m
echo Next you should combine the 3 median uncert hazard using available scripts.
echo Example script combine.2008h.csh, which outputs hazard curves. Or, combine.2008.csh, outputs 2%50 motions
ls -l combine.2008h.csh
exit 0
2hz:
hazallXL.v2 combine.2hz.crv
hazallXL.v2 combine.2hz.crv.m
hazallXL.v2 combine.2hz.crv.p
ls -l wus.2hz.*.crv*
exit 0
cb:
hazallXL.v2 combine.1hz.cba.crv.p
hazallXL.v2 combine.1hz.cba.crv.m
hazallXL.v2 combine.1hz.cba.crv
exit 0
nodip:
hazallXL.v2 combine.1hz.nodip.crv.p
hazallXL.v2 combine.1hz.nodip.crv.m
hazallXL.v2 combine.1hz.nodip.crv
hazallXL.v2 combine.5hz.nodip.crv
hazallXL.v2 combine.5hz.nodip.crv.p
hazallXL.v2 combine.5hz.nodip.crv.m
hazallXL.v2 combine.pga.nodip.crv
hazallXL.v2 combine.pga.nodip.crv.p
hazallXL.v2 combine.pga.nodip.crv.m
echo Next you should combine the 3 median uncert hazard using available scripts.
exit 0

