#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=salaa
export VENDOR=realme

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

LINEAGE_ROOT="${MY_DIR}/../../.."

HELPER="${LINEAGE_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper for device
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}"

# Copyright headers and common guards
write_headers

# The standard blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Append the calls to firmware images
append_firmware_calls_to_makefiles "${MY_DIR}/proprietary-firmware.txt"

# Finish
write_footers
