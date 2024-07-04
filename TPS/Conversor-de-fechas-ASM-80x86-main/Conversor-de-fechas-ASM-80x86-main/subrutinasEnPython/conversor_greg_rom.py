#Trabajo práctico Nro
#Conversor de Fechas
#Desarrollar un programa en assembler Intel 80x86 que permita convertir fechas válidas con el 
# formato DD/MM/AAAA a formato romano y/o juliano (DDD/AA); también debe permitir su inversa.
#Ejemplo:
# - Formato Fecha (DD/MM/AAAA): 14/10/2020
# - Formato Romano: XIV / X / MMXX
# - Formato Juliano (DDD/AA): 288/20

numRomanoFinal = ""

valores = [
            1000, 900, 500, 400,
            100, 90, 50, 40,
            10, 9, 5, 4,
            1
            ]

simbolos = [
            "M ", "CM", "D", "CD",
            "C", "XC","L","XL",
            "X", "IX", "V", "IV",
            "I"
            ]


def enteroARomano(num):
        
        numRomano = ''
        i = 0
        if num > 0:
            rcx = 1
        else:
            rcx = 0
        if rcx:
            num, numRomano, i = pasarARomano(num, numRomano, i)
        
        #print(numRomano)
        
        return numRomano

def pasarARomano (num, numRomano,i):
    rci = num//valores[i]
    while rci > 0:
        numRomano += simbolos[i]
        num -= valores[i]
        #print(valores[i])
        rci -=1
        #print(num)    

    i +=1
    if num>0:
        pasarARomano(num, numRomano, i)    

    print(numRomano)

    return num, numRomano, i    
    
def main():
    print("Ingrese una fecha con el formato DD MM AAAA: ",end="")
    fecha = input()
    diaEsp = int( fecha[:2] )
    mesEsp = int( fecha[3:5] )
    anioEsp = int( fecha[6:10] )
    
    print(diaEsp,mesEsp,anioEsp)

    diaRomano = enteroARomano(diaEsp)
    print("fin dia")
    #print(numRomanoFinal)
    mesRomano = enteroARomano(mesEsp)
    print("fin mes")
    anioRomano = enteroARomano(anioEsp)
    print("fin anio")
    #print(numRomanoFinal, mesRomano, anioRomano)

main()

   
