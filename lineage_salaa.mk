#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile
$(call inherit-product, device/realme/salaa/device.mk)

# Inherit some common risingOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# ViPER4AndroidFX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Call Recorder
$(call inherit-product, vendor/bcr/bcr.mk)

# RisingOS flags
RISING_BUILDTYPE := UNOFFICIAL
PRODUCT_NO_CAMERA := false
WITH_GMS := true
TARGET_CORE_GMS := true
TARGET_CORE_GMS_EXTRAS := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
TARGET_SHIPS_MATLOG := false
TARGET_ENABLE_PIXEL_FEATURES := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_ENABLE_BLUR := true
RISING_BATTERY := 5000mAh
RISING_DISPLAY := 1080X2400
RISING_CHIPSET :="Helio G95"
RISING_MAINTAINER :="Luks"

# Build_Prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_CHIPSET="Helio G95" \
    RISING_MAINTAINER="Luks"

# EPPE
TARGET_DISABLE_EPPE := true

# Device Information
PRODUCT_DEVICE := salaa
PRODUCT_NAME := lineage_$(PRODUCT_DEVICE)
PRODUCT_BRAND := realme
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)
PRODUCT_MODEL := realme 7/Narzo 20 Pro/Narzo 30 4G

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=RMX2155L1 \
    PRODUCT_NAME=RMX2155

BUILD_FINGERPRINT := "google/husky_beta/husky:15/AP31.240617.009/12094726:user/release-keys"
PRODUCT_PROPERTY_OVERRIDES := ro.build.fingerprint=$(BUILD_FINGERPRINT)
PRODUCT_GMS_CLIENTID_BASE := android-realme
