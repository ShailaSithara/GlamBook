from django.http import HttpResponse, request
from django.shortcuts import render

# Create your views here.
from myapp.models import *


def login(request):
    return render(request,'loginindex.html')

def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    a=Login.objects.filter(Username=username,Password=password)
    if a.exists():
        b=Login.objects.get(Username=username,Password=password)
        request.session['lid']=b.id
        if b.Type=='admin':
            return HttpResponse('''<script>alert('Login Successfull');window.location="/myapp/admin_home/"</script>''')
        if b.Type=='rental':
            return HttpResponse('''<script>alert('Login Successfull');window.location="/myapp/rental_home/"</script>''')
        else:
            return HttpResponse('''<script>alert('Invalid username or password');window.location="/myapp/login/"</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid username or password');window.location="/myapp/login/"</script>''')


def admin_view_rentalshop(request):
    ra=Rental.objects.filter(Status='pending')
    return render(request,'admin/view rentalshop.html',{"data":ra})

def admin_approve_rentalshop(request,id):
    ra=Rental.objects.filter(LOGIN_id=id).update(Status='approved')

    bb=Login.objects.filter(id=id).update(Type='rental')
    return HttpResponse('''<script>alert('approved');window.location="/myapp/admin_view_rentalshop/"</script>''')

def admin_reject_rentalshop(request,id):
    ra=Rental.objects.filter(LOGIN_id=id).update(Status='rejected')
    bb=Login.objects.filter(id=id).update(Type='blocked')

    return HttpResponse('''<script>alert('rejected');window.location="/myapp/admin_view_rentalshop/"</script>''')



def rental_booking_approved(request,id):
    ra=Bookingmain.objects.filter(id=id).update(Status='approved')

    return HttpResponse('''<script>alert('approved');window.location="/myapp/rental_viewbooking_from_user/"</script>''')

def rental_booking_rejected(request,id):
    ra=Bookingmain.objects.filter(id=id).update(Status='rejected')

    return HttpResponse('''<script>alert('rejected');window.location="/myapp/rental_viewbooking_from_user/"</script>''')











def admin_view_rentalshop_post(request):
    name=request.POST['textfield']
    er=Rental.objects.filter(Name__icontains=name,Status='pending')
    return render(request,'admin/view rentalshop.html',{"data":er})

def admin_approved_rentalshop(request):
    ra = Rental.objects.filter(Status='approved')
    return render(request, 'admin/viewapprovedrentalshop.html',{"data":ra})

def admin_approved_rentalshop_post(request):
    name = request.POST['textfield']
    ra = Rental.objects.filter(Status='approved',Name__icontains=name)
    return render(request, 'admin/viewapprovedrentalshop.html', {"data": ra})

def admin_rejected_rentalshop(request):
    ra = Rental.objects.filter(Status='rejected')
    return render(request, 'admin/viewrejectedrentalshop.html',{"data":ra})

def admin_rejected_rentalshop_post(request):
    name = request.POST['textfield']
    ra = Rental.objects.filter(Status='rejected', Name__icontains=name)
    return render(request, 'admin/viewrejectedrentalshop.html', {"data":ra})

def admin_view_pending_artist(request):
    ra = Artist.objects.filter(Status='pending')
    return render(request, 'admin/view pending artist 5.html',{"data":ra})

def admin_view_pending_artist_post(request):
    name = request.POST['textfield']
    ra = Artist.objects.filter(Status='pending', Name__icontains=name)
    return render(request, 'admin/view pending artist 5.html',{"data":ra})






def admin_approve_artist(request,id):
    ra=Artist.objects.filter(LOGIN_id=id).update(Status='approved')
    bb=Login.objects.filter(id=id).update(Type='artist')
    return HttpResponse('''<script>alert('approved');window.location="/myapp/admin_view_pending_artist/"</script>''')

def admin_reject_artist(request,id):
    ra=Artist.objects.filter(LOGIN_id=id).update(Status='rejected')
    bb=Login.objects.filter(id=id).update(Type='blocked')

    return HttpResponse('''<script>alert('rejected');window.location="/myapp/admin_view_pending_artist/"</script>''')







def admin_approved_artist(request):
    ra = Artist.objects.filter(Status='approved')
    return render(request, 'admin/approved artist 6.html',{"data":ra})

def admin_approved_artist_post(request):
    name = request.POST['textfield']
    ra = Artist.objects.filter(Status='approved', Name__icontains=name)
    return render(request, 'admin/approved artist 6.html',{"data":ra})


def admin_rejected_artist(request):
    ra = Artist.objects.filter(Status='rejected')
    return render(request, 'admin/reject artist 7.html',{"data":ra})

def admin_rejected_artist_post(request):
    name = request.POST['textfield']
    ra = Artist.objects.filter(Status='rejected',Name__icontains=name)
    return render(request, 'admin/reject artist 7.html',{"data":ra})

def admin_view_user(request):
    ra=User.objects.filter()
    return render(request, 'admin/view user 8.html',{"data":ra})

