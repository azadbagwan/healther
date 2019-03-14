import json
from _mysql import connection
from functools import wraps
from urllib import request

from flask import Flask, render_template, flash, redirect, url_for, session, logging, request, jsonify, make_response
from jinja2.asyncsupport import render_async
from flask_cors import CORS
from datetime import datetime
from passlib.handlers import mysql
from passlib.handlers.sha2_crypt import sha256_crypt
import datetime
from json import dumps
# from data import Articles
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, IntegerField, PasswordField, validators, TextField
#from flask_sqlalchemy import SQLAlchemy
#from OpenSSL import SSL

NAMES = ["abc","abcd","abcde","abcdef","azad", "arshad"]


app = Flask(__name__)
cors= CORS(app)
#app.config['SQLALCHEMY_DATABSE_URI']= 'mysql://root:toor@localhost/myflaskapp'
# config mysql
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD']= 'toor'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# init MYSQL
mysql =MySQL(app)

# Articles= Articles()


# home
@app.route("/")
def index():
    return render_template('home.html')

# check if user is logged in
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)

        else:
            #flash("Unathorized, Please login", "danger")
            return redirect(url_for('login'))
    return wrap

# about
@app.route("/about")
def about():
    return render_template('about.html')


@app.route("/sidebar")
def sidebar():
    return render_template('sidebar.html')



# jstest
@app.route("/jstest")
def jstest():
    return render_template('jstest.html')


class SearchpatientsForm(Form):
    name_of_patient = StringField('Name of the Patient', id='tags1')
    autocomp = TextField('autocomp', id='autocomplete1')


# all articles
@app.route("/articles", methods=['GET', 'POST'])
@is_logged_in
def articles():
    form = SearchpatientsForm(request.form)
    # create cursor
    cur = mysql.connection.cursor()
    id2 = session['id']
    # Get articles
    result = cur.execute("SELECT * FROM patients WHERE doctors_user_id=%s", [id2])

    patients = cur.fetchall()


    if request.method == 'POST':

        searchraw = form.name_of_patient.data
        print("check "+ searchraw)
        setsearch = searchraw
        form.name_of_patient.data = setsearch
        searchstring = "%%" + searchraw + "%%"
        # create cursor
        cur = mysql.connection.cursor()
        # Get doctors
        result1 = cur.execute("SELECT * FROM patients WHERE patient_name LIKE %s AND doctors_user_id=%s", [searchstring, id2])

        patients = cur.fetchall()

        if result1 > 0:
            msg = 'articles found'
            return render_template('articles.html', patients=patients, form=form)
        else:
            msg = 'no articles found'
            return render_template('home.html', msg=msg)

        # close connection
        cur.close()
    else:
        if result > 0:
            return render_template('articles.html', patients=patients, form=form)
        else:
            msg = 'no articles found'
        return render_template('home.html', msg=msg)

    return render_template('articles.html', patients=patients, form=form)


    # close connection
    cur.close()


# single article
@app.route("/article/<string:id>/")
@is_logged_in
def article(id):
    # create cursor
    cur = mysql.connection.cursor()
    id2= session['id']
    session['pid']=[id]
    # Get articles
    query = "SELECT * FROM patients WHERE patient_id=%s AND doctors_user_id=%s"
    param = ([id], [id2])
    result = cur.execute(query, param)

    article = cur.fetchone()
    resultsum = cur.execute(
        "SELECT SUM(total_for_visit) FROM patient_visits WHERE visit_patient_id= %s", [id])
    tot = cur.fetchone()
    totamount=[]
    for key, value in tot.items():
        print(value)
        totamount=value

    resultpaidsum = cur.execute(
        "SELECT SUM(paid_for_visit) FROM patient_visits WHERE visit_patient_id= %s", [id])
    paid = cur.fetchone()
    dueamount = []
    for key, value in paid.items():
        print(value)
        paidamount = value

    resultduesum = cur.execute(
        "SELECT SUM(due_for_visit) FROM patient_visits WHERE visit_patient_id= %s", [id])
    due = cur.fetchone()
    dueamount = []
    for key, value in due.items():
        print(value)
        dueamount = value

    # test of list
    #query2 = "SELECT * FROM patient_visits where visit_patient_id=%s"
    #param2= ("2")
    result1 = cur.execute("SELECT * FROM patient_visits where visit_patient_id=%s ORDER BY visit_create_date desc", [id])

    articles = cur.fetchall()
    return render_template('article.html', article=article, articles=articles, totamount=totamount, paidamount=paidamount , dueamount=dueamount)


