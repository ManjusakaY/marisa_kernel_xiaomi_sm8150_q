# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=MARISAKERNEL @ Laulan56
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=cepheus
device.name2=raphael
supported.versions=10
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

ui_print "##     ## ##    ##          #######  ";
ui_print "###   ### ##   ##          ##     ## ";
ui_print "#### #### ##  ##           ##     ## ";
ui_print "## ### ## #####    ####### ##     ## ";
ui_print "##     ## ##  ##           ##  ## ## ";
ui_print "##     ## ##   ##          ##    ##  ";
ui_print "##     ## ##    ##          ##### ## ";



## AnyKernel install
dump_boot;


# end ramdisk changes

ui_print "-> Disabling FOD dim layer";
MarisaMagisk=/data/adb/modules/Marisa
rm -rf $MarisaMagisk
mkdir -p $MarisaMagisk
cp -Rf /tmp/anykernel/marisamagisk/* $MarisaMagisk
chmod 755 $MarisaMagisk/system.prop

write_boot;
## end install

