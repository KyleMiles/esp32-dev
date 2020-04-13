# Dockerized ESP32 Development Environment

Written by Kyle Martin

## How to use:

1. Clone the repo
2. Put your code in esp32-dev/src
3. Set your config settings: `make first-run`
4. Build your code: `make build`
5. Plug in your ESP32
6. Flash your chip: `make flash`

...or just `make` will build and flash.

7. (optional) `make monitor` will start a new container and run the monitor tool

## Dependencies:

1. Make
2. Docker
