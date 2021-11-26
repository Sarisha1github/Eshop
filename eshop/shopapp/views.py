from django.shortcuts import render
from .models import *
from django.http import HttpResponseRedirect
import hashlib
import random
import string
from django.conf import settings
from django.core.mail import send_mail
import os
import datetime

# Create your views here.
def index(request):
	query=product_add.objects.all()
	return render(request,'user/index.html',{'query':query})

def product_single(request):
	if request.session.has_key('myid'):
		id1=request.GET['id']
		query=product_add.objects.all().filter(id=id1)
		return render(request,'user/single.html',{'query':query})
	else:
		return render(request,'user/index.html')


def about(request):
	return render(request,'user/about.html')

def contact(request):
	return render(request,'user/contact.html')

def mens(request):
	query=product_add.objects.all()
	return render(request,'user/mens.html',{'query':query})

def womens(request):
	query=product_add.objects.all()
	return render(request,'user/womens.html',{'query':query})


def signup(request):
	if request.method=="POST":
		name=request.POST['Name']
		email=request.POST['Email']
		password=request.POST['password']
		check=signup_tbl.objects.all().filter(email=email)
		if check:
			return render(request,'user/index.html')
		else:
			x = ''.join(random.choices(name + string.digits, k=8))
			y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
			subject = 'welcome to Elite Shoppy'
			message = f"Hi {name}, thank you for registering in Elite Shoppy . Your  username: {email} and  password: {password}. Follow http://127.0.0.1:8000/signin to login \n Thank you"
			email_from = settings.EMAIL_HOST_USER 
			recipient_list = [email, ] 
			send_mail( subject, message, email_from, recipient_list ) 


			add=signup_tbl(name=name,email=email,password=password)
			add.save()
		return render(request,'user/index.html')
	else:
		return render(request,'user/index.html')

def signin(request):
	if request.method=="POST":
		email=request.POST['email']
		password=request.POST['password']
		log=signup_tbl.objects.all().filter(email=email,password=password,status="approved")
		if log:
			for x in log:
				request.session["myid"]=x.id
				ii=request.session["myid"]
				query=product_add.objects.all()
				return render(request,'user/index.html',{'query':query})
		else:
			return render(request,'user/index.html',)
	else:
		return render(request,'user/index.html')


def logout(request):
	if request.session.has_key('myid'):
		del request.session["myid"]
		
		return HttpResponseRedirect('/')





###################################################################################################


def adminindex(request):
	return render(request,'admin/index.html')


def admin_login(request):
	if request.method=="POST":
		email=request.POST['email']
		password=request.POST['password']
		hashpass=hashlib.md5(password.encode('utf8')).hexdigest()
		log=admin_signup_tb.objects.all().filter(email=email,hpassword=hashpass)
		if log:
			for x in log:
				request.session["aid"]=x.id
				request.session["name"]=x.firstname
				ii=request.session["aid"]
				user=admin_signup_tb.objects.all().filter(id=ii)
				return HttpResponseRedirect('/adminindex/')
		else:
			return render(request,'admin/login.html')
	else:
		return render(request,'admin/login.html')

def products_add(request):
	if request.method=="POST":
		category=request.POST['category']
		pname=request.POST['pname']
		price=request.POST['price']
		image=request.FILES['myimg']
		description=request.POST['description']
		add=product_add(category=category,productname=pname,price=price,image=image,description=description)
		add.save()
		query=product_add.objects.all().filter(status="approved")
		return render(request,'admin/tables.html',{'data':query})
		# return render(request,'admin/tables.html')
	else:
		return render(request,'admin/forms.html')

def products_view(request):
		query=product_add.objects.all().filter(status="approved")
		return render(request,'admin/tables.html',{'data':query})

def products_view_reject(request):
		query=product_add.objects.all().filter(status="rejected")
		return render(request,'admin/rejects.html',{'data':query})

def products_update(request):
	if request.method=="GET":
		pid=request.GET['id']
		products=product_add.objects.all().filter(id=pid)
		if products:
			return render(request,'admin/productupdate.html',{'products':products})
		else:
			return render(request,'admin/productupdate.html')

def product_edit(request):
	if request.method=="POST":
		pid=request.GET['id']
		category=request.POST['category']
		pname=request.POST['pname']
		description=request.POST['description']
		price=request.POST['price']
		imgup=request.POST['img']
		if imgup=='Yes':
			image1=request.FILES['myimg']
			oldrec=product_add.objects.all().filter(id=pid)
			updrec=product_add.objects.get(id=pid)
			for x in oldrec:
				imgurl=x.image.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('Successfully deleted')
			updrec.image=image1
			updrec.save()
		
		product_add.objects.filter(id=pid).update(category=category,productname=pname,description=description,price=price)
		query=product_add.objects.all().filter(status="approved")
		return render(request,'admin/tables.html',{'data':query})
	elif request.method=="GET":
		pid=request.GET['id']
		query=user_tbl.objects.all()
		return render(request,'admin/productupdate.html',{'data':query})

def product_rejects(request):
	id1=request.GET['id']
	product_add.objects.all().filter(id=id1).update(status="rejected")
	query=product_add.objects.all().filter(status="rejected")
	return render(request,'admin/tables.html',{'data':query})

