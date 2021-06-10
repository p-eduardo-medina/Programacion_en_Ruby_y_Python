# -*- coding: utf-8 -*-
"""
Created on Thu Jun 10 18:23:16 2021

@author: Pedro Eduardo Medina González
"""
#Calcular los numero primos y sius potencias de numeros
def SimpArray(arr):
    A = {}
    for i in arr:
        if i in A:
            A[i]+=1
        else:
            A[i] = 1
    return A    

def Numprimos(n):
    a = []
    while n % 2 == 0:
        a.append(2)
        n /= 2
    f = 3   
    while f * f <= n:        
        if n % f == 0:
            a.append(f)
            n /= f
        else:
            f += 2
    if n != 1: a.append(int(n))   
    a = SimpArray(a)
    return a
# a.keys()   a.values()
def Nnumerosprimos(num):
    