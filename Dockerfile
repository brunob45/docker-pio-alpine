FROM brunob45/alpine-pkg-glibc:2.32-r0

RUN apk add -U python3 py3-pip git avr-libc gcc-avr
RUN pip install platformio && pio platform install atmelavr

RUN addgroup -S user && adduser -S -G user user
RUN mv /root/.platformio /home/user && chmod 777 -R /home/user/.platformio

USER user

RUN mv ~/.platformio/packages/toolchain-atmelavr/bin ~/.platformio/packages/toolchain-atmelavr/bin_ && ln -s /usr/bin ~/.platformio/packages/toolchain-atmelavr/bin
