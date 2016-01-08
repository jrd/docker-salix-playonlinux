PlayOnLinux using Docker
========================

You can run [PlayOnLinux](https://www.playonlinux.com) through [Docker](https://docker.com).

The docker needs to be run in a special way to access your *video* and *audio* devices. The easiest way to do this is by doing a `git clone` and then:

    $ make install

That will install you a script, an icon and a desktop file to launch PlayOnLinux.

You can also *bind mount* a directory of your computer to `/home/pol` inside docker. In fact. I **advise you do so** or what you will install through PlayOnLinux will **not stand uppon exiting** the application.
To configure this directory, edit and uncomment the `VOLUME_HOME_DIR` variable in the config file `~/.config/pol.rc`.
