FONT="0xProto"

dnf install -y unzip wget
mkdir -p /usr/share/fonts/nerd-fonts
wget -O /tmp/${FONT}.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.zip
unzip /tmp/${FONT}.zip -d /usr/share/fonts/nerd-fonts
fc-cache -fv
rm /tmp/${FONT}.zip