def admin_view_user_post(request):
    name = request.POST['textfield']
    ra = User.objects.filter(Name__icontains=name)
    return render(request, 'admin/view user 8.html',{"data":ra})


def admin_view_complaint(request):
    ra = Complaint.objects.filter()
    return render(request, 'admin/complaint 9.html',{"data":ra})

def admin_view_complaint_post(request):
    fromdate = request.POST['textfield']
    todate = request.POST['textfield2']
    ra = Complaint.objects.filter(Date__range=[fromdate, todate])
    return render(request, 'admin/complaint 9.html', {"data": ra})


def admin_send_reply(request,id):
    return render(request, 'admin/reply 10.html',{"id":id})

def admin_send_reply_post(request):
    Reply = request.POST['textfield']
    id=request.POST['id']
    ra = Complaint.objects.filter(id=id).update(Reply=Reply)
    return HttpResponse('''<script>alert('reply sent');window.location="/myapp/login/"</script>''')


def admin_view_rentalshop_review(request):
    ra = Review.objects.filter()
    return render(request, 'admin/view rentalshop review 11.html',{"data":ra})

def admin_view_rentalshop_review_post(request):
    fromdate = request.POST['textfield']
    todate = request.POST['textfield2']
    ra = Review.objects.filter(Date__range=[fromdate, todate])
    return render(request, 'admin/view rentalshop review 11.html', {"data": ra})


def admin_view_artist_review(request):
    ra = Review.objects.filter()
    return render(request, 'admin/view artist review 12.html',{"data":ra})

def admin_view_artist_review_post(request):
    fromdate = request.POST['textfield']
    todate = request.POST['textfield2']
    ra = Review.objects.filter(Date__range=[fromdate, todate])
    return render(request, 'admin/view artist review 12.html', {"data": ra})




def admin_changepassword(request):
    return render(request, 'admin/change password.html')
def admin_changepassword_post(request):
    old_password = request.POST['textfield']
    new_password = request.POST['textfield2']
    confirm_password = request.POST['textfield3']
    a = Login.objects.filter(id=request.session['lid'], Password=old_password)
    if a.exists():
        if new_password==confirm_password:

            b = Login.objects.filter(id=request.session['lid'], Password=old_password).update(Password=new_password)
            return HttpResponse(
                '''<script>alert('password changed successfully');window.location="/myapp/login/"</script>''')

        else:
            return HttpResponse(
                '''<script>alert('Password do not match');history.back()</script>''')
    else:
        return HttpResponse(
            '''<script>alert('current password not match');history.back()</script>''')




def admin_home(request):
    return render(request, 'admin/adminindex.html')

# ==============================rental============================

def rental_signup(request):
    return render(request,'rental/sign up.html')

def rental_signup_post(request):
    name=request.POST['textfield2']
    phoneno=request.POST['textfield3']
    email=request.POST['textfield4']
    place=request.POST['textfield5']
    post=request.POST['textfield6']
    pin=request.POST['textfield7']
    state=request.POST['textfield8']
    latitude=request.POST['textfield10']
    longitude=request.POST['textfield11']
    password=request.POST['password']
    confirmpassword=request.POST['cpassword']
    rt=Login()
    rt.Username=email
    rt.Password=confirmpassword
    rt.Type='pending'
    rt.save()
    rw=Rental()
    rw.Name=name
    rw.Phoneno=phoneno
    rw.Email=email
    rw.Place=place
    rw.Post=post
    rw.Pin=pin
    rw.State=state
    rw.Status='pending'
    rw.Latitude=latitude

    rw.Longitude=longitude
    rw.LOGIN_id=rt.id
    rw.save()


    return HttpResponse('''<script>alert('signup successfully');window.location="/myapp/login/"</script>''')



#
# def rental_login(request):
#     return render(request,'rental/file1.html')

# def rental_login_post(request):
#     username = request.POST['textfield']
#     password = request.POST['textfield2']
#     a = Login.objects.filter(Username=username, Password=password)
#     if a.exists():
#         b = Login.objects.get(Username=username, Password=password)
#         request.session['lid'] = b.id
#         if b.Type == 'admin':
#             return HttpResponse('''<script>alert('Login Successfull');window.location="/myapp/admin_home/"</script>''')
#         else:
#             return HttpResponse(
#                 '''<script>alert('Invalid username or password');window.location="/myapp/login/"</script>''')
#     else:
#         return HttpResponse(
#             '''<script>alert('Invalid username or password');window.location="/myapp/login/"</script>''')


def rental_viewprofile(request):
    ra = Rental.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'rental/view profile 15.html',{"data":ra})









def rental_editprofile(request):
    ra = Rental.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'rental/edit profile 16.html',{"data":ra})








