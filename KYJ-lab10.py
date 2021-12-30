from tkinter import *
from PIL import ImageTk, Image

# 6
window = Tk()
window.geometry("600x500")

# 7
bg_image = ImageTk.PhotoImage(Image.open("city.jpg"))
# 8
bg_label = Label(window, image=bg_image)
bg_label.pack()

# 1
'''
frame = Frame(window, bg="#80c1ff")
frame.place(relwidth=0.75, relheight=0.1, relx = 0.5, rely=0.1, anchor=N)
'''

# 4
frame = Frame(window, bg="#80c1ff", border=5)
frame.place(relwidth=0.75, relheight=0.1, relx=0.5, rely=0.1, anchor=N)


'''
button2 = Button(frame, text="Test button", bg="gray", fg="red")
button2.place(relheight=0.2, relwidth=0.2)

'''

# 2
entry = Entry(frame, font=36)
entry.place(relwidth=0.65, relheight=1)

# 3
'''
button2 = Button(frame, text="Test button", font=36)
button2.place(relheight=1, relwidth=1-0.7, relx=0.7)
'''

# 5
lower_frame = Frame(window, bg="#80c1ff", border=5)
lower_frame.place(relx=0.5, rely=0.1+0.25, relwidth=0.75, relheight=0.6, anchor=N)


# 6
lower_label = Label(lower_frame)
lower_label.place(relwidth=1, relheight=1)


# 9
'''
def button_click():
    print("Button clicked")


button = Button(frame, text="Test button", font=36, command=button_click)
button.place(relheight=1, relwidth=1-0.7, relx=0.7)
'''

# 10
def button_click(text):
    text = str(entry.get())
    print("Text entered is", text)
    lower_label = Label(lower_frame, text=text)
    lower_label.place(relwidth=1, relheight=1)

button = Button(frame, text="Get Info", font=36, command=lambda:button_click(entry.get()))
button.place(relheight=1, relwidth=1-0.7, relx=0.7)


window.mainloop()


