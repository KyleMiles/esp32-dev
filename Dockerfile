FROM ubuntu:latest

# Update
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git wget flex bison gperf python python-pip python-setuptools cmake ninja-build ccache libffi-dev libssl-dev libusb-1.0-0-dev zsh python3 python3-pip python3-setuptools -y
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

WORKDIR /root/

# Get Tools
RUN mkdir /root/esp && git clone --recursive https://github.com/espressif/esp-idf.git esp/esp-idf

# Install tools/configure enviornment
ENV IDF_TOOLS_PATH /root/.espressif
RUN /root/esp/esp-idf/install.sh

# For the first-run (configure terminal environment)
COPY .zshrc /root/.zshrc
RUN echo "source $HOME/esp/esp-idf/export.sh" >> /root/.zshrc

WORKDIR /root/src
CMD ["/bin/zsh", "-c", ". /root/esp/esp-idf/export.sh && /root/esp/esp-idf/tools/idf.py build && /root/esp/esp-idf/tools/idf.py flash"]

# Debug:
# ENTRYPOINT ["/bin/zsh"]
