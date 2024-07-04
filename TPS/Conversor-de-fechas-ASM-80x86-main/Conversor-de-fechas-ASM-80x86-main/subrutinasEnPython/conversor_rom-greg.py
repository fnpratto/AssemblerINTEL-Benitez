def rom_value(r):  
    if (r == 'I'):  
        return 1  
    if (r == 'V'):  
        return 5  
    if (r == 'X'):  
        return 10  
    if (r == 'L'):  
        return 50  
    if (r == 'C'):  
        return 100  
    if (r == 'D'):  
        return 500  
    if (r == 'M'):  
        return 1000  
    return -1  
def romanToDecimal(str):  
    res = 0  
    i = 0  
  
    while (i < len(str)):  
  
       
        n1 = rom_value(str[i])  
  
        if (i + 1 < len(str)):  
  
         
            n2 = rom_value(str[i + 1])  
  
            # Comparing both rom_values  
            if (n1 >= n2):  
  
                res = res + str1  
                i = i + 1  
            else:  
  
                # rom_value of current symbol is greater  
                # or equal to the next symbol  
                res = res + str2 - str1  
                i = i + 2  
        else:  
            res = res + str1  
            i = i + 1  
  
    return res  
  
print(romanToDecimal("VII"))  