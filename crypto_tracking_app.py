from tkinter import *
import tkinter.messagebox as MessageBox
import mysql.connector as mysql

def insert():
    date = enter_date.get()
    symbol = enter_symbol.get()
    txn_type = enter_txn_type.get()

    if date == "" or symbol == "" or txn_type == "":
        MessageBox.showinfo("Enter Txn data", "All fields are required.")
    else:
        con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="py_tk_crypto_tracker")
        cursor = con.cursor()
        cursor.execute("insert into txns values('"+ str(1) + "', '" + date +"','" + symbol + "', '" + txn_type +"')")
        cursor.execute("commit")





        MessageBox.showinfo("Txn inserted into DB successfully", "Successful Insertion");
        con.close()

def get():
    if enter_date.get() == "":
        MessageBox.showinfo("Fetch Status", "Date is needed for Get")
    else:
        con = mysql.connect(host="localhost", user="root", password="msqlrootpw", database="py_tk_crypto_tracker")
        cursor = con.cursor()
        cursor.execute("select * from txns where txn_date='"+ enter_date.get() + "'")
        rows = cursor.fetchall()

        for row in rows:
            enter_date.insert(0, row[1])
            enter_symbol.insert(0, row[2])

        con.close()

root = Tk()
root.geometry("600x300")
root.title("Crypto Ledger - Python + Tkinter + MySQL (2021)")

date = Label(root, text='Date of Transaction:', font=('bold', 20))
date.place(x=20, y=30)
enter_date = Entry()
enter_date.place(x=265, y=30)

symbol = Label(root, text='Ticker Symbol:', font=('bold', 20))
symbol.place(x=20, y=60)
enter_symbol = Entry()
enter_symbol.place(x=265, y=60)

txn_type = Label(root, text='Buy or Sell:', font=('bold', 20))
txn_type.place(x=20, y=90)
enter_txn_type = Entry()
enter_txn_type.place(x=265, y=90)

insert = Button(root, text="insert", font=("italic", 14), bg="white", command=insert)
insert.place(x=20, y=140)

get = Button(root, text="get", font=("italic", 14), bg="white", command=get)
get.place(x=390, y=120)

root.mainloop()