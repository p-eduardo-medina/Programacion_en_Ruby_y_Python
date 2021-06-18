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
        print(f,n)
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
    i=0 
    PN = []
    while len(PN)<num:
        i+=1
        PN = (Numprimos(i)).keys()
    return PN


#a = Nnumerosprimos(8)
""" Función para determinar si un numero puede ser vist solo por 5's y 3's """  
def only_5_and_3(n):       
    bln = True
    A = {}
    B = n
    while bln:
        f = n
        if ((n-5)%5 == 0 or (n-5)%3==0) and n>0:
            n-=5
            if 5 in A:
                A[5]+=1
            else:
                A[5]=1
            next
        if ((n-3)%3==0 or (n-3)%5==0) and n>0:
            n-=3  
            if 3 in A:
                A[3]+=1
            else:
                A[3]=1      
            next
        if f==n:
            bln = False
            return "No es valido"
            A = {}
        elif(n<=0):
            bln = False        
    Str = "\n\nEl numero " +str(B)+ " puede se visto como: "  + "<<<3x"+str(A[3])+"+5x"+str(A[5])+">>>"
    return Str

#print(only_5_and_3(26))
"""  Función para hacer slit de un numero enterox """
def num_split(num):
    A = []
    sign = num/abs(num) 
    N = str(abs(num))
    while len(N)>0:
        A.append( int(sign*int(N[0])*10**(len(N)-1)))
        N = N[1:]
    return A
#print(num_split(-8346510000))


def who_won(board):	
    par = ["O","X"]
    winner=""
    bol = 0
    for p in par:
        bol = 0
        for i in range(3):
            b = 1 if (p == board[0][i] and board[0][i]==board[1][i] and board[1][i] == board[2][i]) else 0              
            bol +=b
        for i in range(3):
            b =1 if (p == board[i][0] and board[i][0] == board[i][1] and board[i][1] == board[i][2]) else 0
            bol+=b
        b=1 if(p ==board[i][0] and (board[0][0]==board[1][1] and board[1][1] == board[2][2])or(p ==board[i][0] and board[0][2]==board[1][1] and board[1][1] == board[2][0])) else 0        
        bol+=b
        if bol>0:
            winner = p
    return winner


"""
print("El ganador es:" + who_won([
  ["O", "X", "O"],
  ["X", "X", "O"],
  ["O", "X", "X"]
]) )# ➞ "X"
    
print("El ganador es:" + who_won([
  ["O", "O", "X"],
  ["X", "O", "X"],
  ["O", "O", "O"]
]))# ➞ "X"
print("El ganador es:" + who_won([
  ["O", "O", "X"],
  ["O", "X", "X"],
  ["X", "O", "O"]
]))# ➞ "X"
"""


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        