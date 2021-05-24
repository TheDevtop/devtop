# System-wide script

# Installing package
pacman -S --noconfirm \
	bash bash-completion networkmanager ufw \
	pulseadio pulseaudio-alsa pavucontrol sudo \
	vim gvfs

pacman -S --noconfirm \
	xorg-server xorg-xinit lightdm-gtk-greeter light-locker \
	i3-gaps xfce4-panel xfce4-pulseaudio-plugin xfce4-battery-plugin \
	terminus-font ttf-inconsolata alacritty rofi \
	xclip thunar thunar-volman

# Enable services
systemctl enable NetworkManager
systemctl enable ufw
systemctl enable lightdm

# Copy config files
cp -R rootfs/* /

