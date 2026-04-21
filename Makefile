TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModMenuI13

# Đảm bảo tên file dưới đây trùng với file chứa code của bạn (Tweak.x hoặc Tweak.xm)
ModMenuI13_FILES = Tweak.x
ModMenuI13_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
