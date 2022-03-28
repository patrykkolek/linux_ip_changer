echo "              IP  script by Nudziarz 3:> "
echo -e "\e[1;31m wcisnij klawisz aby wlaczyc DHCP \e[0m"
read Klawisz
  
echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

nmcli con mod "lan" ipv4.method auto


echo "Zakonczono "
