#!usr/bin/env  bash
cat /dev/null > error.log
pause=2
array_ip=(92.246.149.82 92.246.149.83 192.168.18.1)
echo ${array_ip[@]}
rc=0

while (($rc == 0)) 

do
	for i in ${array_ip[@]}  
	do 
		echo  "Проверка Ip адреса $i"
		curl -s --connect-timeout $pause $i:80 >/dev/null
		rc=$?
			if (($rc != 0))
			then echo "Ошибка  адрес $i не доступен" >> error.log
			#break
		fi
	done
done

