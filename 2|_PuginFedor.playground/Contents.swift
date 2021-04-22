import Foundation
//Функция определения четного числа
func parity(number: Int){
    if(number%2==0)
    {
        print("Yes")
    }else{
        print("No")
    }
}

parity(number:2)

//Функция на 3 без остатка
func ParityThree(number: Int){
    if(number%3==0)
    {
        print("Yes")
    }else{
        print("No")
    }
}

ParityThree(number:3)

//Задать массив возрастающих чисел.
var mas=[Int](1...100)
print(mas)

//Удалить из массива все четные,не делящиеся на 3 числа
var i:Int=0
while i<mas.count{
    if(mas[i]%2 == 0)
    {
        mas.remove(at: i)
    }
    i+=1
}

i=0
while i<mas.count{
    if(mas[i]%3 == 0)
    {
        mas.remove(at: i)
    }
    i+=1
}

print(mas)


