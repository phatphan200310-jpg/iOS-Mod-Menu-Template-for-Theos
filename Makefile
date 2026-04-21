TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModMenuI13

ModMenuI13_FILES = Tweak.xm Menu.mm
ModMenuI13_FRAMEWORKS = UIKit QuartzCore

include $(THEOS)/makefiles/tweak.mk
