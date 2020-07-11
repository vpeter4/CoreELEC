BUILD_DIRS=build.*

all: release

system:
	./scripts/image

release:
	./scripts/image release
	@echo Copying tar to web server in public/amlogic 
	@cp target/CoreELEC-Amlogic-ng.arm-*.tar ~/public/amlogic/

image:
	./scripts/image mkimage

noobs:
	./scripts/image noobs

clean:
	rm -rf $(BUILD_DIRS)/* $(BUILD_DIRS)/.stamps

distclean:
	rm -rf ./.ccache ./$(BUILD_DIRS)

src-pkg:
	tar cvJf sources.tar.xz sources
