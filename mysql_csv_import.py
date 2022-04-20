import csv
import mysql.connector as mysql

# con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="crypto_tracker_db")
# mycursor = con.cursor()

try:
    with open('/Users/alanjackson/dumps/cb_historical_fills_p1.csv', newline='') as csvfile:
        data = csv.reader(csvfile, delimiter=',', quotechar = '"')
        to_insert = []
        insert_str = "INSERT INTO txns (txn_id, txn_date, symbol, txn_type, exchange_name, price, quantity, fee) VALUES "
        template = '(%s, %s, %s, %s, %s, %s, %s, %s)'
        count = 0
        for row in data:
            count += 1
            to_insert.append(tuple(row))
            if count % 100 == 0:
                query = insert_str + '\n'.join([template % r for r in to_insert])
                # mycursor.execute(query)
                to_insert = []
                # con.commit()
                print(query)
        query = insert_str + '\n'.join(template % to_insert)
        print(query)
        # mycursor.execute(query)
        # con.commit()

finally:
    print('failed')
#     con.close()