# visit issues
@app.route("/visit_details/<string:id>/")
@is_logged_in
def visit_details(id):
    session['vid']= [id]
    patientid= session['pid']
    # create cursor
    cur = mysql.connection.cursor()

    # Get articles
    result = cur.execute("SELECT * FROM patient_visits WHERE visit_id=%s", [id])

    visit = cur.fetchone()

    # create cursor
    id = session['vid']
    # Get articles

    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM visits_prescription where visitid=%s", id)
    # result = cur.execute("SELECT * FROM visits_prescription")
    prescriptions = cur.fetchall()
    cur.close()
    #cur2.close()

    return render_template('visit_details.html', visit=visit, prescriptions=prescriptions)


# all doctors
@app.route("/doctors")
#@is_logged_in
def doctors():
    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    result = cur.execute("SELECT * FROM users")

    doctors = cur.fetchall()

    if result > 0:
        return render_template('doctors.html', doctors=doctors)
    else:
        msg = 'no articles found'
        return render_template('doctors.html', msg=msg)

    # close connection
    cur.close()


# single doctor
@app.route("/doctor/<string:id>/")
@is_logged_in
def doctor(id):
    # create cursor
    cur = mysql.connection.cursor()

    # Get articles
    result = cur.execute("SELECT * FROM users WHERE id=%s", [id])

    doctor = cur.fetchone()
    return render_template('doctor.html', doctor=doctor)


