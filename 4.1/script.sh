#!usr/bin/env  bash
cat /dev/null > host.log
pause=2
array_ip=(92.246.149.82 92.246.149.83 192.168.18.1)
echo ${array_ip[@]}
for i in ${array_ip[@]}  
do 
	echo  "Проверка Ip адреса $i"
	for n in {1..5}
	do 	
		curl -s --connect-timeout $pause $i:80 >/dev/null
		rc=$?
		#echo $rc		
		if (($rc == 0))
		then echo "Адрес $i доступен" >> host.log
		else  echo "Адрес $i не доступен" >> host.log
		fi
	done
done