def delete(request):
	query=product_add.objects.all()
	sid=request.GET['id']
	student=product_add.objects.all().filter(id=sid).delete()
	return render (request,'admin/tables.html',{'data':query})
  


def admin_signup(request):
	if request.method=="POST":
		fname=request.POST['firstname']
		lname=request.POST['lastname']
		email=request.POST['email']
		gender=request.POST['gender']
		password=request.POST['password']
		hashpass=hashlib.md5(password.encode('utf8')).hexdigest()
		check=admin_signup_tb.objects.all().filter(email=email)
		if check:
			return render(request,'admin/signup.html')
		else:
			x = ''.join(random.choices(fname + string.digits, k=8))
			y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
			subject = 'welcome to Elite Shoppy'
			message = f"Hi {fname}, thank you for registering in Elite Shoppy . Your  username: {email} and  password: {password}. Follow http://127.0.0.1:8000/signin to login \n Thank you"
			email_from = settings.EMAIL_HOST_USER 
			recipient_list = [email, ] 
			send_mail( subject, message, email_from, recipient_list ) 
			add=admin_signup_tb(firstname=fname,lastname=lname,email=email,gender=gender,password=password,hpassword=hashpass)
			add.save()
		return render(request,'admin/signup.html',{"msg": "Register sucessfully" })
	else:
		return render(request,'admin/signup.html')

def admin_logout(request):
	if request.session.has_key('aid'):
		del request.session["aid"]
		del request.session["name"]
		
		return HttpResponseRedirect('/adminlogin/')


def users_view(request):
	query=signup_tbl.objects.all().filter(status="approved")
	return render(request,'admin/usersview.html',{'data':query})

def users_reject(request):
	id1=request.GET['id']
	signup_tbl.objects.all().filter(id=id1).update(status="rejected")
	query=signup_tbl.objects.all().filter(status="rejected")
	return render(request,'admin/usersview.html',{'data':query})

def view_users_reject(request):
	query=signup_tbl.objects.all().filter(status="rejected")
	return render(request,'admin/rejectedusers.html',{'data':query})

def product_addcart(request):
	if request.session.has_key('myid'):
		if request.method=='POST':
			pids=request.GET['id']
			prd=product_add.objects.all().filter(id=pids)
			for x in prd:
				unitprice=x.price
			qty=request.POST['qty']
			shipping=int(int(unitprice)*10/100)
			total=int(unitprice)*int(qty)+shipping
			date= datetime.datetime.now()
			ii=request.session["myid"]
			print(ii)				
			uid=signup_tbl.objects.get(id=ii)
			x = datetime.datetime.now()
			pid=product_add.objects.get(id=pids)
			ii=signup_tbl.objects.get(id=ii)
			check=cart_tbl.objects.all().filter(userid=ii,pid=pids,unitprice=unitprice,total=total,date=date)
			if check:
				myprd=cart_tbl.objects.all().filter(userid=ii,status='pending')
				
				return render(request,'user/cart.html',{'query':myprd,'msgkey':'Already Add to cart'})
			else:
				tocart=cart_tbl(userid=ii,pid=pid,unitprice=unitprice,total=total,date=date,quantity=qty)
				tocart.save()
				thisprd=product_add.objects.all().filter(id=pids)
				for x in thisprd:
					oldqty=x.quantity
				newqty=int(oldqty)-int(qty)
				product_add.objects.all().filter(id=pids).update(quantity=newqty)
				mycart=cart_tbl.objects.all().filter(userid=ii,status='pending')
				grandtotal=0
				for x in mycart:
					grandtotal=int(x.total)+grandtotal
				myprd=cart_tbl.objects.all().filter(userid=ii,status='pending')
				
				return render(request,'user/cart.html',{'query':myprd,'gt':grandtotal,'msgkey':'Add to cart'})
	else:
		print("*************************************************************")
		return render(request,'user/index.html')




    
    
    
    
def delete_cartitem(request):
	ii=request.session['myid']
	cid=request.GET['id']
	cartitem=cart_tbl.objects.all().filter(id=cid)
	for x in cartitem:
		itemid=x.pid.id
		quantity=x.quantity
		prddata=product_add.objects.all().filter(id=itemid)
		for x in prddata:
			oldqty=x.quantity
		newqty=int(oldqty)+int(quantity)
		product_add.objects.all().filter(id=itemid).update(quantity=newqty)
	
	cart_tbl.objects.all().filter(id=cid).delete()
	mycart=cart_tbl.objects.all().filter(userid=ii,status='pending')
	grandtotal=0
	for x in mycart:
		grandtotal=int(x.total)+grandtotal
	myprd=cart_tbl.objects.all().filter(userid=ii,status='pending')
	return render(request,'user/cart.html',{'query':myprd,'gt':grandtotal,'msg':'Successfully deleted'})
  
  
  
  
  
  
  
def cart(request):
	if request.session['myid']:
		ii=request.session['myid']
		mycart=cart_tbl.objects.all().filter(userid=ii,status='pending')
		grandtotal=0
		for x in mycart:
			grandtotal=int(x.total)+grandtotal
			myprd=cart_tbl.objects.all().filter(userid=ii,status='pending')
		return render(request,'user/cart.html',{'query':myprd,'gt':grandtotal})
	else:
		return render(request,'user/index.html')




