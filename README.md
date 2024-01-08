# no-dot-hide



Hiding files without adding dot



## Supported File Managers

- [x] [Caja](https://wiki.mate-desktop.org/mate-desktop/applications/caja/)

- [x] [Dolphin](https://apps.kde.org/dolphin/)

- [x] [Krusader](https://krusader.org/)

- [x] [Konqueror](https://apps.kde.org/konqueror/)

- [x] [Nautilus](https://apps.gnome.org/Nautilus/)

- [x] [Nemo](https://github.com/linuxmint/nemo)

- [x] [PCManFM-qt](https://github.com/lxqt/pcmanfm-qt)

- [x] [Thunar](https://gitlab.xfce.org/xfce/thunar)

- [ ] [dde-file-manager](https://www.deepin.org/en/original/dde-file-manager/)

- [ ] [Pantheon](https://github.com/elementary/files)

- [ ] [PCManFM](https://github.com/lxde/pcmanfm)

- [ ] [Polo](https://teejee2008.github.io/polo/)



## hider(backend of FM's menu and CLI tool)

Usage: hider [files]

## lsh(ls wrapper but that respect .hidden)

#### Additional options

-e, --nohidden   Show .hiddened file, but doesn't affect dotfiles(Run ls normally)

#### Known issue

* Recursive listing is bit slow

* Wildcard handling(WIP for workaround by overriding wildcard behavior by `-f` shell option)



# Installation

```shell
wget "https://github.com/FoxRefire/no-dot-hide/raw/main/artifacts/installer.sh"
chmod +x installer.sh
./installer.sh
```

# Building

```shell
git clone https://github.com/FoxRefire/no-dot-hide.git && cd no-dot-hide
chmod +x build.sh
./build.sh
```

# WIP

* Add supported file managers

* Localization

* Fix some issues

* Add some options for CLI tools(-t,--toggle:Toggle hidden or visible[default]  -h,--hide:Set to hidden  -u,--unhide:Set to visible)

PRs are welcome!
