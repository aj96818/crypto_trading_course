import tkinter as tk
import tkinter.messagebox as MessageBox
import mysql.connector as mysql

class MainWindow:

    def __init__(self, mw):

        self.mw = mw
        mw.geometry("700x400")
        mw.title("Crypto Ledger App")
        mw.configure(bg="gray12")

        self.txn_date_label = tk.Label(mw, text='Date of Transaction:', font=('bold', 15))
        self.txn_date_label.place(x=25, y=30)

        self.symbol_label = tk.Label(mw, text='Crypto Ticker:', font=('bold', 15))
        self.symbol_label.place(x=25, y=80)

        self.txn_type_label = tk.Label(mw, text='Buy or Sell:', font=('bold', 15))
        self.txn_type_label.place(x=25, y=120)

        self.exchange_label = tk.Label(mw, text='Exchange:', font=('bold', 15))
        self.exchange_label.place(x=25, y=160)

        self.txn_date_input = tk.Entry()
        self.txn_date_input.place(x=185, y=30)

        self.symbol_input = tk.Entry()
        self.symbol_input.place(x=185, y=80)

        self.txn_type_input = tk.Entry()
        self.txn_type_input.place(x=185, y=120)

        self.exchange_input = tk.Entry()
        self.exchange_input.place(x=185, y=160)

        self.insert = tk.Button(mw, text="insert", font=("italic", 14), bg="blue", command=self.insert)
        self.insert.place(x=20, y=210)

    def insert(self):

        date = self.txn_date_input.get()
        symbol = self.symbol_input.get()
        txn_type = self.txn_type_input.get()
        # exchange = self.exchange_input.get()

        if date == "" or symbol == "" or txn_type == "":
            MessageBox.showinfo("Enter Txn data", "All fields are required.")
        else:
            con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="crypto_tracker_db")
            mycursor = con.cursor()
            sql = "INSERT INTO txns (txn_date, symbol, txn_type) VALUES (%s, %s, %s);"
            val = (date, symbol, txn_type)
            mycursor.execute(sql, val)
            # cursor.execute("insert into txns values('"+ str(1) + "', '" + date +"','" + symbol + "', '" + txn_type +"')")
            mycursor.execute("commit")

            MessageBox.showinfo("Txn inserted into DB successfully", "Successful Insertion");
            con.close()



root = tk.Tk()
b = MainWindow(root)
root.mainloop()

