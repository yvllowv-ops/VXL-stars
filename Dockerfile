FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive


RUN apt update -y && apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt update -y && apt install -y \
    openssh-server \
    sudo \
    vim \
    net-tools \
    curl \
    wget \
    git \
    tzdata \
    ffmpeg \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11 && \
    python3.11 -m pip install --upgrade pip setuptools wheel


RUN python3.11 -m pip install --no-cache-dir \
    mtranslate \
    google-genai \
    requests \
    g4f \
    mutagen \
    tgcalls==3.0.0.dev6 \
    py-tgcalls~=2.2.11 \
    telethon \
    aiosqlite \
    aiocron \
    emoji \
    pytz \
    gtts \
    qrcode \
    Telegram \
    aiohttp \
    fake_useragent \
    user_agent \
    hijri_converter \
    gpytranslate \
    watchdog


WORKDIR /root
RUN git clone https://github.com/2mrxe2/pro


RUN mkdir /var/run/sshd
RUN echo "root:final1997@@@" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
