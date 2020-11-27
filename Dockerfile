FROM ubuntu

USER root

ENV DEBIAN_FRONTEND="noninteractive" TZ="America/Chicago"

RUN apt -y update && apt -y install curl gnupg2

RUN curl -o /tmp/keys.asc https://updates.signal.org/desktop/apt/keys.asc

RUN apt-key add /tmp/keys.asc

RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list

RUN apt -y update && apt -y install signal-desktop

RUN chown root:root /opt/Signal/chrome-sandbox

RUN chmod 4755 /opt/Signal/chrome-sandbox

RUN groupadd -g 1000 user

RUN useradd -d /home/user -s /bin/bash -m user -u 1000 -g 1000

USER user

ENV HOME /home/user

CMD /usr/bin/signal-desktop
