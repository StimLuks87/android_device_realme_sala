#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/salaa

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Priv Keys
-include vendor/lineage-priv/keys/keys.mk

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 29
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# AAPT/DEX
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Enable whole-program R8 Java optimizations for SystemUI and system_server
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
USE_DEX2OAT_DEBUG := false
WITH_DEXPREOPT_DEBUG_INFO := false

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32\
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    libtinycompress \
    libtinyxml \
    libldacBT_bco

PRODUCT_PACKAGES += \
    BesLoudness \
    MtkInCallService

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor:64 \
    android.hardware.bluetooth@1.1.vendor:64 \
    android.hardware.bluetooth.audio-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Camera
PRODUCT_PACKAGES += \
    Aperture \
    android.hardware.camera.common@1.0.vendor:64 \
    android.hardware.camera.device@3.6.vendor:64 \
    android.hardware.camera.provider@2.6.vendor:64 \
    libexpat.vendor:64 \
    libpng.vendor:64

PRODUCT_PACKAGES += \
    libshim_camera_metadata

PRODUCT_PACKAGES += \
    CameraGo

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-camera-go.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-camera-go.xml

# ConfigStore
PRODUCT_PACKAGES += \
    disable_configstore

# Doze
PRODUCT_PACKAGES += \
    OplusDoze

# Packages Apps
PRODUCT_PACKAGES += \
    Browser2 \
    Recorder

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.3.vendor:32 \
    libmockdrmcryptoplugin \
    libdrm.vendor \
    libdrm

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service \
    libgatekeeper.vendor:64

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor:64 \
    libcurl.vendor:32

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-resources \
    android.hardware.graphics.composer@2.1-resources.vendor \
    android.hardware.graphics.composer@2.1-service \
    libion.vendor \
    libui.vendor 

PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.brightness.low.gamma=true

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek-mali

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder.vendor \
    libhidlmemory.vendor:64

# Init
PRODUCT_PACKAGES += \
    fstab.mt6785 \
    fstab.mt6785.ramdisk \
    init.connectivity.rc \
    init_connectivity.rc \
    init.modem.rc \
    init.mt6785.rc \
    init.mt6785.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.oplus.rc \
    ueventd.mtk.rc \
    ueventd.oplus.rc

PRODUCT_PACKAGES += \
    init_salaa_vendor

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6785.rc

# Kernel
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor:64 \
    libkeymaster4support.vendor:64 \
    libkeymaster_portable.vendor:64 \
    libkeymaster_messages.vendor:64 \
    libsoft_attestation_cert.vendor:64 \
    libpuresoftkeymasterdevice.vendor:64 \
    libnetutils.vendor:64

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.salaa

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.salaa

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.salaa

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# Neutral Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor:64

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    SecureElement \
    NfcNci \
    Tag

# Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor:64

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libese-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libese-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/nfc_features.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/nfc_features.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    FrameworksOverlayRMX2151 \
    FrameworksOverlayRMX2161 \
    SettingsOverlaySalaa \
    SettingsProviderOverlay7 \
    SettingsProviderOverlayNarzo \
    SettingsProviderOverlayNarzo20Pro \
    SettingsProviderOverlayNarzo30

# RRO (Runtime Resource Overlay)
PRODUCT_ENFORCE_RRO_TARGETS += *

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# IncrementalFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.incremental.enable=yes

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.lineage-libperfmgr

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub

PRODUCT_PACKAGES += \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# PowerOffAlarm
PRODUCT_PACKAGES += \
    PowerOffAlarm

# Properties
include $(LOCAL_PATH)/configs/props/vendor_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor:64 \
    android.hardware.radio.config@1.2.vendor:64 \
    android.hardware.radio.deprecated@1.0.vendor:64 \
    libsqlite.vendor:64

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.hardware.sensors@2.0.vendor:64 \
    android.frameworks.sensorservice@1.0.vendor \
    libsensorndkbridge \
    libpower.vendor:64 \
    libshim_sensors

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client \
    $(LOCAL_PATH)

# Soundtrigger
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl:32

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common \

# Inherit several Android Go Configurations (Beneficial for everyone, even on non-Go devices)
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Textclassifier
PRODUCT_PACKAGES += \
    libtextclassifier_hash.vendor:64

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek-legacy

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# Required libs QPR3
PRODUCT_PACKAGES += \
    libexif.vendor \
    libdng_sdk.vendor \
    liblz4.vendor \
    libpiex \
    libjsoncpp.vendor \
    libdumpstateutil.vendor

# VNDK
PRODUCT_PACKAGES += \
    libmedia_helper-v30 \
    libutils-v32 \
    libutils-v30 \
    libui-v32

PRODUCT_PACKAGES += \
    libunwindstack.vendor \
    libutilscallstack.vendor

PRODUCT_PACKAGES += \
    libshim_ui

# Wi-Fi
PRODUCT_PACKAGES += \
    TetheringConfigOverlaySalaa \
    WifiOverlaySalaa \
    libwifi-hal-wrapper \
    hostapd \
    wpa_supplicant \
    android.hardware.wifi-service-lazy

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/txpowerctrl.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/txpowerctrl.cfg \
    $(LOCAL_PATH)/configs/wifi/wifi.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/wifi.cfg

ifneq ($(wildcard  vendor/lineage/.),)
$(call inherit-product-if-exists, $(LOCAL_PATH)/salaa_lineage.mk)
endif

# Call proprietary blob setup
$(call inherit-product, vendor/realme/salaa/salaa-vendor.mk)
