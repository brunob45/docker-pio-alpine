FROM brunob45/alpine-pkg-glibc:2.32-r0

RUN apk add -U python3 py3-pip git avr-libc gcc-avr
RUN pip install platformio && pio platform install atmelavr

RUN addgroup -S user && adduser -S -G user user
RUN rm -rf /root/.platformio/packages/toolchain-atmelavr/bin && \
    mv /root/.platformio /home/user && \
    ln -s /usr/bin /home/user/.platformio/packages/toolchain-atmelavr/bin

USER user
WORKDIR /home/user
