# We use a 44.1kHz sampling rate on our 'fast track' audio path.
# As such, let's make sure we get the 44.1kHz audio effects.

SOUNDS_PATH := frameworks/base/data/sounds

PRODUCT_COPY_FILES += \
	$(SOUNDS_PATH)/effects/ogg/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
	$(SOUNDS_PATH)/effects/ogg/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
	$(SOUNDS_PATH)/effects/ogg/KeypressDelete_120.ogg:system/media/audio/ui/KeypressDelete.ogg \
	$(SOUNDS_PATH)/effects/ogg/KeypressInvalid_120.ogg:system/media/audio/ui/KeypressInvalid.ogg \
	$(SOUNDS_PATH)/effects/ogg/KeypressReturn_120.ogg:system/media/audio/ui/KeypressReturn.ogg \
	$(SOUNDS_PATH)/effects/ogg/KeypressSpacebar_120.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
	$(SOUNDS_PATH)/effects/ogg/KeypressStandard_120.ogg:system/media/audio/ui/KeypressStandard.ogg \
	$(SOUNDS_PATH)/effects/ogg/Trusted.ogg:system/media/audio/ui/Trusted.ogg \
	$(SOUNDS_PATH)/effects/ogg/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg

SOUNDS_PATH :=
