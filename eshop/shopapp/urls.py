from django.urls  import path
from shopapp import views

urlpatterns = [
path('',views.index),
path('about/',views.about),
path('contact/',views.contact),
path('mens/',views.mens),
path('womens/',views.womens),
path('signup/',views.signup),
path('signin/',views.signin),
path('logout/',views.logout),
path('product_single/',views.product_single),
path('product_addcart/',views.product_addcart),
path('cart/',views.cart),

path('delete_cartitem/',views.delete_cartitem),












path('adminindex/',views.adminindex),
path('adminlogin/',views.admin_login),
path('adminsignup/',views.admin_signup),
path('adminlogout/',views.admin_logout),
path('admin_forms/',views.products_add),
path('products_view/',views.products_view),
path('products_update/',views.products_update),
path('products_edit/',views.product_edit),
path('delete/',views.delete),
path('products_rejects/',views.product_rejects),
path('products_view_reject/',views.products_view_reject),
path('users_view/',views.users_view),
path('users_rejects/',views.users_reject),
path('rejectedusers/',views.view_users_reject)







]