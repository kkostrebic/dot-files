## My dot-files

### Autostart X at login

Make sure that startx is properly configured.

Place the following in your login shell initialization file (e.g. `~/.bash_profile` for Bash or `~/.zprofile` for Zsh):

```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

You can replace the -eq comparison with one like -le 3 (for vt1 to vt3) if you want to use graphical logins on more than one virtual terminal.

Alternative conditions to detect the virtual terminal include `"$(tty)" = "/dev/tty1"`, which does not allow comparison with -le, and `"$(fgconsole 2>/dev/null || echo -1)" -eq 1`, which does not work in serial consoles. 

### What is starting i3-wm

TL;DR 
startx will start i3-wm even if there is no .xinitrc configured, because it's 
configured as default window manager (in case no other window managers are installed). 

[Original stackoverflow link/answer](https://unix.stackexchange.com/questions/315223/what-is-starting-i3-when-i-run-startx)

i3 seems to be a X Window Manager. If it's your system's default window manager, 
it's registered with the 'alternatives' system - which you can check with ```update-alternatives --display x-window-manager```. 

This means that ```/usr/bin/x-window-manager``` is a symlink to ```/etc/alternatives/x-window-manager```; 
this in turn is set by the 'alternatives' system to point to i3.

If you want to change the system default window manager, root can ```update-alternatives --config x-window-manager```.

If Xsession finds a window manager, it will make this the default program to start in the session. 
In Debian, this is done in ```/etc/X11/Xsession.d/50x11-common_determine-startup```.

If a users want to run a different program in their X session, then they can write a ~/.xsession that starts (or execs) the desired program.

### Unicode characters in VIM
1. go into INSERT mode.
1. Ctrl+v go into ins-special-keys mode.
1. u2713 insert the Unicode character CHECK MARK (U+2713)

### VirtualBox Guest Additions on a GUI-less server

1. Start VirtualBox.
1. Start the host in question.
1. Once the host has booted, click Devices | Insert Guest Additions CD Image.
1. Log in to your guest server.
1. Mount the CD-ROM with the command sudo mount /dev/cdrom /media/cdrom.
1. Change into the mounted directory with the command cd /media/cdrom.
1. Install the necessary dependencies with the command sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r). (NOTE: `install-basics.sh` script installs ModuleAssistent and runs `m-a prepare` which does everthing from this step automatically for Debian distro) 
1. Change to the root user with the command sudo su.
1. Install the Guest Additions package with the command ./VBoxLinuxAdditions.run.
1. Allow the installation to complete.

### Freedesktop/XDG desktop entry specification 

[Desktop entry specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/)

[Arch wiki](https://wiki.archlinux.org/title/desktop_entries)

The XDG Desktop Entry specification defines a standard for applications to integrate into application menus of desktop environments implementing the XDG Desktop Menu specification. 

Desktop entries for applications, or .desktop files, are generally a combination of meta information resources and a shortcut of an application. These files usually reside in `/usr/share/applications/` or `/usr/local/share/applications/` for applications installed system-wide, or `~/.local/share/applications/` for user-specific applications. User entries take precedence over system entries.

#### useful tool(s)

- dex - generate and execute application type .desktop files ([details](https://github.com/jceb/dex))

#### .desktop file example:

```
[Desktop Entry]

# The type as listed above
Type=Application

# The version of the desktop entry specification to which this file complies
Version=1.0

# The name of the application
Name=jMemorize

# A comment which can/will be used as a tooltip
Comment=Flash card based learning tool

# The path to the folder in which the executable is run
Path=/opt/jmemorise

# The executable of the application, possibly with arguments.
Exec=jmemorize

# The name of the icon that will be used to display this entry
Icon=jmemorize

# Describes whether this application needs to be run in a terminal or not
Terminal=false

# Describes the categories in which this entry should be shown
Categories=Education;Languages;Java;
```

firefox.desktop:
```
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
GenericName=Web Browser
Comment=Browse the Web
Exec=/home/username/Applications/firefox/firefox-bin %u
Icon=firefox.png
Terminal=false
Type=Application
Categories=Application;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;
StartupNotify=True
```
