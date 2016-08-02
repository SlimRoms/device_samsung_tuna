# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit common Slim configuration
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# SlimRoms specific overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/tuna/overlay-slim

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/tuna/aosp_tuna.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME   := slim_tuna

# Device build info and fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=yakju \
    BUILD_FINGERPRINT="google/yakju/maguro:4.3/JWR66Y/776638:user/release-keys" \
    PRIVATE_BUILD_DESC="yakju-user 4.3 JWR66Y 776638 release-keys"

# Snap support
PRODUCT_PACKAGES += \
	Snap

PRODUCT_PROPERTY_OVERRIDES += \
	camera.qcom.misc.disable=1
