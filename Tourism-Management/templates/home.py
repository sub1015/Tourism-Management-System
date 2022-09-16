from os import name
import re
import psycopg2
from flask import Flask,render_template,url_for,request,redirect,flash

app = Flask(__name__)
app.secret_key="super secret key"

con = psycopg2.connect(
    host = "localhost",
    port = "5432",
    database = "tourism",
    user = "postgres",
    password = "Nandana123#"
)

cur = con.cursor()


@app.route("/")
def home():
    return render_template("login.html")

@app.route("/user", methods=['GET','POST'])
def user():
    if request.method == 'POST':
        try:
            obj = request.form
            psw = obj['psw']
            usr=obj['user']
            con = psycopg2.connect(
            host = "localhost",
            port = "5432",
            database = "tourism",
            user = usr,
            password = psw
            )
            return render_template('userpage.html')
        except:
            return render_template("password.html")
    return render_template("password.html")

@app.route("/insert_customer",methods = ['GET','POST'])
def insertcustomer():
    if request.method == 'POST':
        obj = request.form
        cid = obj['cid']
        cname = obj['cname']
        cemail = obj['cemail']
        did = obj['did']
        aid = obj['aid']
        contact = obj['contact']
        cur.execute("insert into customer values('{0}','{1}','{2}','{3}','{4}')".format(cid,cname,cemail,did,aid,aid))
        cur.execute("insert into customer_contact values('{0}','{1}')".format(contact,cid))
        con.commit()
        flash('inserted successfully')
        return render_template("userpage.html")
    else:
        return render_template("insert_customer.html")


@app.route("/delete_customer",methods = ['GET','POST'])
def deletecustomer():
    if request.method == 'POST':
        obj = request.form
        cid = obj['cid']
        cur.execute("delete from customer_contact where customer_id='{0}'".format(cid))
        cur.execute("delete from customer where customer_id='{0}'".format(cid))
        con.commit()
        return render_template("userpage.html")
    else:
        return render_template("delete_customer.html")

@app.route("/user_count")
def user_count():
    cur.execute("select count(*) AS number_of_customer from customer")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/user_q1")
def user_q1():
    cur.execute("select * from agency")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/user_q2")
def user_q2():
    cur.execute("select place from destination")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/user_q3",methods = ['GET','POST'])
def destionation_country():
    if request.method == 'POST':
        obj = request.form
        cname = obj['cname']
        cur.execute("select place from destination where country='{0}'".format(cname))
        rows = cur.fetchall()
        col = [desc[0] for desc in cur.description]
        return render_template('result.html',content = [rows,col])
    else:
        return render_template("select_country.html")






@app.route("/staff",methods=['GET','POST'])
def staff():
    if request.method == 'POST':
        try:
            obj = request.form
            psw = obj['psw']
            usr=obj['user']
            con = psycopg2.connect(
            host = "localhost",
            port = "5432",
            database = "tourism",
            user = usr,
            password = psw
            )
            return render_template('staffpage.html')
        except:
            return render_template("password.html")
    return render_template("password.html")

@app.route("/insert_staff",methods = ['GET','POST'])
def insertstaff():
    if request.method == 'POST':
        obj = request.form
        sid = obj['sid']
        sname = obj['sname']
        semail = obj['semail']
        sagency = obj['sagency']
       
        cur.execute("insert into staff values('{0}','{1}','{2}')".format(sid,sname,semail))
        cur.execute("insert into agency_staff values('{0}','{1}')".format(sagency,sid))
        con.commit()
        flash('inserted successfully')
        return render_template("staffpage.html")
    else:
        return render_template("insert_staff.html")

@app.route("/view_staff")
def staff_q1():
    cur.execute("select * from staff")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/view_agency")
def staff_q2():
    cur.execute("select agency_name from agency")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/staff_q1")
def staff_q3():
    cur.execute("select agency_name,count(staff_id) from agency_staff as ast , agency as a group by a.agency_name,ast.agency_id,a.agency_id having ast.agency_id = a.agency_id")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/agency",methods=['GET','POST'])
def agent():
    if request.method == 'POST':
        try:
            obj = request.form
            psw = obj['psw']
            usr=obj['user']
            con = psycopg2.connect(
            host = "localhost",
            port = "5432",
            database = "tourism",
            user = usr,
            password = psw
            )
            return render_template('agencypage.html')
        except:
            return render_template("password.html")
    return render_template("password.html")

@app.route("/insert_agency",methods = ['GET','POST'])
def insertagencfy():
    if request.method == 'POST':
        obj = request.form
        aid = obj['aid']
        aname = obj['aname']
        
        cur.execute("insert into agency values('{0}','{1}')".format(aid,aname))
        con.commit()
        flash('inserted successfully')
        return render_template("agencypage.html")
    else:
        return render_template("insert_agency.html")




@app.route("/insert_destination",methods = ['GET','POST'])
def insertdestination():
    if request.method == 'POST':
        obj = request.form
        deid = obj['deid']
        place = obj['place']
        country = obj['country']
     
        cur.execute("insert into destination values('{0}','{1}','{2}')".format(deid,place,country))
        con.commit()
        flash('inserted successfully')
        return render_template("userpage.html")
    else:
        return render_template("insert_destination.html")

@app.route("/agency_q1")
def agency_q1():
    cur.execute("select agent_name, contact_no from agent_contact as ac,agent as a where ac.agent_id = a.agent_id")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])

@app.route("/agency_q2")
def agency_q2():
    cur.execute(" select vehicle_id,vehicle_type from transportation where rate = (select min(rate) from transportation)")
    rows = cur.fetchall()
    col = [desc[0] for desc in cur.description]
    return render_template('result.html',content = [rows,col])





if __name__ == "__main__":
    app.run(debug=True)