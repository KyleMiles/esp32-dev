all: flash
	@echo "Done"

build: Dockerfile src/
	docker build -t esp32-dev .

first-run: build FORCE
	docker run --rm -it --privileged --hostname esp32-dev -v "${PWD}/src":/root/src esp32-dev /bin/zsh -c ". /root/esp/esp-idf/export.sh && idf.py set-target esp32 && idf.py menuconfig"

flash: build FORCE
	docker run --rm -it --privileged --hostname esp32-dev -v "${PWD}/src":/root/src esp32-dev

monitor: flash
	docker run --rm -it --privileged --hostname esp32-dev -v "${PWD}/src":/root/src esp32-dev /bin/zsh -c ". /root/esp/esp-idf/export.sh && idf.py monitor"

FORCE:
