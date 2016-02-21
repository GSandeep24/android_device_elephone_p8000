$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/elephone/p8000/p8000-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/elephone/p8000/overlay

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := p8000,k05ts_a

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/elephone/p8000/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	device/elephone/p8000/rootdir/init.mt6735.rc:root/init.mt6735.rc \
	device/elephone/p8000/rootdir/init.ssd.rc:root/init.ssd.rc \
	device/elephone/p8000/rootdir/init.xlog.rc:root/init.xlog.rc \
	device/elephone/p8000/rootdir/init.rc:root/init.rc \
	device/elephone/p8000/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
	device/elephone/p8000/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc \
	device/elephone/p8000/rootdir/init.aee.rc:root/init.aee.rc \
	device/elephone/p8000/rootdir/init.project.rc:root/init.project.rc \
	device/elephone/p8000/rootdir/init.modem.rc:root/init.modem.rc \
    device/elephone/p8000/recovery/root/fstab.mt6753:root/fstab.mt6735  \
	device/elephone/p8000/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc \
	device/elephone/p8000/rootdir/factory_init.rc:root/factory_init.rc \
	device/elephone/p8000/rootdir/factory_init.project.rc:root/factory_init.project.rc \
	device/elephone/p8000/rootdir/meta_init.project.rc:root/meta_init.project.rc \
	device/elephone/p8000/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
	device/elephone/p8000/rootdir/meta_init.rc:root/meta_init.rc \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml 

    
# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudio-resampler \
    tinymix \
    libdashplayer


PRODUCT_COPY_FILES += \
    device/elephone/p8000/rootdir/etc/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \


$(call inherit-product, build/target/product/full.mk)

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
ro.adb.secure=0 \
persist.service.acm.enable=0 
