ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo "***************************************"
echo "* Vitejte v konzoli serveru pro Jitsi *"
echo "***************************************"
echo "
Predpokladem pro uspesnou instalaci je, ze jste u vaseho spravce domeny vytvorili domenu treti urovne
(napriklad videokonference.vasefirma.cz) formou A zaznamu smerujici na verejnou IP adresu tohoto serveru
ktera je $ip a kterou rovnez vidite v administraci LEMO Cloud, a take jste pockali az 24 hodin
na rozsireni DNS zaznamu mezi servery v internetu."
echo -e "\e[1;31m Nejdrive si zmente heslo uzivatele root zadanim prikazu passwd \e[0m"
echo ""
echo"Pokud mate heslo zmenene a domenu funkcni, instalaci zahajite zadanim prikazu ./jitsi-install.sh"
