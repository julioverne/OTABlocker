include theos/makefiles/common.mk

TOOL_NAME = blockota
blockota_FILES = main.mm
blockota_LIBRARIES = MobileGestalt
blockota_ARCHS = armv7 arm64
export ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tool.mk
