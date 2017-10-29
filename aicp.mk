# Boot animation
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/taimen/aosp_taimen.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_taimen
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2 XL

TARGET_VENDOR := google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taimen \
    BUILD_FINGERPRINT=google/taimen/taimen:8.1.0/OPM1.171019.011/4448085:user/release-keys \
    PRIVATE_BUILD_DESC="taimen-user 8.1.0 OPM1.171019.011 4448085 release-keys"

(call inherit-product-if-exists, vendor/google/taimen/taimen-vendor.mk)
