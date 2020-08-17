FROM brunob45/alpine-pkg-glibc:2.31-r0

RUN apk add python3 py3-pip git avr-libc gcc-avr
RUN pip install platformio && pio platform install atmelavr
RUN mv ~/.platformio/packages/toolchain-atmelavr/bin ~/.platformio/packages/toolchain-atmelavr/bin_ && ln -s /usr/bin ~/.platformio/packages/toolchain-atmelavr/bin
