import tkinter as tk
import mysql.connector as mysql
import tkinter.messagebox as MessageBox

con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="crypto_tracker_db")
mycursor = con.cursor()
delsql = "DELETE FROM txns WHERE txn_id = 262;"
mycursor.execute(delsql)
# cursor.execute("insert into txns values('"+ str(1) + "', '" + date +"','" + symbol + "', '" + txn_type +"')")
mycursor.execute("commit")

MessageBox.showinfo("Txn deleted successfully", "Successful Deletion");
con.close()
