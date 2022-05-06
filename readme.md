
Требования к исполнителю:
Тот кто будет пользоваться инструкцией должен обладать знаниями по установке ubuntu server, а так же понимать принципы работы docker, kvm, qemu, сетей, и обладать навыками чтения и редактирования Dockerfile

При установке обратить внимание на разметку жесткого диска.
Для docker контейнеров будет использован путь /data
Для kvm машин будет использован /kvm

1. Устанавливаем ubuntu server 18/20/22
2. Настраиваем статический ip.
Запустить скрипт:
sudo bash static-ip-config/network-static-ip.sh
по окончанию откроется nmtui. Ввести настройки для сетевого интерфейса, задав статичный ip.
3. Запустить скрипт автоматической установки
sudo bash runme.sh
4. открыть в браузере sever_ip:9000 и завершить установку portainer
5. открыть в браузере sever_ip:9001
login: admin
password: admin@123
В корень загружать ISO установочных образов для KVM машин
6. Завершаем установку и настройку webvirtcloud

6.1 Используя portainer->webvirtcloud->console
интерпритатор /bin/sh выполнить команду
cat /var/www/.ssh/id_rsa.pub
скопировать вывод строки вроде
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkF3adUjfeqgHV0M662g+Vur4lnIVxv6lWUphLPcPNwkvd1OOsP7CoAZoCmnDmQOEQRlGsjmNhozvkLOgHxlu9o8NeKbfgiIgBPnFcGrV1TtwpT6EhY5dT/MLhycS8Nej3hs2dOvdS+5mEbiPoOJBtlUuYIgjTHdNGrqn5JInYneKHIrzlkhm6MpFzk25qXLCytxzhvmdrKggvxDEKP+kyMrZVvtfntR2UmbYUBMpkjzlKHmlfAASu0IYdnUvmooD1xWsa0ivG6SmM08cLR+iWMDl/av3xxVsSGCT0BzAjYy2Q+VvLOFZgJU9n5K+goAK+WmFmLdlehj0hk6lVguTz root@077c20f70b3d"

6.2
На kvm сервере(host) выполнить
sudo useradd -m -s /bin/bash -G libvirt webvirt
sudo su - webvirt
mkdir .ssh
chmod 700 .ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkF3adUjfeqgHV0M662g+Vur4lnIVxv6lWUphLPcPNwkvd1OOsP7CoAZoCmnDmQOEQRlGsjmNhozvkLOgHxlu9o8NeKbfgiIgBPnFcGrV1TtwpT6EhY5dT/MLhycS8Nej3hs2dOvdS+5mEbiPoOJBtlUuYIgjTHdNGrqn5JInYneKHIrzlkhm6MpFzk25qXLCytxzhvmdrKggvxDEKP+kyMrZVvtfntR2UmbYUBMpkjzlKHmlfAASu0IYdnUvmooD1xWsa0ivG6SmM08cLR+iWMDl/av3xxVsSGCT0BzAjYy2Q+VvLOFZgJU9n5K+goAK+WmFmLdlehj0hk6lVguTz root@077c20f70b3d" > .ssh/authorized_keys

*заменить значение в кавычках на результат в п 6.1


6.3 открыть в браузере sever_ip
login: admin
password: admin
computes->ssh
Имя - то как будет отображаться в панели webvirt
FQDN/IP - доменное имя или ip адрес
Login - webvirt

save
--------------
Если на вкладке computes статус нашего сервера "connected", значит шаги 6.1 - 6.3 выполнены верно и можно двигаться дальше, иначе устранить ошибки, пока статус не станет connected.

Нажимаем на значек "глаз"

переходим на вкладку Storages, жмем + в верхнем правом углу
вкладка Dir. В поле name вводим storage. В поле path вводим /kvm/storage
Нажимаем create

переходим на вкладку Storages, жмем + в верхнем правом углу
вкладка Iso. В поле name вводим iso. В поле path вводим /kvm/iso

*Пути указываемые на вкладке storage должны существовать на kvm сервере (host)

Можно переходить к созданию KVM-виртуальных машин.

# TODO

*перенести webvirtcloud на gitlab, настроить автосборку
*вынести скрипты в репозиторий, настроить скачивание webvirtcloud из репозитория
*упростить инструкцию перенеся все в самораспаковывающийся скрипт
*проверить корректоность выключения и старта KVM
*перенастроить libvirt - чтобы xml настройки тоже были в /kvm
*изучить webvirtcloud на возможность синхронизации после переноса.
*настроить для взаимодействия с внешним nginx


# Использованные материалы
https://www.linuxtechi.com/install-kvm-on-ubuntu-20-04-lts-server/
https://linuxize.com/post/how-to-install-kvm-on-ubuntu-20-04/
https://github.com/retspen/webvirtcloud/wiki/Docker-Installation-&-Update
https://github.com/retspen/webvirtcloud
https://hub.docker.com/r/robtimmer/webvirtmgr
https://bit.ly/36baWUu
https://techviewleo.com/install-webvirtcloud-kvm-web-dashboard-on-ubuntu/
https://hub.docker.com/r/flexible1983/webvirtmgr-docker
