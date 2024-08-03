# Cloning required repositories for making rum:

# Vendor
git clone https://github.com/StimLuks87/proprietary_vendor_realme_salaa -b lineage-21 vendor/realme/salaa

# Kernel
git clone https://github.com/StimLuks87/android_kernel_realme_mt6785 -b lineage-21 kernel/realme/mt6785

# SEpolicy
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-21 device/mediatek/sepolicy_vndr

# Hardware
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-21 hardware/mediatek

# ViPER4AndroidFX:
git clone https://github.com/StimLuks87/VIPER_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

# Bcr
git clone https://github.com/StimLuks87/vendor_bcr vendor/bcr

# CameraGo
unzip device/realme/salaa/CameraGo/CameraGo.zip -d device/realme/salaa/CameraGo && rm device/realme/salaa/CameraGo/CameraGo.zip

# Make the build faster using ccache
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE=50G

# Disable and stop systemd-oomd service.
systemctl disable --now systemd-oomd
