#!/bin/csh
# Non-CA WUS fault hazard for 2007  SHarmsen plus Goose Lake in CA
echo WUS faults, with October 2007 updates
echo BRange updates include branching on fault dip uncertainty, 40 and 60 d dips
cd /home/harmsen/EXT
if ($1 == wasatch ) goto wasatch
if ($1 == utah ) goto utah
echo brange includes Basin and Range states AZ, MT, ID, CO, TX, WY, and NM
echo Oregon is now divided into two models, coastal compressional and BR extensional
set PacNW = /home/harmsen/PacNW
if ($1 == pacnw ) goto pacnw
hazFXnga7c brange.char >brange.log &
hazFXnga7c brange.d60.char > br.d60c.log&
hazFXnga7c brange.d40.char > br.d40c.log&
hazFXnga7c brange.gr >brangegr.log &
hazFXnga7c brange.d60.gr >brangegr60.log &
hazFXnga7c brange.d40.gr >brangegr40.log &
hazFXnga7c brange.65 >brange.65.log &
hazFXnga7c brange.d60.65 >brange60.65.log &
hazFXnga7c brange.d40.65 >brange40.65.log &
echo Next Nevada faults
hazFXnga7c nv.char >nv.log &
hazFXnga7c nv.gr >nv.log
hazFXnga7c nv.65 >nv.65.log
hazFXnga7c nv.d40.char >nv.d40.log &
hazFXnga7c nv.d40.gr >nvgr.d40.log
hazFXnga7c nv.d40.65 >nv65.d40.log
hazFXnga7c nv.60d.char >nv.d60.log &
hazFXnga7c nv.d60.gr >nvgr60.log
hazFXnga7c nv.60d.65 >nv65.d60.log
pacnw:
echo Next Oregon and Washington faults. Seattle FZ is separate run
hazFXnga7c $PacNW/orwa_c.char >orwa.log &
# new oct 4 basin and range portion of Oregon. These have different wts in the logic tree
# compressional-src wts are 50% char 50% GR, extensional are 67%char 33% GR.
hazFXnga7c $PacNW/orwa_n.char >orwan.log&
# ORegon extensional also have normal fault dip uncert, 40 and 60 d branches
hazFXnga7c $PacNW/orwa_n.d60.char >orwan60.log&
hazFXnga7c $PacNW/orwa_n.d40.char >orwan40.log&
hazFXnga7c $PacNW/orwa_c.gr >orwag.log
hazFXnga7c $PacNW/orwa_n.gr >orwag.log
hazFXnga7c $PacNW/orwa_n.d60.gr >orwag60.log
hazFXnga7c $PacNW/orwa_n.d40.gr >orwag40.log
hazFXnga7c $PacNW/seattleFZ.in > seattlefz.log&
# the M6.5- are full weight in coast and interior, so dont need two files
hazFXnga7c $PacNW/orwa.65 >orwa6.log
if ($1 == pacnw ) exit 0
utah:
echo Next Utah except for Wasatch 
hazFXnga7c ut.char >utc.log &
hazFXnga7c ut.gr >utg.log
hazFXnga7c ut.65 >ut65.log
# Utah normal faults, with 60 d and 40 d branches for dip uncertainty
hazFXnga7c ut.d60.char >utch.d60.log &
hazFXnga7c ut.60d.gr >utgr.60d.log
hazFXnga7c ut.d60.65 >ut65.d60.log
hazFXnga7c ut.d40.char >utch.d40.log &
hazFXnga7c ut.40d.gr >utgr.40d.log
hazFXnga7c ut.40d.65 >ut65.d40.log
if ($1 == utah ) exit 0
wasatch: 
echo Next Wasatch 
hazFXnga7c wasatch.char >wasatchc.log
hazFXnga7c wasatch.d40.char >wasatchc40.log
hazFXnga7c wasatch.d60.char >wasatchc60.log
hazFXnga7c wasatch.gr >wasatch.log &
hazFXnga7c wasatch.d40.gr >wasatch.d40.log &
hazFXnga7c wasatch.d60.gr >wasatch.d60.log &
# the floating M7.4 along wasatch, slip rate is 1.2 mm/yr for this model MP Feb 9 2007
echo Wasatch floating M7.4 with M-uncert and dip-uncert
hazFXnga7c wasatch74.gr >wasatch74.log &
hazFXnga7c wasatch74.d40.gr >wasatch74.d40.log &
hazFXnga7c wasatch74.d60.gr >wasatch74.d60.log &

echo Extensional WUS faults plus Wash. and Oreg. faults have been run
echo Alternate dip branches at 40 and 60 degrees have been run for Basin and Range
exit 0
