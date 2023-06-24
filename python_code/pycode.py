"""
Here's the plan. Write a script that has the user input their weight
and the number of drinks they had during the night. 

Then we'll use their inputs to find the corresponding row in the
raw_bac_data.csv and print two things:
1) their bac
2) whether or not they can drive
"""

import pandas as pd

#read csv file
data = pd.read_csv('raw_bac_data.csv', delimiter=';', quoting=3)

#runs until user gives valid inputs
status  = True
while status == True:

    ip_weight = int(input("Enter your weight: "))
    ip_num_of_drinks = int(input("Enter how many alcoholic drinks you've had tonight: "))
    
    #testing user inputs
    if ip_weight <= 70:
        print("Weight too small. Enter one greater than 69 pounds.")
    elif ip_weight > 400:
        print("Weight too large. Enter one less than 401 pounds.")
    elif ip_num_of_drinks < 0:
        print("Number of drinks too small. Enter number between 0 and 15.")
    elif ip_num_of_drinks > 15:
        print("Number of drinks too large. Enter number between 0 and 15.")
    else:
        #finding row in csv that matches the user's inputs
        user_data = data[(data['"weight"'] == ip_weight) & (data['"num_of_drinks"'] == ip_num_of_drinks)]

        #selects data in "blood_alchohol_concentration" and "can_you_drive" columns
        bac = user_data['"blood_alcohol_concentration"'].values[0]
        can_you_drive = user_data['"can_you_drive"'].values[0]
        
        #prints values
        print("Your BAC: ", round(bac, 2))
        print("Can you legally drive: ", can_you_drive)
        
        #ends while loop
        status = False

"""
Now I'm wondering whether it's better to keep everything in the while loop or if
I should return the weight/num_of_drinks inputs once they pass all the if and elif
statements.

Which one would result in the fastest code?
"""