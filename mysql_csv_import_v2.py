import csv

with open('/Users/alanjackson/dumps/binance_txns_import.csv', newline='') as csvfile:
    data = csv.reader(csvfile, delimiter=',', quotechar = '"')
    tuple_list=[]
    for row in data:
        tuple_list.append(tuple(i for i in row))

print(tuple_list)
