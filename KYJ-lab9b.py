# Q1
from tkinter import *

window = Tk()

'''
canvas = Canvas(window, height=200, width=300)
canvas.pack()

button = Button(window, text="Test button", bg="brown")
button.pack()
'''
# Q3
canvas = Canvas(window, height=500, width=600)
canvas.pack()

'''
#Q4
frame = Frame(window, bg = "blue")
frame.place(relheight=0.8, relwidth=0.8, relx = 0.1, rely = 0.1)
'''

# Q5-1 change background color of frame
frame = Frame(window, bg="#80c1ff")
frame.place(relheight=0.8, relwidth=0.8, relx=0.1, rely=0.1)

'''
# Q2
button2 = Button(window, text = "Hello World", bg = "gray", fg = "red")
button2.pack()
'''

'''
# Q5-2 pass the button into frame and change text
button2 = Button(frame, text = "Test button", bg = "gray", fg = "red")
button2.pack()
'''

'''
# Q6
label = Label(frame, text = "Frame label", bg = "yellow")
label.pack()
'''


# Q7
'''
button2 = Button(frame, text="Test button", bg="gray", fg="red")
button2.pack(side="left")

label = Label(frame, text="Frame label", bg="yellow")
label.pack(side="right")
# If I place both on the left, both appears on left, but button comes first and label comes next to the button
'''

# Q8
'''
button2 = Button(frame, text="Test button", bg="gray", fg="red")
button2.grid(column=0,row=0)

label = Label(frame, text="Frame label", bg="yellow")
label.grid(column=1,row=0)
'''

# Q9
button2 = Button(frame, text="Test button", bg="gray", fg="red")
button2.place(relheight=0.2, relwidth=0.2)

'''
label = Label(frame, text="Frame label", bg="yellow")
label.place(relx=0.05/0.2, relheight = 0.2, relwidth = 0.5)
'''

# Q10
label = Label(frame, text="Frame label", bg="yellow")
label.place(relx=1-0.35, relheight = 0.2, relwidth = 0.35)

window.mainloop()
