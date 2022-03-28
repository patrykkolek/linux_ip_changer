
#static
nmcli con mod enp0s25 ipv4.addresses 192.168.2.20/24

nmcli con mod enp0s25 ipv4.gateway 192.168.2.1

nmcli con mod enp0s25 ipv4.dns “8.8.8.8”

nmcli con mod enp0s25 ipv4.method manual

nmcli con up enp0s25

ip addr enp0s25


#dhcp
nmcli device modify enp0s25 ipv4.method auto

nmcli device show enp0s25
