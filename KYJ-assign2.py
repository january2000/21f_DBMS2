import mysql.connector
from tkinter import messagebox

def connect():
    global mydb
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="yj0113",
        auth_plugin='mysql_native_password',
        database="sakila"
    )
    return mydb


# Q1
from tkinter import *
from tkinter import ttk

window = Tk()
window.title("Sakila Rental System (SRS)")
window.geometry("600x600")

# Q2
top_frame = Frame(window, bg="white")
top_frame.place(relwidth=1, relheight=0.2)

# Q2.1
label = Label(top_frame, bg="white", text="Welcome to Sakila Rental System", font=("Arial", 20))
# Q6
label.pack(side=TOP)

# Q3
middle_frame = Frame(window, bg="azure")
middle_frame.place(relwidth=1, relheight=0.7, rely=0.2)

# Q4
bottom_frame = Frame(window, bg="white")
bottom_frame.place(relwidth=1, relheight=0.1, rely=0.9)

# Q9
def clear():
    for widget in middle_frame.winfo_children():
        widget.destroy()

# Q4.1
clear_button = Button(bottom_frame, bg="white", text="Clear", command=clear)
# Q6
clear_button.pack(side=RIGHT, ipadx=20, padx=20)

# Q7
def display1(event):
        clear()
        conn = connect()
        c = conn.cursor()
        query = c.execute("SELECT film_id AS FILM_ID, title AS TITLE, rental_rate AS RATE  FROM film LIMIT 15")
        result = c.fetchall()

        # Q8
        label2 = Label(middle_frame, text="View Rentals", font=("Arial", 14), bg="azure") # Q11
        label2.grid(row=0, column=2, columnspan=3)

        columns = c.column_names
        k = 2
        for cols in columns:
            res_label = Label(middle_frame, text=cols, bg="grey60")
            res_label.grid(row=1, column=k, padx=50)
            k = k+1

        i = 2
        for res in result:
            for j in range(len(res)):
                print(res[j])
                result_label = Label(middle_frame, text=res[j], bg="azure") # Q11
                result_label.grid(row=i, column=j+2, padx=50)
            i = i+2
        conn.close()

# Q10
def display2(event):
    clear()
    conn = connect()
    c = conn.cursor()
    query2 = '''SELECT c.customer_id AS CUSTOMER_ID, CONCAT(c.first_name, ",", c.last_name) AS CUSTOMER, 
                a.phone AS PHONE, r.rental_id AS RENTAL_ID, f.title AS TITLE FROM customer c, address a, 
                rental r, film f, inventory i WHERE a.address_id = c.address_id AND c.customer_id = r.customer_id AND 
                r.inventory_id = i.inventory_id AND i.film_id = f.film_id AND r.return_date IS NULL ORDER BY r.rental_id LIMIT 15 '''
    c.execute(query2)
    result2 = c.fetchall()

    label2 = Label(middle_frame, text="Overdue Customer Rentals", font=("Arial", 14), bg="azure") # Q11
    label2.grid(row=0, column=1, columnspan=3, padx=30)

    column2 = c.column_names
    k = 0
    for cols in column2:
        res_label2 = Label(middle_frame, text=cols, bg="grey60")
        res_label2.grid(row=1, column=k, padx=15)
        k = k + 1

    i = 2
    for res in result2:
        for j in range(len(res)):
            print(res[j])
            result_label2 = Label(middle_frame, text=res[j], bg="azure") # Q11
            result_label2.grid(row=i, column=j)
        i = i + 2
    conn.close()


# Q12
def new_window(event):
    new_window = Tk()
    new_window.title("Return Rental")
    new_window.geometry("600x500")

    top_frame2 = Frame(new_window, bg="white")
    top_frame2.place(relwidth=1, relheight=0.2)

    middle_frame2 = Frame(new_window, bg="azure")
    middle_frame2.place(relwidth=1, relheight=0.7, rely=0.2)

    bottom_frame2 = Frame(new_window, bg="white")
    bottom_frame2.place(relwidth=1, relheight=0.1, rely=0.9)

    # Q13
    new_label = Label(top_frame2, bg="white", text="Enter customer name")
    new_label.pack(side=TOP)

    name_entry = Entry(top_frame2, relief="solid", selectbackground="azure")
    name_entry.pack(side=TOP)

    # Q14
    def c_name(event):
        conn = connect()
        c = conn.cursor()
        query3 = "SELECT r.rental_id AS RENTAL_ID, c.customer_id AS CUSTOMER_ID, r.rental_date AS RENTAL_DATE FROM rental r, customer c WHERE c.customer_id = r.customer_id AND r.return_date IS NULL AND c.first_name LIKE '%"+name_entry.get()+"%' OR c.last_name LIKE '%"+name_entry.get()+"%' LIMIT 15"
        c.execute(query3)
        result3 = c.fetchall()

        # Q14.1
        if len(result3)==0:
            non_label = Label(middle_frame2, text="User '" + name_entry.get() + "' does not have any overdue rentals", bg="azure")
            non_label.place(relx=0.5, rely = 0.5, anchor=CENTER)

        # Q14.2
        else:
            label3 = Label(middle_frame2, text="CustomerRentals", font=("Arial", 14), bg="azure")
            label3.grid(row=0, column=1, columnspan=2)

            column3 = c.column_names
            k = 0
            for cols in column3:
                res_label3 = Label(middle_frame2, text=cols, bg="grey60")
                res_label3.grid(row=1, column=k, padx=30)
                k = k + 1
            update_label = Label(middle_frame2, text="UPDATE", bg="grey60")
            update_label.grid(row=1, column=k, padx=30)

            i = 2
            for res in result3:
                for j in range(len(res)):
                    print(res[j])
                    result_label3 = Label(middle_frame2, text=res[j], bg="azure")
                    result_label3.grid(row=i, column=j)
                returns_button = Button(middle_frame2, text="Return", bg="white")
                returns_button.grid(row=i, column=j + 1, ipadx=30)
                i = i + 2
            conn.close()

            # Q17-19
            def return_date(event):
                conn = connect()
                c = conn.cursor()
                c.execute("UPDATE rental SET return_date = NOW() WHERE rental_id = " + str(result3[0][0]) + ";")

                messagebox.showinfo("", "THe rental has been returned!")
                conn.commit()

            returns_button.bind('<Button-1>', return_date)

    name_entry.bind('<Return>', c_name)

    # Q15
    def clear2():
        for widgets in middle_frame2.winfo_children():
            widgets.destroy()
        name_entry.delete(0,END)

    # Q13
    clear_button2 = Button(bottom_frame2, bg="white", text="Clear", command=clear2)  # 여기 command 채우기
    clear_button2.pack(side=RIGHT, ipadx=20, padx=20)

# Q2.2
button_name = ["View Rentals", "Overdue Rentals", "Return Rentals"]
btn = []
for i in range(3):
    number = i
    btn.append(Button(top_frame, text=button_name[i], bg="white"))
    # Q6
    btn[i].place(relx=0.3+0.2*i, rely=0.5, anchor=CENTER, width=120)

# Q7
btn[0].bind("<ButtonPress-1>", display1)
# Q10
btn[1].bind("<ButtonPress-1>", display2)
# Q12
btn[2].bind("<ButtonPress-1>", new_window)


window.mainloop()