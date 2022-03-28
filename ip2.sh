echo "              IP  script by Nudziarz 3:> "
echo -e "\e[1;31m wcisnij klawisz by zaczac \e[0m"
read Klawisz
echo -e "\e[1;33m Podaj adres IP: \e[0m"
read IP
echo -e "\e[1;33m Podaj adres bramy   \e[0m"
read GW
echo""
echo "konfiguracja adresacji:"
echo -e "\e[1;31m adres IP : \e[1;33m $IP \e[0m"
echo -e "\e[1;31m Brama Glowna: \e[1;33m $GW \e[0m"  
echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

nmcli con mod "lan" ipv4.addresses $IP/24

nmcli con mod "lan" ipv4.gateway $GW

#nmcli con mod "lan" ipv4.dns “8.8.8.8”
nmcli con mod "lan" ipv4.dns "8.8.8.8 8.8.4.4"
nmcli con mod "lan" ipv4.method manual

nmcli con up lan

echo "Zakonczono "
