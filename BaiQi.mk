# Lineage specific changes

# Inherit car device configuration
$(call inherit-product, vendor/hlhtddx/car/common/car.mk)


# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := lineage_flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    PRIVATE_BUILD_DESC="volantis-user 7.1.1 N9F27M 4333998 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/volantis/flounder:7.1.1/N9F27M/4333998:user/release-keys

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-10-05

## Device identifier. This must come after all inclusions
PRODUCT_NAME := BaiQi
PRODUCT_DEVICE := flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9

# Add car related sepolicy.
BOARD_SEPOLICY_DIRS += \
    vendor/hlhtddx/car/common/sepolicy

# Set device specified manifest.xml
PRODUCT_COPY_FILES += \
    device/hlhtddx/BaiQi/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# Set SELinux to Permissive mode for vehicle hal network accessing
# TODO this will be removed while sepolicy is ready
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
