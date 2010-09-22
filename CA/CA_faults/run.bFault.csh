#!/bin/csh
echo Run the California bFault files. GR branches on the 0.8 and 0 b value
echo These input files are current as of March 26 2008
# cd /home/harmsen/CA

if ($1 == char)goto char
./hazFXnga7c CA_bFaults.Apr3/bFault_stitched_D2.4_GR0.in  > b1.log
# GR0 in input file name is a code to indicate branching on b-value is done
# in these files.
# There is a specified b value and an implied b=0 internally developed in the run
./hazFXnga7c CA_bFaults.Apr3/bFault_unstitched_D2.4_GR0.in  > b2.log
./hazFXnga7c CA_bFaults.Apr3/bFault_unstitched_D2.1_GR0.in  > b3.log
./hazFXnga7c CA_bFaults.Apr3/bFault_stitched_D2.1_GR0.in  > b4.log
char:
./hazFXnga7c CA_bFaults.Apr3/bFault_stitched_D2.4_Char.in  > b5.log
./hazFXnga7c CA_bFaults.Apr3/bFault_unstitched_D2.4_Char.in  > b6.log
./hazFXnga7c CA_bFaults.Apr3/bFault_unstitched_D2.1_Char.in  > b7.log
./hazFXnga7c CA_bFaults.Apr3/bFault_stitched_D2.1_Char.in  > b8.log
echo Eight California bFault runs have been completed.

# FIXME: Fortran code doesn't let you specify output file?
mv resample.fault resample-faultb.fault
exit 0
