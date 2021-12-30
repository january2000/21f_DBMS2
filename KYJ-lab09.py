import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="yj0113",
    auth_plugin='mysql_native_password'
)

myCursor = mydb.cursor()
'''
myCursor.execute("CREATE DATABASE IF NOT EXISTS test")
myCursor.execute("SHOW DATABASES")
for db in myCursor:
    print(db)
'''
myCursor.execute("USE test;")

'''
myCursor.execute("CREATE TABLE IF NOT EXISTS drivers(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), age INT)")
sqlString = "INSERT INTO drivers (name, age) VALUES (%s, %s)"
driver1 = "Mika", 51
myCursor.execute(sqlString, driver1)
mydb.commit()
'''
'''
sqlString = "INSERT INTO drivers (name, age) VALUES (%s, %s)"
mydrivers = [("Kimi", 39), ("Valteri", 31), ("Heikki", 39), ("Michael", 51)]
myCursor.executemany(sqlString, mydrivers)
mydb.commit()
'''
'''
myCursor.execute("SELECT name FROM drivers WHERE name LIKE '%k%'")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''
'''
myCursor.execute("UPDATE drivers SET name = 'Valtterri' WHERE name = 'Valteri'")
myCursor.execute("UPDATE drivers SET age = 40 WHERE name = 'Kimi'")
mydb.commit()
'''
'''
myCursor.execute("Delete FROM drivers WHERE name LIKE 'M%'")
mydb.commit()
'''
'''
myCursor.execute("DROP TABLE IF EXISTS drivers")
mydb.commit()
'''
myCursor.execute("USE classicmodels")
'''
myCursor.execute("SELECT lastName FROM employees WHERE officeCode = 4")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''
'''
myCursor.execute("SELECT customerNumber, FORMAT(AVG(amount),2) AS averageAmount FROM payments GROUP BY customerNumber ORDER BY AVG(amount) DESC")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''
'''
myCursor.execute("SELECT quantityOrdered*priceEach FROM orderDetails GROUP BY orderNumber ORDER BY quantityOrdered*priceEach DESC LIMIT 5")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''
'''
myCursor.execute("SELECT productName, quantityInStock FROM products WHERE quantityInStock < 100 ORDER BY quantityInStock")
myResult = myCursor.fetchall()
for row in myResult:
    print(row)
'''








