#!/bin/bash
PS3='Wybierz co chcesz zrobic: '
options=("preset 192.168.0.XXX" "preset 192.168.1.XXX" "Wlasna konfiguracja" "DHCP" "Wyjscie")

select opt in "${options[@]}"
do
    case $opt in
        "preset 192.168.0.XXX")
            clear
            echo "Preset 192.168.0.XXX"
            echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

            nmcli con mod "lan" ipv4.addresses 192.168.0.254/24

            nmcli con mod "lan" ipv4.gateway 192.168.0.1


            nmcli con mod "lan" ipv4.dns "8.8.8.8 8.8.4.4"
            nmcli con mod "lan" ipv4.method manual

            nmcli con up lan

            echo "Zakonczono "
            ;;
        "preset 192.168.0.XXX")
            clear
            echo "Preset 192.168.1.XXX"
            echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

            nmcli con mod "lan" ipv4.addresses 192.168.1.254/24

            nmcli con mod "lan" ipv4.gateway 192.168.1.1

            nmcli con mod "lan" ipv4.dns "8.8.8.8 8.8.4.4"
            nmcli con mod "lan" ipv4.method manual

            nmcli con up lan

            echo "Zakonczono "
            ;;

        "Wlasna konfiguracja")
            clear
            echo "Wlasne"
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
            nmcli con mod "lan" ipv4.dns "8.8.8.8 8.8.4.4"
            nmcli con mod "lan" ipv4.method manual
            nmcli con up lan

            echo "Zakonczono "
            ;;

        "DHCP")
            clear
            echo "DHCP"
            echo -e "\e[1;31m Zmieniam ustawienia karty sieciowej .. \e[0m"

            nmcli con mod "lan" ipv4.method auto


            echo "Zakonczono "
            ;;
        "Wyjscie")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
