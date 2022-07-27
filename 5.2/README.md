# Домашнее задание к занятию "5.2. Применение принципов IaaC в работе с виртуальными машинами"
---
## Задача 1
Опишите своими словами основные преимущества применения на практике IaaC паттернов.
Какой из принципов IaaC является основополагающим?

Ответ:
1. Ускорение производства и вывода продукта на рынок
2. Стабильность среды, устранение дрейфа конфигураций
3. Более быстрая и эффективная разработка

Главное преимущество Iaac Идемпотентность

Это свойств при котором при выполнении повторной операции   мы получаем такой же результат.

---

## Задача 2

Чем Ansible выгодно отличается от других систем управление конфигурациями?
Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

Ответ:

Главный плюс Ansible в том, что он работает на существующей ssh инфраструктуре. 

Pull более надежный, т. к. идет обращение к одному серверу с разных источников и в определенный период времени. А при Push сервер может быть сильно загруженным и начать тормозить 
---

## Задача 3

Установить на личный компьютер:

VirtualBox
Vagrant
Ansible
Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.

Ответ:
```
[vitalii@fedora 5.2 IAAC]$ rpm -qa | grep VirtualBox 
VirtualBox-6.1-6.1.36_152435_fedora36-1.x86_64

vitalii@fedora 5.2 IAAC]$ rpm -qa | grep vagr* 
vagrant-2.2.19-4.fc36.noarch 
vagrant-libvirt-0.7.0-2.fc36.noarch

[vitalii@fedora 5.2 IAAC]$ vagrant --version 
Vagrant 2.2.19

[vitalii@fedora 5.2 IAAC]$ rpm -qa | grep ansible* 
ansible-srpm-macros-1-5.fc36.noarch 
ansible-packaging-1-5.fc36.noarch 
ansible-core-2.12.7-1.fc36.noarch 
ansible-5.9.0-1.fc36.noarch

[vitalii@fedora 5.2 IAAC]$ ansible --version 
ansible [core 2.12.7] 
config file = /etc/ansible/ansible.cfg 
configured module search path = ['/home/vitalii/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules'] 
ansible python module location = /usr/lib/python3.10/site-packages/ansible 
ansible collection location = /home/vitalii/.ansible/collections:/usr/share/ansible/collections 
executable location = /usr/bin/ansible 
python version = 3.10.5 (main, Jun  9 2022, 00:00:00) [GCC 12.1.1 20220507 (Red Hat 12.1.1-1)] 
jinja version = 3.0.3 
libyaml = True

```



---

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

Создать виртуальную машину.
Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды
docker ps

Ответ:

Сделал, вывод  запущенных процессов пустой. Что не так? 

```
[vitalii@fedora src]$  cd /home/vitalii/NETOLOGY/virt/virt-homeworks-virt-11/05-virt-02-iaac/src/vagrant

[vitalii@fedora vagrant]$ vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
==> server1.netology: Matching MAC address for NAT networking...
==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202112.19.0' is up to date...
==> server1.netology: Setting the name of the VM: server1.netology
==> server1.netology: Clearing any previously set network interfaces...
The IP address configured for the host-only network is not within the
allowed ranges. Please update the address used to be within the allowed
ranges and run the command again.

  Address: 192.168.192.111
  Ranges: 192.168.56.0/21

Valid ranges can be modified in the /etc/vbox/networks.conf file. For
more information including valid format see:

  https://www.virtualbox.org/manual/ch06.html#network_hostonly

[vitalii@fedora vagrant]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

```