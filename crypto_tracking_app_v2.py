import tkinter as tk
import tkinter.messagebox as MessageBox
import mysql.connector as mysql

class MainWindow:


    def __init__(self, mw):

        mw.geometry("700x400")
        mw.title("Crypto Ledger App")
        mw.configure(bg="gray12")

        mw.date = tk.Label(mw, text='Date of Transaction:', font=('bold', 15))
        mw.date.place(x=25, y=30)
        mw.enter_date = tk.Entry()
        mw.enter_date.place(x=185, y=30)

        mw.symbol = tk.Label(mw, text='Crypto Ticker:', font=('bold', 15))
        mw.symbol.place(x=25, y=80)
        mw.enter_symbol = tk.Entry()
        mw.enter_symbol.place(x=185, y=80)

        mw.txn_type = tk.Label(mw, text='Buy or Sell:', font=('bold', 15))
        mw.txn_type.place(x=25, y=120)
        mw.enter_txn_type = tk.Entry()
        mw.enter_txn_type.place(x=185, y=120)

        mw.exchange = tk.Label(mw, text='Exchange:', font=('bold', 15))
        mw.exchange.place(x=25, y=160)
        mw.enter_exchange = tk.Entry()
        mw.enter_exchange.place(x=185, y=160)





    def insert(self):
        date = enter_date.get()
        symbol = enter_symbol.get()
        txn_type = enter_txn_type.get()






root = tk.Tk()
b = MainWindow(root)
root.mainloop()

