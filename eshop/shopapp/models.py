from django.db import models

# Create your models here.
class signup_tbl(models.Model):
	name=models.CharField(max_length=50,default="")
	email=models.CharField(max_length=50,default="")
	password=models.CharField(max_length=50,default="")
	status=models.CharField(max_length=50,default="approved")

class admin_signup_tb(models.Model):
	firstname=models.CharField(max_length=50,default="")
	lastname=models.CharField(max_length=50,default="")
	email=models.CharField(max_length=50,default="")
	gender=models.CharField(max_length=50,default="")
	password=models.CharField(max_length=50,default="")
	hpassword=models.TextField(default="")

class product_add(models.Model):
	category=models.CharField(max_length=50,default="")
	productname=models.CharField(max_length=50,default="")
	price=models.CharField(max_length=50,default="")
	quantity=models.CharField(max_length=50,default="")
	image=models.FileField(upload_to="produts")
	description=models.CharField(max_length=50,default="")
	status=models.CharField(max_length=50,default="approved")
class cart_tbl(models.Model):
	userid=models.ForeignKey(signup_tbl, on_delete=models.CASCADE)
	pid=models.ForeignKey(product_add,on_delete=models.CASCADE,default="",null=True)
	quantity=models.CharField(max_length=100,default='')
	total=models.CharField(max_length=100,default='')
	unitprice=models.CharField(max_length=100,default='')
	date=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='pending')



