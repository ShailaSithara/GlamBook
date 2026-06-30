"""
URL configuration for glambook project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myapp import views

urlpatterns = [
    path('login/',views.login),
    path('login_post/',views.login_post),

    path('admin_view_rentalshop/',views.admin_view_rentalshop),
    path('admin_view_rentalshop_post/',views.admin_view_rentalshop_post),

    path('admin_approve_rentalshop/<id>', views.admin_approve_rentalshop),
    path('admin_reject_rentalshop/<id>', views.admin_reject_rentalshop),

    path('admin_approved_rentalshop/',views.admin_approved_rentalshop),
    path('admin_approved_rentalshop_post/',views.admin_approved_rentalshop_post),

    path('admin_rejected_rentalshop/',views.admin_rejected_rentalshop),
    path('admin_rejected_rentalshop_post/',views.admin_rejected_rentalshop_post),

    path('admin_view_pending_artist/',views.admin_view_pending_artist),
    path('admin_view_pending_artist_post/',views.admin_view_pending_artist_post),


    path('admin_approve_artist/<id>',views.admin_approve_artist),
    path('admin_reject_artist/<id>',views.admin_reject_artist),






    path('admin_approved_artist/',views.admin_approved_artist),
    path('admin_approved_artist_post/',views.admin_approved_artist_post),

    path('admin_rejected_artist/',views.admin_rejected_artist),
    path('admin_rejected_artist_post/',views.admin_rejected_artist_post),

    path('admin_view_user/',views.admin_view_user),
    path('admin_view_user_post/',views.admin_view_user_post),

    path('admin_view_complaint/',views.admin_view_complaint),
    path('admin_view_complaint_post/',views.admin_view_complaint_post),

    path('admin_send_reply/<id>',views.admin_send_reply),
    path('admin_send_reply_post/',views.admin_send_reply_post),

    path('admin_view_rentalshop_review/',views.admin_view_rentalshop_review),
    path('admin_view_rentalshop_review_post/',views.admin_view_rentalshop_review_post),

    path('admin_view_artist_review/',views.admin_view_artist_review),
    path('admin_view_artist_review_post/',views.admin_view_artist_review_post),

    path('admin_changepassword/',views.admin_changepassword),
    path('admin_changepassword_post/',views.admin_changepassword_post),

    path('admin_home/',views.admin_home),

    # ==============================rental=======================

    path('rental_signup/', views.rental_signup),
    path('rental_signup_post/', views.rental_signup_post),

    # path('rental_login/', views.rental_login),
    # path('rental_login_post/', views.rental_login_post),

    path('rental_viewprofile/', views.rental_viewprofile),

    path('rental_editprofile/', views.rental_editprofile),
    path('rental_editprofile_post/', views.rental_editprofile_post),

    path('rental_deletestock/<id>', views.rental_deletestock),

    path('rental_changepassword/', views.rental_changepassword),
    path('rental_changepassword_post/', views.rental_changepassword_post),

    path('rental_managestock/', views.rental_managestock),
    path('rental_managestock_post/', views.rental_managestock_post),

    path('rental_viewstock/', views.rental_viewstock),
    path('rental_viewstock_post/', views.rental_viewstock_post),

    path('rental_editstock/<id>', views.rental_editstock),
    path('rental_editstock_post/', views.rental_editstock_post),

    path('rental_viewbooking_from_user/', views.rental_viewbooking_from_user),
    path('rental_viewbooking_from_user_post/', views.rental_viewbooking_from_user_post),

    path('rental_approvedbooking_from_user/', views.rental_approvedbooking_from_user),
    path('rental_approvedbooking_from_user_post/', views.rental_approvedbooking_from_user_post),

    path('rental_rejectedbooking_from_user/', views.rental_rejectedbooking_from_user),
    path('rental_rejectedbooking_from_user_post/', views.rental_rejectedbooking_from_user_post),

    path('rental_viewrating_from_user/', views.rental_viewrating_from_user),
    path('rental_viewrating_from_user_post/', views.rental_viewrating_from_user_post),

    path('rental_view_payment/', views.rental_view_payment),
    path('rental_view_payment_post/', views.rental_view_payment_post),

    path('rental_home/', views.rental_home),



    path('rental_booking_approved/<id>', views.rental_booking_approved),
    path('rental_booking_rejected/<id>', views.rental_booking_rejected),



]
