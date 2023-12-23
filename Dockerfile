FROM ubuntu:22.04

ENV DISPLAY :0

ENV USERNAME developer

RUN apt-get update

RUN apt-get install -y software-properties-common sudo

RUN add-apt-repository ppa:flatpak/stable

RUN apt-get update

RUN apt-get install -y flatpak

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

RUN echo "backus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN useradd --no-log-init --home-dir /home/$USERNAME --create-home --shell /bin/bash $USERNAME

RUN adduser $USERNAME sudo

STOPSIGNAL SIGRTMIN+3

CMD [ "/sbin/init" ]