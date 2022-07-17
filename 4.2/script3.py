##!/usr/bin/env python3
import socket

dyct_addr = {'drive.google.com':'74.125.205.194','mail.google.com':'74.125.131.17', 'google.com':'216.239.38.120'}
# socket.gethostbyname('yandex.ru')
for host in dyct_addr:
    ip = socket.gethostbyname(host)
    print(host+":"+ip)
    if ip != dyct_addr[host]:
        print("[ERROR]" + host + " " "IP mismatch:" +  " " +  dyct_addr[host] + " " + ip)



