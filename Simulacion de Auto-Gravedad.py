"""
Created on Mon May 31 13:29:56 2021
@author: Pedro Eduardo Medina Gonzalez
"""
#Importar las librerias necesarias
import matplotlib.pyplot as plt
import numpy as np
import math


plt.close("all")
#Funciones Auxiliares
def Pol(Coef,x):
    v = 0
    for i in Coef:
        v += i*x**(Coef.index(i))
    return v

def IntArr(x,arr):
    sum =0.0000
    if len(x) == len(arr):
        for i in range(len(x)-1):
            sum += (x[i+1]-x[i])*((arr[i+1]+arr[i])/2)               
    else:
        print("Funcion no valida, no coincide las dimensiones de los arreglos")
    return sum 
def Fseno(Arr,x):
    return Arr[0]*math.sin(Arr[1]*x + Arr[2])
def Fcoseno(Arr,x):
    return Arr[0]*math.cos(Arr[1]*x + Arr[2])
def Expon(A,arg):
    return A*math.exp(arg)






#Definición del vector dominio y demás vectores.
Inicio =-5
Final=5
Numdedivisiones=102
x = np.linspace(Inicio, Final, Numdedivisiones)  
rho = []
phi1=np.zeros(len(x))
phi2 = np.zeros(len(x))
dif = np.zeros(len(x))

#Asignación del vector rho
for i in x:
    if (i>=-4 and i<=4):
        #rho.append( Pol([4**2,0,-1],i) )
        rho.append(Fseno([2,1.5,0],i) + Fseno([1.2,1,0],i))
        #rho.append(Fseno([2,1.5,0],i))
        #rho.append(Expon(1,i))
    else:
        rho.append(0)

Ran = [10,100,1000,10000]  #Numero de Iteraciones
NumofPic=10 #Especifica el Numofit
path = "C:/Users/power/Documents/UNAM/Tesis/Programacion en Python/Imagenes"
intrie = []

plt.figure()
plt.plot(x, rho)    
plt.title('Grafica de densidad')
plt.ylabel(r'$\rho$')
plt.xlabel('Vector x')      
plt.grid()


for m in Ran:
    y=[]
    Numofit = int(m/NumofPic) #Cuantas veces quiere que se represente la gráfica
    
    #Ciclo For de asignaciones
    print("\n\n\n\n\n\n\n\n Calculo para la iteracion de:"+str(m))
    plt.figure()
    for s in range(m+1):
        #Definición de fronteras
        phi1[0] = 0
        phi1[len(x)-1] =0
        # Definición del vector phi2
        for i in range(1,len(x)-1):
            phi2[i] = 0.5*(phi1[i-1]+phi1[i+1]-rho[i])              
        #Verificar el avance del programa        
        if(s%int((m/10))==0 and s!=0):
            print("Avance de los calculos en un: "+str(100*s/m)+"%")
        #Gráfica de los vectores                                             
        if(s%Numofit==0):
            plt.plot(x, phi2)    
            plt.title('Recursion hasta:'+str(s))
            plt.ylabel('$\phi$')
            plt.xlabel('x')      
            plt.grid()
            path = "C:/Users/power/Documents/UNAM/Tesis/Programacion en Python/Imagenes"            
            pname=path+"/Imagen-"+str(s).rjust(len(str(Ran)),'0')+".png" 
            plt.savefig(pname)
        #Renovación e los vectores             
        phi1=phi2
        (y.append(abs(IntArr(x,phi2)))) if(len(y)==0) else(y.append(abs(IntArr(x,phi2))))

#Grafica del error
z = []
print("\n\n\n\n\n\n\n\nCalculo del error:")
for i in y:
    if (y.index(i))%int((len(y)/10))==0:
        print("Avance de los calculos del error: "+str(int(100*y.index(i)/len(y)+1))+"%")
    z.append(abs(i-y[y.index(i)-1])) if(y.index(i)!=0) else z.append(abs(y[1]-y[0]))


plt.figure()
plt.plot(z)
plt.title('Gráfica de la integral del error')
plt.annotate('$\int (\phi_n - \phi_{n-1})dx$',(len(z)/5,max(z)*0.9),fontsize=16)
plt.grid()






