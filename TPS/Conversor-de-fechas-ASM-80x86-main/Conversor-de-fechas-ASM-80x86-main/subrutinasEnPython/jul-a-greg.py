#pregunto por biciesto
#voy restando hasta que el numero de dia sea menor a cero y me quedo con el dia al que llegue y el mes

dias = [ 31, 29, 31, 30, 31, 30,
               31, 31, 30, 31, 30, 31 ]

meses = [1,2,3,4,5,6,7,8,9,10,11,12]

def JulAGreg(dia,anio):

    if anio < 50:
        dif = 2000
    elif anio == 2000:
        dif = 0
    else:
        dif = 1900

    i= 0
    while(dia >0):
        diaDelMes = dia
        dia = dia - dias[i]
        if dia>0:
            i+=1
            
    mes = meses[i] 
    anioFinal = anio+dif

    print(diaDelMes,"/",mes,"/",anioFinal)

JulAGreg(59,98)


        