#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_FOLDER := device/samsung/tuna

# inherit from omap4
-include hardware/ti/omap4/BoardConfigCommon.mk

# Build SGX KM
-include hardware/ti/omap4/pvr-km.mk

PRODUCT_VENDOR_KERNEL_HEADERS += $(DEVICE_FOLDER)/kernel-headers

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_INFO_FILE := $(DEVICE_FOLDER)/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := tuna

# We're now a unified build, but this wasn't always the case.
TARGET_OTA_ASSERT_DEVICE := tuna,,maguro,toro,toroplus

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME)
TARGET_KERNEL_CONFIG := tuna_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/tuna
KERNEL_TOOLCHAIN := "$(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/linaro-4.7-13.04/bin/"
KERNEL_TOOLCHAIN_PREFIX := arm-linux-gnueabihf-

TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_INTERFACE := OMX
DOMX_TUNA := true
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 2

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# device-specific extensions to the updater binary
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_tuna
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_FOLDER)

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12517376
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 685768704
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14539537408
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space.
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Pre-optimize the boot image
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.tuna

TARGET_TUNA_AUDIO_HDMI := true

# on toro(plus) boards we need to apply a special adaptive filter
# on the compass output because of noise generated by the pmic.
# TODO: find a way to ONLY apply this to toro(plus), and leave maguro alone.
BOARD_INVENSENSE_APPLY_COMPASS_NOISE_FILTER := true

# Some of our vendor libs have text relocations
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# SELinux
BOARD_SEPOLICY_DIRS += \
	$(DEVICE_FOLDER)/sepolicy

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/rootdir/fstab.tuna
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
