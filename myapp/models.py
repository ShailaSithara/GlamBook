from django.db import models

# Create your models here.

class Login(models.Model):
    Username=models.CharField(max_length=100)
    Password=models.CharField(max_length=100)
    Type=models.CharField(max_length=100)


class Rental(models.Model):
    Name=models.CharField(max_length=100)
    Phoneno=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    Post=models.CharField(max_length=100)
    Pin=models.CharField(max_length=100)
    State=models.CharField(max_length=100)
    Status=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Longitude=models.CharField(max_length=100)
    Latitude=models.CharField(max_length=100)

class User(models.Model):
    Name=models.CharField(max_length=100)
    Phoneno=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    Post=models.CharField(max_length=100)
    Pin=models.CharField(max_length=100)
    State=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Gender=models.CharField(max_length=100)
    Dob=models.DateField()
    Status=models.CharField(max_length=100)


class Artist(models.Model):
    Name=models.CharField(max_length=100)
    Phoneno=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    Post=models.CharField(max_length=100)
    Pin=models.CharField(max_length=100)
    State=models.CharField(max_length=100)
    Status=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Gender = models.CharField(max_length=100)
    Longitude = models.CharField(max_length=100)
    Latitude = models.CharField(max_length=100)



class Complaint(models.Model):
    Complaint=models.CharField(max_length=100)
    Reply=models.CharField(max_length=100)
    Status=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Date=models.DateField()


class Review(models.Model):
    Review=models.CharField(max_length=100)
    Rating=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Date=models.DateField()

class Service(models.Model):
    Service=models.CharField(max_length=100)
    Price=models.CharField(max_length=100)
    ARTIST=models.ForeignKey(Artist,on_delete=models.CASCADE)

class Gallery(models.Model):
    Photo1=models.CharField(max_length=300)
    Photo2=models.CharField(max_length=300)
    Photo3=models.CharField(max_length=300)
    ARTIST=models.ForeignKey(Artist,on_delete=models.CASCADE)


class Booking(models.Model):
    SERVICE=models.ForeignKey(Service, on_delete=models.CASCADE)
    USER=models.ForeignKey(User, on_delete=models.CASCADE)
    Date=models.DateField()


class Product(models.Model):
    Productname=models.CharField(max_length=100)
    Price=models.CharField(max_length=100)
    RENTAL=models.ForeignKey(Rental, on_delete=models.CASCADE)

class Bookingmain(models.Model):
    PRODUCT=models.ForeignKey(Product,on_delete=models.CASCADE)
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    Date=models.DateField()
    Status = models.CharField(max_length=100)


class Chat(models.Model):
    LOGIN1=models.ForeignKey(Login,on_delete=models.CASCADE,related_name='frmlog')
    LOGIN2=models.ForeignKey(Login,on_delete=models.CASCADE,related_name='tolog')
    Date=models.DateField()
    Msg=models.CharField(max_length=100)

class   Stock(models.Model):
    PRODUCT=models.ForeignKey(Product, on_delete=models.CASCADE)
    Stock= models.CharField(max_length=100)
    Date = models.DateField()


class Payment(models.Model):
    Id=models.CharField(max_length=100)
    Status = models.CharField(max_length=100)
    Creditedfrom=models.CharField(max_length=100)
    Bankdetails=models.CharField(max_length=100)
    Amount=models.CharField(max_length=100)
    Date = models.DateField()



