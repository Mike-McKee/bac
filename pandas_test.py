"""
Since we can't build an interactive Tableau dashboard that uses written inputs,
we'll use Python to do it instead.
"""

#Printing first 10 rows using a Data Frame
import pandas as pd

data = pd.read_csv('raw_bac_data.csv', delimiter=';', quoting=3)

select_col = ['"weight"', '"num_of_drinks"', '"blood_alcohol_concentration"', '"can_you_drive"']

df = pd.DataFrame(
    data,
    columns = select_col
)

print(df.head(10))
