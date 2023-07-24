from flask import Flask, render_template, request, session, redirect,url_for
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime
import MySQLdb
import pymysql




with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    password = db.Column(db.String(120), nullable=False)

@app.route("/")
@app.route("/home")

def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    #[0: params['no_of_posts']]
    #posts = posts[]
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page= int(page)
    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    #Pagination Logic
    #First
    if (page==1):
        prev = "#"
        next = "/?page="+ str(page+1)
    elif(page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)



    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        # Fetch form data
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']

        # Create a new User instance
        user = User(name=name, email=email, password=password)

        # Add the User to the database
        db.session.add(user)
        db.session.commit()

        return render_template('login.html')

    return render_template('signup.html')


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)




@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/login",methods=['GET','POST'])
def login():

    if request.method == 'POST':

        name = request.form.get('uname')
        password = request.form.get('pass')

        # Database connect
        conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='codingthunder')
        cursor = conn.cursor()
        # Query execute
        cursor.execute('SELECT * FROM user WHERE  `name` = %s AND `password` = %s ',
                       ( name, password ))
        # Matched row in 'user'
        user = cursor.fetchone()
        # print(user)
        if user==None:
            return redirect(url_for('login'))
        # elif   user==params['admin_user']:
        #     return redirect('/dashboard')
        #     # return render_template('dashboard.html', params=params, posts = posts)
        else:
            # #modified
            # return redirect(url_for('home'))

            if user[2]=='team9@gmail.com':
                # return render_template("dashboard.html")
                return redirect(url_for('dashboard'))
            else:
                # return render_template("index.html")

                return redirect(url_for('home'))

    else:
        return render_template('login.html', params=params)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():

    # if ('user' in session and session['user'] == params['admin_user']):
    #     posts = Posts.query.all()
    #     return render_template('dashboard.html', params=params, posts = posts)
    #
    #
    if request.method=='POST':

        print("hellow")
    #
    #     if (username == params['admin_user'] and userpass == params['admin_password']):
    #         #set the session variable
    #         session['user'] = username
    #         posts = Posts.query.all()
    #         return render_template('dashboard.html', params=params, posts = posts)
    conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='codingthunder')
    cursor = conn.cursor()
    # Query execute
    cursor.execute('SELECT * FROM posts')
    # Matched row in 'user'
    user = cursor.fetchall()
    # print(user)

    return render_template('dashboard.html', user=user)



@app.route("/edit", methods = ['GET', 'POST'])
def edit():
    title = request.form.get('title')
    tline = request.form.get('tline')
    slug = request.form.get('slug')
    content = request.form.get('content')
    img_file = request.form.get('img_file')

    user = Posts.query.filter_by(slug=slug).first()

    if user:
        user.title = request.form.get('title')
        user.tagline = request.form.get('tline')
        user.slug = request.form.get('slug')
        user.content = request.form.get('content')
        user.img_file = request.form.get('img_file')
        db.session.commit()

    return render_template('edit.html')


@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename) ))
            return "Uploaded successfully"



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')





@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )
    return render_template('contact.html', params=params)

@app.route("/delete", methods = ['GET', 'POST'])
def delete():

    slug = request.form.get('slug')

    user = Posts.query.filter_by(slug=slug).first()
    print(user)
    if user:
        db.session.delete(user)
        db.session.commit()

    return render_template('delete.html')
@app.route("/add", methods = ['GET', 'POST'])
def add():
    if request.method == 'POST':

        title = request.form.get('title')
        tagline = request.form.get('tline')
        slug = request.form.get('slug')
        content = request.form.get('content')
        img_file=request.form.get('img_file')
        date=request.form.get('date')

        entry = Posts( title=title, tagline=tagline, slug=slug, content=content,img_file=img_file,date=date)
        db.session.add(entry)
        db.session.commit()


    return render_template('add.html')



app.run(debug=True)


