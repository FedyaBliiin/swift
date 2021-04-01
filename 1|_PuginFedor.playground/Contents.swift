import Foundation
//Решение квадратного уравнения.
let a:Double=1,b:Double=6,c:Double=(-7);
var x1:Double=0,x2:Double=0,d:Double=0;
d=b*b-4*a*c;
x1=((-b)+sqrt(d))/(2.0*a);
x2=((-b)-sqrt(d))/(2.0*a);
print("Корни уревнения равны = ",x1,x2);
//Плоащадь, периметр, гипотенуза.
let k1:Double=4,k2:Double=4;
var g:Double=0,S:Double=0,P:Double=0;
g=sqrt(sqrt(k1)+sqrt(k2));
S=0.5*k1*k2;
P=g+k1+k2;
print("Площадь треугольника = ",S, " периметр треугольника = ",P," гипотнуза = ",g);
//Пользователь вводит сумму вклада и годовой процент. Найти сумму через 5 лет
var sum:Double=1000,prec:Double=15;
prec=prec/100;
var res1=sum+(sum*prec);
var res2=res1+(res1*prec);
var res3=res2+(res2*prec);
var res4=res3+(res3*prec);
var res5=res4+(res4*prec);
print("Сумма вклада через 1 год =",res1);
print("Сумма вклада через 2 года =",res2);
print("Сумма вклада через 3 года =",res3);
print("Сумма вклада через 4 года =",res4);
print("Сумма вклада через 5 лет =", res5);
