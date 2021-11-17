from tkinter import *
import tkinter.messagebox as MessageBox
import mysql.connector as mysql


# def insert():
#     date = enter_date.get()
#
#     if date == "":
#         MessageBox.showinfo("Enter Date", "All fields are required.")
#     else:
#         con =



root = Tk()
root.geometry("600x300")
root.title("Python+Tkinter+MySql")

date = Label(root, text='Enter Date of Transaction', font=('bold', 10))

enter_date = Entry()
enter_date.place(x=150, y=60)

# insert = Button(root, text="insert", font=("italic", 10), bg="white", command=insert)
# insert.place(x=20, y=140)

root.mainloop()