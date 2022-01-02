
import tkinter as tk
import tkinter.messagebox as MessageBox
import mysql.connector as mysql
from tkinter import TclError


class SampleApp(tk.Tk):

    def __init__(self, *args, **kwargs):
        tk.Tk.__init__(self, *args, **kwargs)
        self.geometry("700x400")
        self.title("Account Balances App (account_balances_app_v2.py)")
        self.configure(bg="#49A")

        self.text_box = tk.Text(self, width=40, height=8)
        self.text_box.delete('1.0', 'end')
        self.text_box.place(x=185, y=200)
        self.paste_button = tk.Button(self, text="Paste", command=self.doit)
        self.paste_button.place(x=100, y=240)
        self.doit()

        self.clear_button = tk.Button(self, text="Clear", command=self.clear_text_input)
        self.clear_button.place(x=100, y=280)
        self.clear_text_input()

        self.txn_date_label = tk.Label(self, text='Last Updated:', font=('bold', 15))
        self.txn_date_label.place(x=25, y=30)
        self.txn_date_input = tk.Entry()
        self.txn_date_input.place(x=185, y=30)

        self.symbol_label = tk.Label(self, text='Symbol:', font=('bold', 15))
        self.symbol_label.place(x=25, y=80)
        self.symbol_input = tk.Entry()
        self.symbol_input.place(x=185, y=80)

        self.crypto_name_label = tk.Label(self, text='Crypto Name:', font=('bold', 15))
        self.crypto_name_label.place(x=25, y=120)
        self.crypto_name_input = tk.Entry()
        self.crypto_name_input.place(x=185, y=120)

        self.exchange_label = tk.Label(self, text='Location:', font=('bold', 15))
        self.exchange_label.place(x=25, y=160)
        self.clicked = tk.StringVar()
        self.exchange_dropdown = tk.OptionMenu(self, self.clicked, "Binance Exchange", "Coinbase Pro Exchange", "Robinhood", "Kraken", "Bittrex", "Coinbase App", "KuCoin Exchange", "BitForex Exchange", "Metamask Wallet", "Trezor Hardware Wallet",
                                               "fWallet (Fantom)", "Exodus Desktop App for Mac", "Terra Station Desktop App for Mac", "Phantom Chrome Extension Wallet",
                                               "Pancakeswap", "Other")
        self.exchange_dropdown.place(x=185, y=160)

        self.price_label = tk.Label(self, text='Quantity:', font=('bold', 15))
        self.price_label.place(x=400, y=30)
        self.price_input = tk.Entry()
        self.price_input.place(x=480, y=30)

        self.quantity_label = tk.Label(self, text='URL:', font=('bold', 15))
        self.quantity_label.place(x=400, y=80)
        self.quantity_input = tk.Entry()
        self.quantity_input.place(x=480, y=80)

        self.notes_label = tk.Label(self, text='Notes:', font=('bold', 15))
        self.notes_label.place(x=400, y=120)
        self.notes_input = tk.Entry()
        self.notes_input.place(x=480, y=120)

        self.wallet_label = tk.Label(self, text='Wallet Address:', font=('bold', 15))
        self.wallet_label.place(x=25, y=200)
        # self.wallet_input = tk.Entry()
        # self.wallet_input.place(x=185, y=200)

        self.insert = tk.Button(self, text="Insert", highlightbackground='#3E4149', font=("bold", 14), bg="blue", command=self.insert)
        self.insert.place(x=300, y=340)

        self.clear = tk.Button(self, text="Clear Form", highlightbackground='#3E4149', font=("bold", 14), bg="blue", command=self.clear_entry)
        self.clear.place(x=390, y=340)

    def insert(self):

        date = self.txn_date_input.get()
        symbol = self.symbol_input.get().upper()
        crypto_name = self.crypto_name_input.get()
        exchange_name = self.clicked.get()
        price = self.price_input.get()
        quantity = self.quantity_input.get()
        notes = self.notes_input.get()
        wallet = self.text_box.get('1.0', 'end')

        if date == "" or symbol == "" or exchange_name == "":
            MessageBox.showinfo("Enter Txn data", "All fields are required.")
        else:
            con = mysql.connect(host="localhost", user="root", password="mysqlrootpw", database="crypto_tracker_db")
            mycursor = con.cursor()
            sql = "INSERT INTO accounts (last_updated, symbol, crypto_name, quantity, location, url, wallet_address, notes) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);"
            val = (date, symbol, crypto_name, price, exchange_name, quantity, wallet, notes)
            mycursor.execute(sql, val)
            # cursor.execute("insert into txns values('"+ str(1) + "', '" + date +"','" + symbol + "', '" + txn_type +"')")
            mycursor.execute("commit")

            MessageBox.showinfo("Record inserted into DB successfully", "Successful Insertion");
            con.close()

    def clear_entry(self):

        #        self.txn_date_input.delete("0", "end")
        self.symbol_input.delete("0", "end")
        self.crypto_name_input.delete("0", "end")
        self.clicked.set("")
        self.price_input.delete("0", "end")
        self.quantity_input.delete("0", "end")
        self.notes_input.delete("0", "end")
        self.text_box.delete("1.0", "end")

    def clear_text_input(self):
        self.text_box.delete("1.0", "end")

    def doit(self, *args):

        # https://stackoverflow.com/questions/6950007/pasting-in-the-tkinter-text-widget
        # get the clipboard data, and replace all newlines
        # with the literal string "\n"

        clipboard = self.clipboard_get()
        clipboard = clipboard.replace("\n", "\\n")

        # delete the selected text, if any
        try:
            start = self.text_box.index("sel.first")
            end = self.text_box.index("sel.last")
            self.text_box.delete(start, end)
        except TclError as e:
            # nothing was selected, so paste doesn't need
            # to delete anything
            pass

        # insert the modified clipboard contents
        self.text_box.insert("insert", clipboard)

if __name__ == "__main__":
    app = SampleApp()
    app.mainloop()
