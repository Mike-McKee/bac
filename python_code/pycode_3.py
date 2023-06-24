"""
This script shortens the WHILE loop even more than in pycode_2.py and
introduces functions to make the code easier to read and maintain.
"""

import pandas as pd

#read csv file
data = pd.read_csv('raw_bac_data.csv', delimiter=';', quoting=3)

#ask for inputs
def get_inputs():
    ip_weight = int(input("Enter your weight: "))
    ip_num_of_drinks = int(input("Enter how many alcoholic drinks you've had tonight: "))
    return ip_weight, ip_num_of_drinks

#avlidates inputs with csv file
def check_inputs(weight, num_of_drinks):
    if weight <= 70:
        print("Weight too small. Enter one greater than 69 pounds.")
        return False
    elif weight > 400:
        print("Weight too large. Enter one less than 401 pounds.")
        return False
    elif num_of_drinks < 0:
        print("Number of drinks too small. Enter number between 0 and 15.")
        return False
    elif num_of_drinks > 15:
        print("Number of drinks too large. Enter number between 0 and 15.")    
        return False
    return True

#runs until user gives valid inputs
status  = False
while status == False:
    w, n = get_inputs()
    status = check_inputs(w, n)

#finding row in csv that matches the user's inputs
user_data = data[(data['"weight"'] == w) & (data['"num_of_drinks"'] == n)]

#selects data in "blood_alchohol_concentration" and "can_you_drive" columns
bac = user_data['"blood_alcohol_concentration"'].values[0]
can_you_drive = user_data['"can_you_drive"'].values[0]

#prints values
print("Your BAC: ", round(bac, 2))
print("Can you legally drive: ", can_you_drive)