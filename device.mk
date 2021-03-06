#
# Copyright (C) 2017 The Linux Foundation
# Copyright (C) 2017 The halogenOS Project
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

$(call inherit-product-if-exists, vendor/oneplus/cheeseburger/cheeseburger-vendor.mk)

PLATFORM_PATH := device/oneplus/cheeseburger

PRODUCT_COPY_FILES += $(PLATFORM_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
                      $(PLATFORM_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
                      $(PLATFORM_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Override heap growth limit due to high display density on device
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m

DEVICE_PACKAGE_OVERLAYS := $(PLATFORM_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, frameworks/native/build/phone-xxxhdpi-4096-dalvik-heap.mk)

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += \
        tcmiface \
        telephony-ext

PRODUCT_PACKAGES += \
        telephony-ext \
        libqmiextservices

ifeq ($(strip $(BOARD_HAVE_QCOM_FM)),true)
PRODUCT_BOOT_JARS += qcom.fmradio
endif #BOARD_HAVE_QCOM_FM

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/sensors/hals.conf:system/etc/sensors/hals.conf

# WLAN driver configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(PLATFORM_PATH)/wifi/wifi_concurrency_cfg.txt:system/etc/wifi/wifi_concurrency_cfg.txt

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:system/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# rootdir and wifi
# find rootdir/ -type f | sed -e 's/rootdir\///g' | xargs -i echo '        $(PLATFORM_PATH)/rootdir/{}:$(TARGET_OUT_ROOT)/{} \'
# find wifi/ -type f | sed -e 's/wifi\///g' | xargs -i echo '        $(PLATFORM_PATH)/wifi/{}:$(TARGET_OUT_ETC)/wifi/{} \'
PRODUCT_COPY_FILES += \
        $(PLATFORM_PATH)/rootdir/init.qcom.usb.sh:$(TARGET_OUT_ROOT)/init.qcom.usb.sh \
        $(PLATFORM_PATH)/rootdir/fstab.qcom:$(TARGET_OUT_ROOT)/fstab.qcom \
        $(PLATFORM_PATH)/rootdir/bin/init.qti.qseecomd.sh:$(TARGET_OUT_ROOT)/bin/init.qti.qseecomd.sh \
        $(PLATFORM_PATH)/rootdir/bin/init.qcom.modem_links.sh:$(TARGET_OUT_ROOT)/bin/init.qcom.modem_links.sh \
        $(PLATFORM_PATH)/rootdir/init.oem.rc:$(TARGET_OUT_ROOT)/init.oem.rc \
        $(PLATFORM_PATH)/rootdir/init.target.rc:$(TARGET_OUT_ROOT)/init.target.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.usb.rc:$(TARGET_OUT_ROOT)/init.qcom.usb.rc \
        $(PLATFORM_PATH)/rootdir/init.usb.configfs.rc:$(TARGET_OUT_ROOT)/init.usb.configfs.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.sensors.sh:$(TARGET_OUT_ROOT)/init.qcom.sensors.sh \
        $(PLATFORM_PATH)/rootdir/init.qcom.sh:$(TARGET_OUT_ROOT)/init.qcom.sh \
        $(PLATFORM_PATH)/rootdir/ueventd.qcom.rc:$(TARGET_OUT_ROOT)/ueventd.qcom.rc \
        $(PLATFORM_PATH)/rootdir/init.qcom.rc:$(TARGET_OUT_ROOT)/init.qcom.rc \
        $(PLATFORM_PATH)/rootdir/verity_key:$(TARGET_OUT_ROOT)/verity_key \
        $(PLATFORM_PATH)/wifi/hostapd.accept:$(TARGET_OUT_ETC)/wifi/hostapd.accept \
        $(PLATFORM_PATH)/wifi/hostapd.conf:$(TARGET_OUT_ETC)/wifi/hostapd.conf \
        $(PLATFORM_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_OUT_ETC)/wifi/WCNSS_qcom_cfg.ini \
        $(PLATFORM_PATH)/wifi/hostapd.deny:$(TARGET_OUT_ETC)/wifi/hostapd.deny \
        $(PLATFORM_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_OUT_ETC)/wifi/wpa_supplicant_overlay.conf \
        $(PLATFORM_PATH)/wifi/wpa_supplicant_wcn.conf:$(TARGET_OUT_ETC)/wifi/wpa_supplicant_wcn.conf \
        $(PLATFORM_PATH)/wifi/wifi_concurrency_cfg.txt:$(TARGET_OUT_ETC)/wifi/wifi_concurrency_cfg.txt \
        $(PLATFORM_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_OUT_ETC)/wifi/p2p_supplicant_overlay.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020.kl:system/usr/keylayout/fpc1020.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

#for android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

#A/B related packages
PRODUCT_PACKAGES += \
            bootctrl.msm8998 \
            brillo_update_payload

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# Init
PRODUCT_PACKAGES += \
    libinit_cheeseburger \

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8998 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8998 \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Buttons & Gestures
PRODUCT_BUTTON_GESTURES_PACKAGES := \
    oppo-keyhandler \
    ConfigPanel

PRODUCT_PACKAGES += $(PRODUCT_BUTTON_GESTURES_PACKAGES)

# Camera
PRODUCT_PACKAGES += \
    camera.msm8998 \
    mm-qcamera-app \
    libmm-qcamera \
    sensors.hal.tof

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# HALs
PRODUCT_PACKAGES += \
    copybit.msm8998 \
    gralloc.msm8998 \
    gps.msm8998 \
    hwcomposer.msm8998 \
    lights.msm8998 \
    memtrack.msm8998 \
    power.msm8998 \
    vr.msm8998

$(call inherit-product, device/oppo/common/common.mk)
