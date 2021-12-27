import tkinter as tk
import tkinter.messagebox as MessageBox
import mysql.connector as mysql

class MainWindow:

    def __init__(self, mw):

        self.mw = mw
        mw.geometry("700x400")
        mw.title("crypto_tracking_app_v2.py")
        mw.configure(bg="gray12")

        self.txn_date_label = tk.Label(mw, text='Date of Transaction:', font=('bold', 15))
        self.txn_date_label.place(x=25, y=30)
        self.txn_date_input = tk.Entry()
        self.txn_date_input.place(x=185, y=30)

        self.symbol_label = tk.Label(mw, text='Crypto Ticker:', font=('bold', 15))
        self.symbol_label.place(x=25, y=80)
        self.symbol_input = tk.Entry()
        self.symbol_input.place(x=185, y=80)

        self.txn_type_label = tk.Label(mw, text='Buy or Sell:', font=('bold', 15))
        self.txn_type_label.place(x=25, y=120)
        self.txn_type_input = tk.Entry()
        self.txn_type_input.place(x=185, y=120)

        self.exchange_label = tk.Label(mw, text='Exchange:', font=('bold', 15))
        self.exchange_label.place(x=25, y=160)
        self.clicked = tk.StringVar()
        self.exchange_dropdown = tk.OptionMenu(mw, self.clicked, "Binance", "Coinbase Pro", "Robinhood", "Kraken", "Bittrex", "Coinbase App", "KuCoin Exchange", "BitForex Exchange")
        self.exchange_dropdown.place(x=185, y=160)

        self.price_label = tk.Label(mw, text='Price:', font=('bold', 15))
        self.price_label.place(x=400, y=80)
        self.price_input = tk.Entry()
        self.price_input.place(x=480, y=80)

        self.quantity_label = tk.Label(mw, text='Quantity:', font=('bold', 15))
        self.quantity_label.place(x=400, y=120)
        self.quantity_input = tk.Entry()
        self.quantity_input.place(x=480, y=120)

        self.fee_label = tk.Label(mw, text='Fee:', font=('bold', 15))
        self.fee_label.place(x=400, y=160)
        self.fee_input = tk.Entry()
        self.fee_input.place(x=480, y=160)

        self.insert = tk.Button(mw, text="Insert", highlightbackground='#3E4149', font=("bold", 14), bg="blue", command=self.insert)
        self.insert.place(x=20, y=210)

        self.clear = tk.Button(mw, text="Clear", highlightbackground='#3E4149', font=("bold", 14), bg="blue", command=self.clear_entry)
        self.clear.place(x=130, y=210)

    def insert(self):

        date = self.txn_date_input.get()
        symbol = self.symbol_input.get().upper()
        txn_type = self.txn_type_input.get().upper()
        exchange_name = self.clicked.get()
        price = self.price_input.get()
        quantity = self.quantity_input.get()
        fee = self.fee_input.get()

        if date == "" or symbol == "" or txn_type == "":
            MessageBox.showinfo("Enter Txn data", "All fields are required.")
        else:
            con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="crypto_tracker_db")
            mycursor = con.cursor()
            sql = "INSERT INTO txns (txn_date, symbol, txn_type, exchange_name, price, quantity, fee) VALUES (%s, %s, %s, %s, %s, %s, %s);"
            val = (date, symbol, txn_type, exchange_name, price, quantity, fee)
            mycursor.execute(sql, val)
            # cursor.execute("insert into txns values('"+ str(1) + "', '" + date +"','" + symbol + "', '" + txn_type +"')")
            mycursor.execute("commit")

            MessageBox.showinfo("Txn inserted into DB successfully", "Successful Insertion");
            con.close()

    def clear_entry(self):

        self.txn_date_input.delete("0", "end")
        self.symbol_input.delete("0", "end")
        self.txn_type_input.delete("0", "end")
        self.clicked.set("")
        self.price_input.delete("0", "end")
        self.quantity_input.delete("0", "end")
        self.fee_input.delete("0", "end")


root = tk.Tk()
b = MainWindow(root)
root.mainloop()

