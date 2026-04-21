TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModMenuI13

# Quan trọng: Liệt kê cả Tweak.xm và Menu.mm để máy chủ tổng hợp cả hai
ModMenuI13_FILES = Tweak.xm Menu.mm
ModMenuI13_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
