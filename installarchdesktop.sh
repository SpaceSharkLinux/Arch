#!/bin/bash

sudo -l > /dev/null 2>&1
sudo pacman -S fish
echo -e "选择窗口管理器\n\t1.Mutter(GNOME)\n\t2.Hyprland"
read -r WM
if [ $WM = '1' ];then
  sudo pacman -S --needed gnome gnome-keyring gnome-terminal nautilus gnome-polkit
elif [ $WM = '2' ];then
  echo -e "你的登陆器\n\t1.GDM3\n\t2.LightDM\n\t3.SDDM\n\t4.我是高手，直接在TTY登陆"
  read -r DM
  if [ $DM = '1' ];then
    DIMA=gdm
  elif [ $DM = '2' ];then
    DIMA=lightdm
  elif [ $DM = '3' ];then
    DIMA=sddm
  else
    :
  fi
  sudo -E pacman -S --needed hyprland $DIMA kitty dolphin wofi waybar xdg-desktop-portal-hyprland qt-wayland qt6-wayland
fi
if !(cat /etc/pacman.conf|grep -w archlinuxcn);
  sudo bash -c "echo -e "[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch\n[multilib]\nInclude = /etc/pacman.d/mirrorlist">>/etc/pacman.conf"
  sudo pacman -Syy
fi
sudo pacman -S yay firefox
echo "是否安装微信QQ [Y]es/[N]o"
read -r weqq
if [ $weqq = "Y" ] || [ $weqq = "y" ];then
  yay -S wechat-appimage linuxqq-appimage
fi
echo "是否安装WPS [Y]es/[N]o"
read -r wps
if [ $wps = "Y" ] || [ $weqq = "y" ];then
  yay -S wps-office
fi
echo "你玩游戏吗 [Y]es/[N]o"
read -r GAME
if [ $GAME = 'Y' ] || [ $GAME = "y" ];then
  yay -S steam lutris wine winetricks
fi
