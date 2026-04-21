# Thông tin máy chủ build
TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

# Tên dự án (Bạn có thể đổi tên tùy ý)
TWEAK_NAME = ModMenuI13

# Các file code cần build (Đảm bảo đúng tên file .x hoặc .mm bạn đang có)
ModMenuI13_FILES = Tweak.x
ModMenuI13_FRAMEWORKS = UIKit QuartzCore

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
