import csv

with open('/Users/alanjackson/dumps/cb_historical_fills_p3_v2.csv', newline='') as csvfile:
    data = csv.reader(csvfile, delimiter=',', quotechar = '"')
    tuple_list=[]
    for row in data:
        tuple_list.append(tuple(i for i in row))

print(tuple_list)
