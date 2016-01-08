# vim: set ft=Dockerfile et sw=2 ts=2 sts=2 tw=0:
FROM jrdasm/salix32-minimal:14.1
MAINTAINER JRD <jrd@salixos.org>
RUN slapt-get --update && \
    slapt-get --install --no-prompt --ignore-excludes \
      alsa-lib \
      cdparanoia \
      fontconfig \
      freeglut \
      freetype \
      gamin \
      gd \
      gettext-tools \
      glew \
      glib2 \
      glu \
      gst-plugins-base \
      gstreamer \
      harfbuzz \
      kmod \
      lcms2 \
      libICE \
      libSM \
      libX11 \
      libXau \
      libXdamage \
      libXdmcp \
      libXext \
      libXfixes \
      libXi \
      libXmu \
      libXpm \
      libXrandr \
      libXrender \
      libXt \
      libXxf86vm \
      libcroco \
      libdrm \
      libexif \
      libffi \
      libgphoto2 \
      libjpeg \
      libogg \
      libpciaccess \
      libpng \
      libtheora \
      libtiff \
      libtool \
      libvisual \
      libvorbis \
      libxcb \
      libxml2 \
      mesa \
      mpg123 \
      openal-soft \
      udev \
      wine
RUN slapt-get --install --no-prompt --ignore-excludes \
      hicolor-icon-theme \
      compositeproto \
      damageproto \
      dmxproto \
      dri2proto \
      fixesproto \
      fontcacheproto \
      fontsproto \
      glproto \
      inputproto \
      kbproto \
      printproto \
      randrproto \
      recordproto \
      renderproto \
      resourceproto \
      scrnsaverproto \
      videoproto \
      xcb-proto \
      xcmiscproto \
      xextproto \
      xf86bigfontproto \
      xf86dgaproto \
      xf86driproto \
      xf86miscproto \
      xf86vidmodeproto \
      xineramaproto \
      xproto \
      libpthread-stubs \
      libXcomposite \
      libXcursor \
      libXinerama \
      libXft \
      atk \
      lzo \
      pixman \
      cairo \
      gdk-pixbuf2 \
      icu4c \
      harfbuzz \
      pango \
      gtk+2 \
      p7zip
RUN slapt-get --install --no-prompt --ignore-excludes \
      font-alias \
      dejavu-fonts-ttf \
      font-util \
      liberation-fonts-ttf \
      terminus-font \
      sudo \
      xdg-user-dirs \
      xdg-utils \
      gettext \
      nc \
      imagemagick \
      wget \
      xterm \
      links \
      flac \
      xdpyinfo \
      sdl \
      SDL_sound \
      SDL_gfx \
      SDL_perl \
      SDL_Pango \
      json-c \
      dbus \
      libsndfile \
      perl \
      pciutils \
      glibc \
      && \
    slapt-get --clean
COPY \
    cabextract-1.4-i486-1_SBo.txz \
    icoutils-0.31.0-i486-1_SBo.txz \
    libasyncns-0.8-i486-2_SBo.txz \
    pulseaudio-7.0-i486-2_SBo.txz \
    wxPython-2.8.12.1-i486-2_SBo.txz \
    playonlinux-4.2.9-noarch-1_SBo.txz \
    /tmp/
RUN for p in /tmp/*.txz; do spkg -i $p; done && \
    rm /tmp/*.txz
RUN mv /usr/bin/links /usr/bin/links.bin && \
    echo '#!/bin/sh' > /usr/bin/links && \
    echo 'exec xterm -e /usr/bin/links.bin "$@"' >> /usr/bin/links && \
    chmod +x /usr/bin/links && \
    (cd /usr/lib && ln -sf libvga.so libvga.so.1) && \
    useradd -m -N -g games -G video,audio,cdrom pol && \
    passwd -d pol && \
    echo '%games ALL=(root) NOPASSWD: ALL' > /etc/sudoers.d/10-games && \
    sed -i 's/self\.sendAlert(_(/pass #\0/' /usr/share/playonlinux/python/mainwindow.py
WORKDIR /home/pol
USER pol
ENV USER pol
ENV LANG en_US.utf8
CMD ["playonlinux"]
