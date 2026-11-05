#!/bin/bash

echo "Ну сто погнали строить!"
echo "Обновим систему"
sudo apt update
sudo apt upgrade -y


echo "Устанавливаем crowdsec"
curl -s https://install.crowdsec.net | sh
apt install crowdsec crowdsec-firewall-bouncer-iptables

echo "Закончили с безопасностью"
echo "Сейчас установим mtproxy"
curl -fsSL https://raw.githubusercontent.com/sleep3r/mtproto.zig/main/deploy/bootstrap.sh | sudo bash
echo "Теперь введите сайт, под который будем маскировать прокси."
echo "Если не знаете как его выбрать, зайдите в бота - https://t.me/Sni_checker_bot и отправьте ему сайт на проверку, он скажет подошел ли сайт или нет"
read urlproxy
sudo mtbuddy install --port 9443 --domain $urlproxy --yes


echo "Переходим к 3x-ui, будьте внимательны, будут задавать вопросы!"
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
