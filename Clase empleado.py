# -*- coding: utf-8 -*-
"""
Created on Tue Jun  8 17:08:34 2021

Autor: Pedro Eduard Medina González
"""
#Definición de la clase Employye
class Employee(object):
    def __init__(self,Fullname, salary=None, height=None, nationality=None):
        self.Fullname = Fullname
        self.salary = salary
        self.height = height
        self.nationality = nationality
    def name(self):
        Fullname = self.Fullname
        ArrName = Fullname.split()
        return ArrName[0]
    def lastname(self):
        Fullname = self.Fullname
        ArrName = Fullname.split()
        return ArrName[1]
    def height(self):
        height = self.height
        return height
    def nationality(self):
        nationality = self.nationality
        return nationality

john = Employee("John Doe")
mary = Employee("Mary Major", salary=120000)
richard = Employee("Richard Roe", salary=110000, height=178)
giancarlo = Employee("Giancarlo Rossi", salary=115000, height=182, nationality="Italian")

def atbash(txt):
    Newtxt = ''
    import string
    Alp = list(string.ascii_lowercase)
    for char in txt.lower():
        sc = Alp[len(Alp)-1-Alp.index(char)] if (char in Alp) else ' '
        Newtxt+=sc
    return Newtxt

print(atbash("apple")) #➞ "zkkov"

print(atbash("hello world")) #➞ "Svool dliow!

print(atbash("Pedro Eduardo Medina Gonzalez"))
