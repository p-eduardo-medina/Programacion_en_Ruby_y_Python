# -*- coding: utf-8 -*-
"""
Created on Tue Jun 2 16:27:17 2021

@author: Pedro Eduardo Medina
"""
def Factorial(N):
    T=1
    if N!=1:
        T=N*Factorial(N-1)
    else:
        T = 1
    return T

class complexnum:
    koind = 'Maths'
    f = Factorial
    def __init__(self,realpart,imagpart):
        self.re = realpart
        self.im = imagpart
        self.tricks = []
    def saludar(self):
        return "Hello World"
    def add_tricks(self,trick):
        self.tricks.append(trick)

x = complexnum(2,4)
xsaludar = x.saludar
print(xsaludar())
xtr = x.add_tricks
xtr(3)
xtr(2)
xtr(1)

print(x.tricks)
