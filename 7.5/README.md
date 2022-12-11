# Домашнее задание к занятию "7.5. Основы golang"

С `golang` в рамках курса, мы будем работать не много, поэтому можно использовать любой IDE. 
Но рекомендуем ознакомиться с [GoLand](https://www.jetbrains.com/ru-ru/go/).  

## Задача 1. Установите golang.
1. Воспользуйтесь инструкций с официального сайта: [https://golang.org/](https://golang.org/).
2. Так же для тестирования кода можно использовать песочницу: [https://play.golang.org/](https://play.golang.org/).
 
 Ответ:
```
Установил
[vitalii@fedora ~]$ go version
go version go1.19.4 linux/amd64

Также установил Trial версию IDE GoLand 2022.3
GoLand 2022.3
Build #GO-223.7571.176, built on November 29, 2022
Licensed to Vitalii Vakhromeev
Subscription is active until January 9, 2023.
Evaluation purpose only.
Runtime version: 17.0.5+1-b653.14 amd64
VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o.
Linux 6.0.11-300.fc37.x86_64
GC: G1 Young Generation, G1 Old Generation
Memory: 750M
Cores: 12
Registry:
    suggest.all.run.configurations.from.context=true
    ide.completion.variant.limit=500
Current Desktop: KDE
```

## Задача 2. Знакомство с gotour.
У Golang есть обучающая интерактивная консоль [https://tour.golang.org/](https://tour.golang.org/). 
Рекомендуется изучить максимальное количество примеров. В консоли уже написан необходимый код, 
осталось только с ним ознакомиться и поэкспериментировать как написано в инструкции в левой части экрана.  

Ответ:
```
Поизучал примеры
```

## Задача 3. Написание кода. 
Цель этого задания закрепить знания о базовом синтаксисе языка. Можно использовать редактор кода 
на своем компьютере, либо использовать песочницу: [https://play.golang.org/](https://play.golang.org/).

1. Напишите программу для перевода метров в футы (1 фут = 0.3048 метр). Можно запросить исходные данные 
у пользователя, а можно статически задать в коде.
    Для взаимодействия с пользователем можно использовать функцию `Scanf`:
    ```
    package main
    
    import "fmt"
    
    func main() {
        fmt.Print("Enter a number: ")
        var input float64
        fmt.Scanf("%f", &input)
    
        output := input * 2
    
        fmt.Println(output)    
    }
    ```
 
2. Напишите программу, которая найдет наименьший элемент в любом заданном списке, например:
    ```
    x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
    ```
3. Напишите программу, которая выводит числа от 1 до 100, которые делятся на 3. То есть `(3, 6, 9, …)`.

В виде решения ссылку на код или сам код. 

Ответ:
```
Программа "Перевод метроы в футы"
package main
import (
	"fmt"
	"math"
)
func main() {
	fmt.Print("Введите количество метров: ")
	var input float64
	fmt.Scanf("%f", &input)

	output := input / 0.3048
	fmt.Println("Количество футов будет")
	fmt.Println(math.Ceil(output*100) / 100)
}

Выполнение

GOROOT=/home/vitalii/go/go1.19.4 #gosetup
GOPATH=/home/vitalii/go #gosetup
/home/vitalii/go/go1.19.4/bin/go build -o /tmp/GoLand/___go_build_awesomeProject2 awesomeProject2 #gosetup
/tmp/GoLand/___go_build_awesomeProject2
Введите количество метров: 2
Количество футов будет
6.57

Программа "Наименьший элемент"

package main

import (
	"fmt"
	"sort"
)

func main() {
	fmt.Println()
	var x = []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}
	fmt.Println("Исходный массив", x)
	sort.Ints(x)
	fmt.Println("Отсортированный массив")
	fmt.Println(x)
	fmt.Println(" Минимальный элемент массива:", x[0])
}

Выполнение

GOROOT=/home/vitalii/go/go1.19.4 #gosetup
GOPATH=/home/vitalii/go #gosetup
/home/vitalii/go/go1.19.4/bin/go build -o /tmp/GoLand/___go_build_awesomeProject2 awesomeProject2 #gosetup
/tmp/GoLand/___go_build_awesomeProject2

Исходный массив [48 96 86 68 57 82 63 70 37 34 83 27 19 97 9 17]
Отсортированный массив
[9 17 19 27 34 37 48 57 63 68 70 82 83 86 96 97]
 Минимальный элемент массива: 9

- Программа "Выводит числа от 1 до 100, которые делятся на 3"

package main

import (
	"fmt"
)

func main() {
	fmt.Println()
	for i := 1; i <= 100; i++ {
		if (i % 3) == 0 {
			fmt.Print(i, " ")
		}
	}
}

Выполнение
GOROOT=/home/vitalii/go/go1.19.4 #gosetup
GOPATH=/home/vitalii/go #gosetup
/home/vitalii/go/go1.19.4/bin/go build -o /tmp/GoLand/___go_build_awesomeProject2 awesomeProject2 #gosetup
/tmp/GoLand/___go_build_awesomeProject2

3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96 99 
Process finished with the exit code 0
```

## Задача 4. Протестировать код (не обязательно).

Создайте тесты для функций из предыдущего задания. 

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---

