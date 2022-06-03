from flask import Flask,render_template,request,redirect,session,url_for
import mysql.connector
import urllib.request
import os
from werkzeug.utils import secure_filename


db=mysql.connector.connect(
   host='localhost',
   user='root',
   password='',
   database='gadget_geek',
)

app=Flask(__name__)
 
app.secret_key = "secret key"

def getProduct():
    sql=f"SELECT * FROM `product`"
    cursor=db.cursor(dictionary=True)
    cursor.execute(sql)
    product_list:list=cursor.fetchall()
    cursor.close()
    return product_list

def getCart():
    sql=f"SELECT * FROM `cart`"
    cursor=db.cursor(dictionary=True)
    cursor.execute(sql)
    cart_list:list=cursor.fetchall()
    cursor.close()
    return cart_list

def getCategory():
    sql=f"SELECT * FROM `category`"
    cursor=db.cursor(dictionary=True)
    cursor.execute(sql)
    category_list:list=cursor.fetchall()
    cursor.close()
    return category_list

def getBrand():
    sql=f"SELECT * FROM `brands`"
    cursor=db.cursor(dictionary=True)
    cursor.execute(sql)
    brand_list:list=cursor.fetchall()
    cursor.close()
    return brand_list

def getCustomer():
    sql=f"SELECT * FROM `customer`"
    cursor=db.cursor(dictionary=True)
    cursor.execute(sql)
    cust_list:list=cursor.fetchall()
    cursor.close()
    return cust_list
    
@app.route("/registration")
def registration():
    return render_template("/registration.html")


@app.route("/register_new_account", methods=["POST"])
def register_new_account():
    cust_list = getCustomer()
    cust_idno = len(cust_list)+1
    fName:str = request.form['fName']
    lName:str = request.form['lName']
    email:str = request.form['email']
    phone:str = request.form['phone']
    psw:str = request.form['psw']
    psw_confirm:str = request.form['psw-confirm']
    if(psw != psw_confirm):
        return render_template("/registration.html",message="Your password doesn't match!")
    else:
        sql=f"INSERT INTO `customer`(`cust_idno`,`fname`,`lname`,`email`,`phone`,`password`) VALUES('{cust_idno}','{fName}','{lName}','{email}','{phone}','{psw}')"
        cursor=db.cursor(dictionary=True)
        cursor.execute(sql)
        db.commit()
        cursor.close()
        session['user'] = cust_idno
    return render_template("/home.html")
    
@app.route("/login")
def login():
    return render_template("/login.html")

@app.route("/account_login", methods=["POST"])
def account_login():
    phone_email:str = request.form['phone_email']
    psw:str = request.form['psw']
    
    cust_list = getCustomer()
    
    for customer in cust_list:
        if (phone_email == customer['email'] or phone_email == customer['phone']) and psw == customer['password']:
            session['user'] = customer['cust_idno']
            return redirect("/home")
    
    return render_template("/login.html",message="Looks like you don't have an account yet... Please SignUp!")

@app.route("/home")
def homepage():
    if 'user' in session:
        user = session["user"]
        category_list = getCategory()
        brand_list = getBrand()
        print(user)
        return render_template("/home.html", category_list = category_list, brand_list = brand_list)
    else:
        return redirect("/")

@app.route("/home/categoryview", methods=["POST"])
def category():
    if 'user' in session:
        user = session["user"]
        category_name:str = request.form['category']
        if category_name == "Home":
            category_list = getCategory()
            brand_list = getBrand()
            return render_template("/home.html", category_list = category_list, brand_list = brand_list)
        
        category_name = category_name.lower() 
        if category_name[len(category_name)-1:len(category_name)] == 's':
            category_name = category_name[0:len(category_name)-1]
        category = category_name
        category_list = getCategory()
        category_id:str
        for category in category_list:
            if category['category_name'] == category_name:
                category_id = category['category_id']

        product:list=[]
        product_list = getProduct()
        for prod in product_list:
            if prod['category_id'] == category_id:
                    product.append(prod)

        brand_list = getBrand()
        brandname_list:list=[]
        for brand in brand_list:
            if brand['category_id'] == category_id:
                brandname_list.append(brand['brand_name'])

        return render_template("/categoryview.html", category = category_name, category_id = category_id, brandname_list = brandname_list, product_list = product, image='image')
    else:
        return redirect("/login")

@app.route("/home/categoryview/brandview", methods=['POST'])
def brand():
    if 'user' in session:
        user = session["user"]
        brand_name:str = request.form['brand']
        category_name:str = request.form['category']
        brand_name = brand_name.lower()
        category_name = category_name.lower()

        category_id:str
        category_list = getCategory()
        for category in category_list:
            if category['category_name'] == category_name:
                category_id = category['category_id']

        brand_list = getBrand()
        brand_id:str
        for brand in brand_list:
            if brand['category_id'] == category_id and brand['brand_name'] == brand_name:
                 brand_id = brand['brand_id']

        product:list=[]
        product_list = getProduct()
        for prod in product_list:
            if prod['brand_id'] == brand_id:
                    product.append(prod)

        return render_template("/brandview.html", brand = brand_name, category = category_name, product_list = product)
    else:
        return redirect("/login")

@app.route("/product/productview", methods=['POST'])
def productview():
    if 'user' in session:
        user = session["user"]

        prod_id = request.form['prod_id']
        prod_name = request.form['prod_name']
        category_name:str = request.form['category']

        prod_id = int(prod_id)

        product:list=[]
        product_list = getProduct()
        for prod in product_list:
            if prod['prod_id'] == prod_id:
                    product.append(prod)
        return render_template("/productview.html", product = product, category = category_name, prod_name = prod_name)
    else:
        return redirect("/login")

@app.route("/add_to_cart", methods=['POST'])
def add_to_cart():
    if 'user' in session:
        user = session["user"]

        prod_id = request.form['prod_id']
        quantity = request.form['quantity']
        quantity = int(quantity)
        prod_id = int(prod_id)
        price:float
        product_list = getProduct()
        for prod in product_list:
            if prod['prod_id'] == prod_id:
                price = prod['price']

        item_total:float = float(price) * float(quantity)
        item_total = format(item_total, ".2f")

        sql=f"INSERT INTO `cart`(`cust_idno`,`prod_id`,`quantity`,`item_total`) VALUES('{user}','{prod_id}','{quantity}','{item_total}')"
        cursor=db.cursor(dictionary=True)
        cursor.execute(sql)
        db.commit()
        cursor.close()

        return redirect("/viewcart")

    else:
        return redirect("/login")

@app.route("/viewcart")
def viewcart():
    if 'user' in session:
        user = session["user"]

        product_list = getProduct()
        cart_list = getCart()
        subtotal:float=0.00
        customer_cart:list=[]
        for count, cart in enumerate(cart_list):
            if cart['cust_idno'] == user:
                customer_cart.append(cart)
                subtotal += cart['item_total']
                for product in product_list:
                    if cart['prod_id'] == product['prod_id']:
                        customer_cart[count]["image"] = product['image']
                        customer_cart[count]["prod_name"] = product['prod_name']

        subtotal = format(subtotal, ".2f")
        return render_template("/cart.html", customer_cart = customer_cart, subtotal = subtotal, count = count+1)
    else:
        return redirect("/login")

@app.route("/logout")
def logout():
    session.pop('user', None)
    return redirect("/")

@app.route("/")
def index():
    category_list = getCategory()
    return render_template("/index-home.html", category_list = category_list)
    
if __name__=="__main__":
    app.run(host="0.0.0.0",debug=True)