def rental_editprofile_post(request):
    name = request.POST['textfield2']
    phoneno = request.POST['textfield3']
    email = request.POST['textfield4']
    place = request.POST['textfield5']
    post = request.POST['textfield6']
    pin = request.POST['textfield7']
    state = request.POST['textfield8']
    status = request.POST['textfield9']
    latitude = request.POST['textfield10']
    longitude = request.POST['textfield11']

    rw = Rental.objects.get(LOGIN_id=request.session['lid'])
    rw.Name = name
    rw.Phoneno = phoneno
    rw.Email = email
    rw.Place = place
    rw.Post = post
    rw.Pin = pin
    rw.State = state
    rw.Latitude = latitude

    rw.Longitude = longitude
    rw.save()
    return HttpResponse('''<script>alert('profile edited successfully');window.location="/myapp/login/"</script>''')




def rental_changepassword(request):
    return render(request,'rental/change password.html')
def rental_changepassword_post(request):
    old_password = request.POST['textfield']
    new_password = request.POST['textfield2']
    confirm_password = request.POST['textfield3']
    a = Login.objects.filter(id=request.session['lid'], Password=old_password)
    if a.exists():
        if new_password == confirm_password:
            b = Login.objects.get(id=request.session['lid'], Password=old_password)
            b.Password=new_password
            b.save()
            return HttpResponse(
                '''<script>alert('password changed successfully');window.location="/myapp/login/"</script>''')

        else:
            return HttpResponse(
                '''<script>alert('Password do not match');history.back()</script>''')
    else:
        return HttpResponse(
            '''<script>alert('current password not match');history.back()</script>''')


def rental_managestock(request):
    ra = Product.objects.all()
    return render(request,'rental/manage stock.html',{"data":ra})

def rental_managestock_post(request):
    stock = request.POST['textfield']
    product = request.POST['select']
    rt=Stock()
    from datetime import datetime
    date=datetime.now()
    rt.Date=date
    rt.PRODUCT_id=product
    rt.Stock=stock
    rt.save()
    return HttpResponse('''<script>alert('product found successfully');window.location="/myapp/login/"</script>''')



def rental_viewstock(request):
    ra = Stock.objects.filter()
    return render(request,'rental/view stock.html',{"data":ra})

def rental_viewstock_post(request):
    name = request.POST['textfield']
    ra = Stock.objects.filter(PRODUCT__Productname__icontains= name)
    return render(request, 'rental/view stock.html',{"data":ra})

def rental_editstock(request,id):
    jk=Product.objects.all()
    ra = Stock.objects.get(id=id)
    return render(request,'rental/edit stock.html',{"data":ra,'data1':jk})
def rental_editstock_post(request):
    stock = request.POST['textfield']
    product = request.POST['select']
    id=request.POST['id']

    rt = Stock.objects.get(id=id)
    from datetime import datetime
    date = datetime.now()
    rt.Date = date
    rt.PRODUCT_id = product
    rt.Stock = stock
    rt.save()
    return HttpResponse('''<script>alert('product found successfully');window.location="/myapp/login/"</script>''')


def rental_deletestock(request,id):
    ra = Stock.objects.get(id=id).delete()


    return HttpResponse('''<script>alert('deleted successfully');window.location="/myapp/login/"</script>''')






def rental_viewbooking_from_user(request):
    ra = Bookingmain.objects.filter(Status='pending')
    return render(request,'rental/view booking from user.html',{'data':ra})

def rental_viewbooking_from_user_post(request):
    name = request.POST['textfield2']
    return render(request, 'rental/view booking from user.html')


def rental_approvedbooking_from_user(request):
    ra = Bookingmain.objects.filter(Status='approved')
    return render(request,'rental/approved bookiongs.html',{'data':ra})

def rental_approvedbooking_from_user_post(request):
    name = request.POST['textfield']
    ra = Bookingmain.objects.filter(Status='approved',PRODUCT__Productname__icontains= name)
    return render(request, 'rental/approved bookiongs.html',{'data':ra})









def rental_rejectedbooking_from_user(request):
    ra = Bookingmain.objects.filter(Status='rejected')
    return render(request,'rental/rejected bookings.html',{'data':ra})
def rental_rejectedbooking_from_user_post(request):
    name = request.POST['textfield']
    ra = Bookingmain.objects.filter(Status='rejected', PRODUCT__Productname__icontains=name)
    return render(request,'rental/rejected bookings.html',{'data':ra})

def rental_viewrating_from_user(request):
    tu=Review.objects.all()
    return render(request,'rental/view rating from user.html',{"data":tu})
def rental_viewrating_from_user_post(request):
    fromdate = request.POST['textfield']
    todate = request.POST['textfield2']
    tu = Review.objects.filter(Date__range=[fromdate,todate])
    return render(request,'rental/view rating from user.html',{"data":tu})

def rental_view_payment(request):
    re=Payment.objects.all()
    return render(request,'rental/view payment.html',{"data":re})

def rental_view_payment_post(request):
    fromdate = request.POST['textfield']
    todate = request.POST['textfield2']
    re= Payment.objects.filter(Date__range=[fromdate, todate])
    return render(request, 'rental/view payment.html',{"data":re})


def rental_home(request):
    return render(request, 'rental/rentalindex.html')