class RegisterForm(Form):
    name= StringField('Name', [validators.Length(min=1, max=50)])
    username= StringField('Username', [validators.Length(min=4, max=25)])
    email= StringField('Email',[validators.Length(min=6, max=50)])
    mobile = IntegerField('Mobile')
    speciality = StringField('Name', [validators.Length(min=1, max=50)])
    password= PasswordField('Password', [
        validators.data_required(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    confirm= PasswordField('Confirm Password')


# register user
@app.route('/register', methods=['GET', 'POST'])
def register():
    form= RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        mobile = form.mobile.data
        speciality = form.speciality.data
        username = form.username.data
        password = sha256_crypt.encrypt(str(form.password.data))

        # create cursor
        cur= mysql.connection.cursor()

        cur.execute("INSERT INTO users(name, email, speciality, username, password, phone_num) values(%s, %s, %s, %s, %s, %s)", (name, email, speciality, username, password, mobile))

        # commit to db
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('you are now registered and can log in', 'success')

        return redirect(url_for('index'))

# continue from here
    return render_template('register.html', form=form)


# Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # get form fields
        username = request.form['username']
        password_candidate = request.form['password']

        # create cursor
        cur = mysql.connection.cursor()

        # get user by username
        result = cur.execute("SELECT * FROM users WHERE username= %s", [username])

        if result > 0:
            # get stored  hash
            data= cur.fetchone()
            password = data['password']

            # compare passwords
            if sha256_crypt.verify(password_candidate, password):
                # passed
                session['logged_in'] = True
                session['username'] = username

                # Get articles
                query_string = "SELECT * FROM users WHERE username=%s"
                cur1 = mysql.connection.cursor()
                result = cur1.execute(query_string, (username,))

                idofdoctor = cur1.fetchone()
                session['id'] = idofdoctor['id']
                cur1.close()

                app.logger.info('PASSWORD MATCHED')
                flash('you are now logged in', 'success')
                return redirect(url_for('dashboard', ))
            else:
                error= 'Invalid login, wrong password'
                app.logger.info('PASSWORD NOT MATCHED')
                # flash('password not matched', 'success')
                return render_template('login.html', error=error)
            # close connection to mysql
            cur.close()
        else:
            error = 'Invalid login, No such user'
            app.logger.info('NO USER')
            flash('no user', 'success')
            return render_template('login.html', error=error)

    return render_template('login.html')


# Loginjs
@app.route('/login_js', methods=['GET', 'POST'])
def login_js():
    if request.method == 'POST':
        # get form fields
        username = request.form['username']
        password_candidate = request.form['password']

        # create cursor
        cur = mysql.connection.cursor()

        # get user by username
        result = cur.execute("SELECT * FROM users WHERE username= %s", [username])

        if result > 0:
            # get stored  hash
            data= cur.fetchone()
            password = data['password']

            # compare passwords
            if sha256_crypt.verify(password_candidate, password):
                # passed
                session['logged_in'] = True
                session['username'] = username

                # Get articles
                query_string = "SELECT * FROM users WHERE username=%s"
                cur1 = mysql.connection.cursor()
                result = cur1.execute(query_string, (username,))

                idofdoctor = cur1.fetchone()
                session['id'] = idofdoctor['id']
                cur1.close()

                app.logger.info('PASSWORD MATCHED')
                flash('you are now logged in', 'success')
                return jsonify({'success': 'Logged in!'})
            else:
                error= 'Invalid login, wrong password'
                app.logger.info('PASSWORD NOT MATCHED')
                # flash('password not matched', 'success')
                return jsonify({'Failed': 'login failed, try again!'})
                return render_template('login.html', error=error)
            # close connection to mysql
            cur.close()
        else:
            error = 'Invalid login, No such user'
            app.logger.info('NO USER')
            flash('no user', 'success')
            return render_template('login.html', error=error)

    return render_template('login.html')

@app.route('/login_jwt')
def login_jwt():
    return ''

# logout
@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('you are now logged out', 'success')
    return redirect(url_for('login'))


# Dashboard
@app.route('/dashboard', methods=['GET', 'POST'])
@is_logged_in
def dashboard():
    # create cursor

    username = session['id']
    # Get articles
    query_string= "SELECT * FROM patients WHERE doctors_user_id=%s"
    cur = mysql.connection.cursor()
    result= cur.execute(query_string, (username,))

    articles= cur.fetchall()

    if result>0:
        return render_template('dashboard.html', articles= articles)
    else:
        msg= 'no articles found'
        return render_template('dashboard.html', msg=msg)

    # close connection
    cur.close()


class ArticleForm(Form):
    title = StringField('Title', [validators.Length(min=1, max=200)])
    body = TextAreaField('Body', [validators.Length(min=30)])



# add article
@app.route('/add_article', methods=['GET', 'POST'])
@is_logged_in
def add_article():
    form= ArticleForm(request.form)
    if request.method == 'POST' and form.validate():
        title= form.title.data
        body= form.body.data

        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("INSERT INTO articles(title, body, author) VALUES(%s, %s, %s)", (title, body, session['username']))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('Article created', 'success')

        return redirect(url_for('dashboard'))

    return render_template('add_article.html', form=form)


class PatientForm(Form):
    name_of_patient = StringField('Name of the patient', [validators.Length(min=1, max=200)])
    age = IntegerField('Age', [validators.NumberRange(min=1, max=200)])
    birth_date = StringField('Birth date')
    email = StringField('Email', [validators.Length(min=1, max=200)])
    phone_number = StringField('Phone number', [validators.Length(min=1, max=200)])
    known_history = TextAreaField('Known history', [validators.Length(min=1, max=200)])
@app.route('/add_patient', methods=['GET', 'POST'])
@is_logged_in
def add_patien():
    return render_template('add_patient.html')

# add patient
@app.route('/add_patient_j', methods=['GET', 'POST'])
@is_logged_in
def add_patient_j():
    name_of_patient = request.form['name_of_patient']
    age_of_patient = request.form['age_of_patient']
    birth_date_of_patient = request.form['birth_date_of_patient']
    email_of_patient = request.form['email_of_patient']
    phone_number_of_patient = request.form['phone_number_of_patient']
    known_history_of_patient = request.form['known_history_of_patient']

    print(name_of_patient, age_of_patient, birth_date_of_patient, email_of_patient, phone_number_of_patient, known_history_of_patient)
    if name_of_patient:


        username = session['username']
        doctors_id = session['id']

        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("INSERT INTO patients(patient_name, patient_age, patient_birthdate, patient_email, patient_phonenumber, patients_known_history, doctors_user_id) VALUES(%s, %s, %s, %s, %s, %s, %s)", (name_of_patient, age_of_patient, birth_date_of_patient, email_of_patient, phone_number_of_patient, known_history_of_patient, doctors_id))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('Patient created', 'success')

        return jsonify({'success': 'Patient Added!'})

    return jsonify({'error': 'missing data!'})


# edit Patient
@app.route('/edit_patient/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def edit_patient(id):
    # create cursor
    cur = mysql.connection.cursor()

    # get the patient by id
    result = cur.execute("SELECT * FROM patients WHERE patient_id= %s", [id])
    article = cur.fetchone()

    # get form
    form = PatientForm(request.form)

    # populate article form field
    form.name_of_patient.data = article['patient_name']
    form.age.data = article['patient_age']
    form.birth_date.data=article['patient_birthdate']
    form.email.data = article['patient_email']
    form.phone_number.data = article['patient_phonenumber']
    form.known_history.data= article['patients_known_history']

    if request.method == 'POST' and form.validate():
        name = request.form['name_of_patient']
        age = request.form['age']
        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("UPDATE patients SET patient_name= %s, patient_age= %s WHERE patient_id= %s", (name, age, id))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('Patient updated', 'success')

        return redirect(url_for('dashboard'))

    return render_template('edit_patient.html', form=form)


# delete patient
@app.route('/delete_patient/<string:id>', methods=['POST'])
@is_logged_in
def delete_patient(id):
    # create cursor
    cur= mysql.connection.cursor()

    # execute
    cur.execute("DELETE FROM patients WHERE patient_id=%s", [id])

    # commit to db
    mysql.connection.commit()

    # close connection
    cur.close()

    flash('PATIENT DELETED', 'success')

    return redirect(url_for('dashboard'))


class VisitForm(Form):
    reason_for_visit = StringField('Reason for visit', [validators.Length(min=1, max=200)])
    diagnosis = StringField('Diagnosis', [validators.Length(min=1, max=200)])
    comments = TextAreaField('comments', [validators.Length(min=1, max=200)])
    systolic_bloodpressure = IntegerField('Diagnosis')
    diastolic_bloodpressure = IntegerField('Diagnosis')
    total_amount = IntegerField('Total amount')
    paid_amount = IntegerField('Total amount')
    temperature = IntegerField('Temperature')
    sugar = IntegerField('Sugar')

# add visit
@app.route('/add_visit', methods=['GET', 'POST'])
@is_logged_in
def add_visit():
    form = VisitForm(request.form)
    if request.method == 'POST' and form.validate():

        reason_for_visit= form.reason_for_visit.data
        diagnosis= form.diagnosis.data
        comments = form.comments.data
        systolic_bp = str(form.systolic_bloodpressure.data)
        diastolic_bp = str(form.diastolic_bloodpressure.data)
        total_amount= str(form.total_amount.data)
        paid_amount = str(form.paid_amount.data)
        remaining_amount_int = form.total_amount.data - form.paid_amount.data
        due_amount= str(remaining_amount_int)
        temperature = form.temperature.data
        sugar = form.sugar.data


        pid = session['pid']
        y = ''.join(pid)
        username = session['username']
        doctors_id = session['id']

        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("INSERT INTO patient_visits(visit_issue, visit_diagnosis, comments, visit_patient_id, systolic_bloodpressure, diastolic_bloodpressure, total_for_visit, paid_for_visit, due_for_visit, temperature, sugar) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (reason_for_visit, diagnosis,comments, pid, systolic_bp, diastolic_bp, total_amount, paid_amount, due_amount, temperature, sugar))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('visit created', 'success')

        return redirect(url_for('article', id=int(y)))

    return render_template('add_visit.html', form=form)


@app.route('/add_visit_jsont', methods=['POST'])
@is_logged_in
def add_visit_jsont():
    reason_for_visit = request.form['reason_for_visit']
    diagnosis = request.form['diagnosis']
    systolic_bp = request.form['systolic_bloodpressure']
    diastolic_bp = request.form['diastolic_bloodpressure']
    total_amount = request.form['total_amount']
    paid_amount =  request.form['paid_amount']
    comments = request.form['comments']
    remaining_amount_int = int(total_amount) - int(paid_amount)
    due_amount = remaining_amount_int
    temperature = request.form['temperature']
    sugar = request.form['sugar']
    print(reason_for_visit, comments, diagnosis, systolic_bp, diastolic_bp, total_amount,paid_amount, temperature,sugar)
    if reason_for_visit:
        pid = session['pid']
        y = ''.join(pid)
        username = session['username']
        doctors_id = session['id']

        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("INSERT INTO patient_visits(visit_issue, visit_diagnosis, comments, visit_patient_id, systolic_bloodpressure, diastolic_bloodpressure, total_for_visit, paid_for_visit, due_for_visit, temperature, sugar) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (reason_for_visit, diagnosis,comments, pid, systolic_bp, diastolic_bp, total_amount, paid_amount, due_amount, temperature, sugar))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('visit created', 'success')

        return jsonify({'success': 'Visit Added!'})

    return jsonify({'error': 'missing data!'})


# edit visit details
@app.route('/edit_visit_details/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def edit_visit_details(id):
    # create cursor
    cur = mysql.connection.cursor()

    # get the patient by id
    result = cur.execute("SELECT * FROM patient_visits WHERE visit_id= %s", [id])
    article = cur.fetchone()

    # get form
    form = VisitForm(request.form)

    # populate article form field
    form.diagnosis.data = article['visit_diagnosis']
    form.comments.data = article['comments']
    form.reason_for_visit.data= article['visit_issue']
    cur.close()
    if request.method == 'POST' and form.validate():
        diagnosise = request.form['diagnosis']
        commentse = request.form['comments']
        issuese = request.form['reason_for_visit']
        #diagnosise = "edited2"
        #commentse = "edited2"
        # create cursor
        cur2 = mysql.connection.cursor()
        # execute
        cur2.execute("UPDATE patient_visits SET visit_diagnosis= %s, comments= %s WHERE visit_id= %s", (diagnosise, commentse, id))
        # commit
        mysql.connection.commit()

        # close connection
        cur2.close()

        flash('Patient updated', 'success')
        cur2.close()
        return redirect(url_for('articles'))
        #return render_template('edit_visit_details.html', form=form, id=id)
    return render_template('edit_visit_details.html', form=form)
# edit article
@app.route('/edit_article/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def edit_article(id):
    # create cursor
    cur = mysql.connection.cursor()

    # get the article by id
    result = cur.execute("SELECT * FROM articles WHERE id= %s", [id])
    article = cur.fetchone()

    # get form
    form = ArticleForm(request.form)

    # populate article form field
    form.title.data = article['title']
    form.body.data = article['body']

    if request.method == 'POST' and form.validate():
        title= request.form['title']
        body= request.form['body']

        # create cursor
        cur= mysql.connection.cursor()
        # execute
        cur.execute("UPDATE articles SET title= %s, body=%s WHERE id= %s", (title, body, id))
        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('Article updated', 'success')

        return redirect(url_for('dashboard'))

    return render_template('edit_article.html', form=form)


# delete article
@app.route('/delete_article/<string:id>', methods=['POST'])
@is_logged_in
def delete_article(id):
    # create cursor
    cur= mysql.connection.cursor()

    # execute
    cur.execute("DELETE FROM articles WHERE id=%s", [id])

    # commit to db
    mysql.connection.commit()

    # close connection
    cur.close()

    flash('Article DELETED', 'success')

    return redirect(url_for('dashboard'))


class MedicineForm(Form):
    name_of_medicine = StringField('Name of the medicine', [validators.Length(min=1, max=200)])
    name_of_manufacturer = StringField('Name of the manufacturer', [validators.Length(min=1, max=200)], default= "Cipla Ltd.")
    treatment_of = StringField('For treatment of', [validators.Length(min=1, max=200)])
    composition_of_medicine = StringField('Composition of the medicine', [validators.Length(min=1, max=200)])


@app.route('/add_medicine', methods=['GET', 'POST'])
@is_logged_in
def add_medicine():
    return render_template('add_medicine.html')


@app.route('/add_medicine_j', methods=['POST'])
@is_logged_in
def add_medicine_j():
    name_of_medicine = request.form['name_of_medicine']
    name_of_manufacturer = request.form['name_of_manufacturer']
    for_treatment_of = request.form['for_treatment_of']
    composition_of_medicine = request.form['composition_of_medicine']

    print(name_of_medicine, name_of_manufacturer, for_treatment_of, composition_of_medicine)
    if name_of_medicine:
        #pid = session['pid']
        #y = ''.join(pid)
        username = session['username']
        doctors_id = session['id']

        # create cursor
        cur = mysql.connection.cursor()
        # execute
        cur.execute(
            "INSERT INTO medicines(medicine_name, manufacturers_name, treatment_of, composition) VALUES(%s, %s, %s, %s)",
            (name_of_medicine, name_of_manufacturer, for_treatment_of, composition_of_medicine))

        # commit
        mysql.connection.commit()

        # close connection
        cur.close()

        flash('medicine created', 'success')

        return jsonify({'success': 'medicine Added!'})

    return jsonify({'error': 'missing data!'})


class SearchmedicineForm(Form):
    name_of_medicine = StringField('Name of the medicine', id='tags1')
    autocomp = TextField('autocomp', id='autocomplete1')



# all medicines
@app.route('/medicines_list', methods=['GET', 'POST'])
@is_logged_in
def medicines_list():
    #print("test")
    form = SearchmedicineForm(request.form)

    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    result = cur.execute("SELECT * FROM medicines")

    medicines = cur.fetchall()

    # close connection
    cur.close()
    if request.method == 'POST':

        searchraw = form.name_of_medicine.data
        print("check "+ searchraw)
        setsearch = searchraw
        form.name_of_medicine.data = setsearch
        searchstring = "%%" + searchraw + "%%"
        # create cursor
        cur = mysql.connection.cursor()
        # Get doctors
        result1 = cur.execute("SELECT * FROM medicines WHERE medicine_name LIKE %s", [searchstring])

        medicines = cur.fetchall()

        if result1 > 0:
            msg = 'articles found'
            return render_template('medicines_list.html', medicines=medicines, form=form)
        else:
            msg = 'no articles found'
            return render_template('home.html', msg=msg)

        # close connection
        cur.close()
    else:
        if result > 0:
            return render_template('medicines_list.html', medicines=medicines, form=form)
        else:
            msg = 'no articles found'
        return render_template('home.html', msg=msg)
    return render_template('medicines_list.html', medicines=medicines, form=form)


# all medicines
@app.route('/medicines_search', methods=['GET', 'POST'])
@is_logged_in
def medicines_search():
    form = SearchmedicineForm(request.form)
    searchraw= form.name_of_medicine.data
    print(searchraw)
    setsearch= searchraw
    form.name_of_medicine.data = setsearch
    searchstring= "%%" + "azee" + "%%"
    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    result = cur.execute("SELECT * FROM medicines WHERE medicine_name LIKE %s", [searchstring])

    medicines = cur.fetchall()

    if result > 0:

        return render_template('medicines_list.html', medicines=medicines, form=form)
    else:
        msg = 'no articles found'
        return render_template('home.html', msg=msg)

    # close connection
    cur.close()


class PrescriptionForm(Form):
    medicine_name = StringField('Medixine name', [validators.Length(min=1, max=200)], id='medname')
    dose = StringField('Dose', [validators.Length(min=1, max=200)], id='dose')
    for_days = StringField('For days', [validators.Length(min=1, max=200)], id='for_days')
    comments = TextAreaField('Comments', [validators.Length(min=1)])



# add article
@app.route('/add_prescription', methods=['GET', 'POST'])
@is_logged_in
def add_prescription():
    form = PrescriptionForm(request.form)
    # create cursor
    id = session['vid']
    # Get articles

    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM visits_prescription where visitid=%s", id)
    #result = cur.execute("SELECT * FROM visits_prescription")
    presc = cur.fetchall()
    cur.close()
    if request.method == 'POST' and form.validate():

        medicine_name = form.medicine_name.data
        dose = form.dose.data
        for_days= form.for_days.data
        comments = form.comments.data


        # create cursor
        cur1= mysql.connection.cursor()
        # execute
        cur1.execute("INSERT INTO visits_prescription(visitid, medicine_name, dose, for_days, comments) VALUES(%s,%s,%s,%s, %s)", (id, medicine_name, dose, for_days, comments))
        # commit
        mysql.connection.commit()

        # close connection
        cur1.close()

        flash('Article created', 'success')

        return redirect(url_for('add_prescription'))

    return render_template('add_prescription.html', form=form, presc=presc)



@app.route('/autocomplete', methods=['GET'])
#@is_logged_in
def autocomplete():
    y = jsonify(NAMES)
    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    cur.execute("SELECT * FROM medicines")
    r = [dict((cur.description[idx][0], value)
               for idx, value in enumerate(row)) for row in cur.fetchall()]

    result = cur.execute("SELECT medicine_name FROM medicines")
    medicinesj = cur.fetchall()
    #print(medicinesj)
    medicinename= medicinesj
    medj=jsonify({'mycollection': medicinesj})

    # close connection
    cur.close()
    #print(y)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(medicinesj)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)

@app.route('/allmedj', methods=['GET'])
#@is_logged_in
def allmedj():
    y = jsonify(NAMES)
    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    cur.execute("SELECT * FROM medicines")
    r = [dict((cur.description[idx][0], value)
               for idx, value in enumerate(row)) for row in cur.fetchall()]

    result = cur.execute("SELECT * FROM medicines")
    medicinesj = cur.fetchall()
    #print(medicinesj)
    medicinename= medicinesj
    medj=jsonify({'mycollection': medicinesj})

    # close connection
    cur.close()
    #print(y)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(medicinesj)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)

@app.route('/bloodpressure', methods=['GET'])
@is_logged_in
def bloodpressure():
    y = jsonify(NAMES)
    patient_idbp= session['pid']
    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    cur.execute("SELECT * FROM medicines")
    r = [dict((cur.description[idx][0], value)
               for idx, value in enumerate(row)) for row in cur.fetchall()]

    result = cur.execute("SELECT systolic_bloodpressure, diastolic_bloodpressure FROM patient_visits WHERE visit_patient_id = %s", [patient_idbp])
    bloodp = cur.fetchall()
    #print(medicinesj)
    #medicinename= medicinesj
    medj=jsonify({'mycollection': bloodp})

    # close connection
    cur.close()
    data = [tuple(str(y) for y in tup) for tup in bloodp]
    double_dict1 = tuple(map( str , bloodp ) )
    #double_dict2 = {k: str(v) for (k, v) in double_dict1[0].items()}
    print(bloodp)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(json_list=bloodp)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)


@app.route('/temperature', methods=['GET'])
@is_logged_in
def temperature():
    y = jsonify(NAMES)
    patient_idtemp= session['pid']
    # create cursor
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT temperature FROM patient_visits WHERE visit_patient_id = %s", [patient_idtemp])
    tempg = cur.fetchall()
    #print(medicinesj)
    #medicinename= medicinesj


    # close connection
    cur.close()
    data = [tuple(str(y) for y in tup) for tup in tempg]
    double_dict1 = tuple(map( str , tempg ) )
    #double_dict2 = {k: str(v) for (k, v) in double_dict1[0].items()}
    #print(bloodp)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(json_list=tempg)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)


@app.route('/sugar', methods=['GET'])
@is_logged_in
def sugar():
    y = jsonify(NAMES)
    patient_idsug= session['pid']
    # create cursor
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT sugar FROM patient_visits WHERE visit_patient_id = %s", [patient_idsug])
    sug = cur.fetchall()
    #print(medicinesj)
    #medicinename= medicinesj


    # close connection
    cur.close()
    data = [tuple(str(y) for y in tup) for tup in sug]
    double_dict1 = tuple(map( str , sug ) )
    #double_dict2 = {k: str(v) for (k, v) in double_dict1[0].items()}
    print(sug)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(json_list=sug)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)


@app.route('/income', methods=['GET'])
@is_logged_in
def income():
    y = jsonify(NAMES)
    #patient_idtemp= session['pid']
    dovtorsid= session['id']
    # create cursor
    cur = mysql.connection.cursor()
    resultsum = cur.execute(
        "SELECT total_for_visit FROM patient_visits")
    tot = cur.fetchall()


    #print(medicinesj)
    #medicinename= medicinesj


    # close connection
    cur.close()
    data = [tuple(str(y) for y in tup) for tup in tot]
    double_dict1 = tuple(map( str , tot ) )
    #double_dict2 = {k: str(v) for (k, v) in double_dict1[0].items()}
    #print(bloodp)
    search = request.args.get('term')
    app.logger.debug(search)
    return jsonify(json_list=tot)
    #return jsonify({'mycollection': medicinesj})
    #return print(medicinesj)


class AppointmentForm(Form):
    doctors_name = StringField('Doctors name', [validators.Length(min=1, max=200)], id='medname')
    patients_name= StringField('Patient name', [validators.Length(min=1, max=200)], id='dose')
    start_time = StringField('Start time', [validators.Length(min=1, max=200)], id='for_days')
    end_time = StringField('End time', [validators.Length(min=1, max=200)], id='for_days')
    comments = TextAreaField('Comments', [validators.Length(min=1)])

# book appointment
@app.route('/book_appointment', methods=['GET', 'POST'])
@is_logged_in
def book_appointment():
    form = AppointmentForm(request.form)
    #form = SearchmedicineForm(request.form)

    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    result = cur.execute("SELECT * FROM appointments")

    appointment = cur.fetchall()

    # close connection
    cur.close()
    if request.method == 'POST' and form.validate():
        doctors_name = form.doctors_name.data
        patient_name = form.patients_name.data
        start_time = form.start_time.data
        end_time = form.end_time.data
        comments= form.comments.data
        idofpatient='7'

        # create cursor
        cur1 = mysql.connection.cursor()
        # execute
        cur1.execute("INSERT INTO appointments(appointments_patients_id, doctor_name, patient_name, start_time, end_time, comments) VALUES(%s,%s,%s,%s, %s, %s)", (idofpatient, doctors_name, patient_name, start_time, end_time, comments))
        # commit
        mysql.connection.commit()

        # close connection
        cur1.close()

        flash('Article created', 'success')

        return redirect(url_for('book_appointment'))

    return render_template("book_appointment.html", form=form, appointment=appointment)


# all medicines
@app.route('/medicines_listjson', methods=['GET', 'POST'])
@is_logged_in
def medicines_listjson():
    #print("test")
    form = SearchmedicineForm(request.form)

    # create cursor
    cur = mysql.connection.cursor()

    # Get doctors
    result = cur.execute("SELECT * FROM medicines")
    row_headers = [x[0] for x in cur.description]
    medicines = cur.fetchall()
    output=[]
    for result in medicines:
        medicine_data = {}
        medicine_data['medicine_id'] = medicines.medicine_id
        medicine_data['medicine_name'] = medicines.medicine_name
        medicine_data['manufracturers_name'] = medicines.manufracturers_name
        medicine_data['treatment_of'] = medicines.treatment_of
        medicine_data['composition'] = medicines.composition
        output.append(medicine_data)
    # close connection
    cur.close()

    return jsonify({'medlist': output})
    #return print(medicines)

@app.route('/checkj', methods=['GET'])
@is_logged_in
def checkj():
    cur = mysql.connect.cursor()
    cur.execute('''select * from appointments''')
    medj=cur.fetchall()
    r = [dict((cur.description[i][0], value)
              for i, value in enumerate(row)) for row in cur.fetchall()]
    print(r)
    return jsonify({'myCollection': medj})

def myconverter(o):
        if isinstance(o, datetime.datetime):
            return o.__str__()
@app.route('/fullcalendarjson')
@is_logged_in
def fullcalendar():
    names_key = {'appointment_id': 'id',
                 'appointments_doctors_id': 'doct-id',
                 'appointments_patients_id': 'pid',
                 'comments': 'notes',
                 'doctor_name': 'Doctor',
                 'end_time': 'end',
                 'patient_name': 'title',
                 'start_time': 'start'
                 }
    cur = mysql.connect.cursor()
    cur.execute('''select * from appointments''')
    medj = cur.fetchall()
    r = [dict((cur.description[i][0], value)
              for i, value in enumerate(row)) for row in cur.fetchall()]
    print(r)
    #medj['end_time'] = datetime.datetime.now()


    j_list= dumps(medj, default= str)


    for row in medj:
        for k, v in names_key.items():
            for old_name in row:
                if k == old_name:
                    row[v] = row.pop(old_name)


    return make_response(dumps(medj, default = str))

@app.route('/ga_list', methods=['GET', 'POST'])
@is_logged_in
def ga_list():

    ga_list = [
  {
    "title": "All Day Event",
    "start": "2019-01-01"
  },
  {
    "title": "Long Event",
    "start": "2019-01-07",
    "end": "2019-01-10"
  },
  {
    "id": "999",
    "title": "Repeating Event",
    "start": "2019-01-09T16:00:00-05:00"
  },
  {
    "id": "999",
    "title": "Repeating Event",
    "start": "2019-01-16T16:00:00-05:00"
  },
  {
    "title": "Conference",
    "start": "2019-01-11",
    "end": "2019-01-13"
  },
  {
    "title": "Meeting",
    "start": "2019-01-12T10:30:00-05:00",
    "end": "2019-01-12T12:30:00-05:00"
  },
  {
    "title": "Lunch",
    "start": "2019-01-12T12:00:00-05:00"
  },
  {
    "title": "Meeting",
    "start": "2019-01-12T14:30:00-05:00"
  },
  {
    "title": "Happy Hour",
    "start": "2019-01-12T17:30:00-05:00"
  },
  {
    "title": "Dinner",
    "start": "2019-01-12T20:00:00"
  },
  {
    "title": "Birthday Party",
    "start": "2019-01-13T07:00:00-05:00"
  },
  {
    "title": "Click for Google",
    "url": "http://google.com/",
    "start": "2019-01-28"
  }
]


    #print(ga_list)
    return make_response(dumps(ga_list))


@app.route('/appointment_date', methods=['POST'])
@is_logged_in
def appointment_date():
    patient_name = request.form['patient_name']
    doctors_name = request.form['doctors_name']
    st=request.form['start_time']
    #st= datetime.datetime.strptime(request.form['start_time'], '%Y-%m-%d %H:%M:%S')
    start_time = request.form['start_time']
    #et = datetime.datetime.strptime(request.form['end_time'], '%Y-%m-%d %H:%M:%S')
    end_time = request.form['end_time']
    comments = request.form['comments']
    idofpatient = "11"

    if patient_name:
        print(idofpatient, doctors_name, patient_name, start_time, end_time, comments)
        cur1 = mysql.connection.cursor()
        # execute
        cur1.execute(
            "INSERT INTO appointments(appointments_patients_id, doctor_name, patient_name, start_time, end_time, comments) VALUES(%s,%s,%s,%s, %s, %s)",
            (idofpatient, doctors_name, patient_name, start_time, end_time, comments))
        # commit
        mysql.connection.commit()

        # close connection
        cur1.close()

        return jsonify({'success': 'Appointment added!'})

    return jsonify({'error': 'missing data!'})


# run the app
if __name__ == "__main__":
    app.secret_key = 'secrete123'
    app.run(host='0.0.0.0')



