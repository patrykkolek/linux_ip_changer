echo "              IP  192.168.0.254 script by Nudziarz 3:> "
echo -e "\e[1;31m wcisnij klawisz by zaczac \e[0m"
read Klawisz

echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

nmcli con mod "lan" ipv4.addresses 192.168.0.254/24

nmcli con mod "lan" ipv4.gateway 192.168.0.1


nmcli con mod "lan" ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con mod "lan" ipv4.method manual

nmcli con up lan

echo "Zakonczono "
