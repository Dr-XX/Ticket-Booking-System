"""kingsTicket URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')

Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')

Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from kingsTicket.views import *
from ticket.views import *

urlpatterns = [
    url(r'^admin/$', admin.site.urls),
    url(r'^hello/$', hello),
    url(r'^find', find_out_line),
    url(r'^buy_ticket', buy_ticket),
    url(r'^search_line',search_line),
    url(r'^sign_in', sign_in),
    url(r'^my_first', my_first),
    url(r'^show_order', show_order),
    url(r'^ticket_out', ticket_out),
    url(r'^sign_up', sign_up),
    url(r'^affirm',affirm),
    url(r'^order',order),
    url(r'^', main_page),

]
