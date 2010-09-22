#!/bin/csh
echo this script produces USA hazard curves, 1 line per site.
echo Arg 1 is YEARMODA
if ($1a == a)goto cmdlineerror
../bin/combinehaz2007 < 1hz.2008.in
../bin/combinehaz2007 < 5hz.2008.in
../bin/combinehaz2007 < pga.2008.in
echo 1hz 5hz pga have been combined using combinehaz2007
mv UShazard.2008.1hz UShazard.$1.1hz
mv UShazard.2008.5hz UShazard.$1.5hz
mv UShazard.2008.pga UShazard.$1.pga
ls -l UShazard.2008*hz UShazard.2008*pga
exit 0
cmdlineerror:
echo Enter YEARMODA as arg 1. UShazard files will be renamed with this date
exit 1
