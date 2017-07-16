# -*- coding: utf-8 -*-
from __future__ import print_function
from django.http import HttpResponse
from django.http import Http404
import datetime
from django.utils import timezone
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from ticket.models import *
from django.db import connection
import random
import time
import hashlib


def hello(request):
    return HttpResponse(request)


def main_page(request):
    return render_to_response('main_page.html',locals())


def sign_in(request):
    return render_to_response('sign_in.html',locals())


def sign_up(request):
    return render_to_response('sign_up.html',locals())


def affirm(request):
    inputemail = request.POST['inputEmail']
    inputname = request.POST['inputName']
    inputpassword = request.POST['inputPassword']
    confirmpassword = request.POST['confirmPassword']
    request.session['username'] = inputname
    request.session['inputemail'] = inputemail
    username = inputname
    msg = ''
    q = User.objects.filter(email=inputemail)
    if inputpassword != confirmpassword :
        msg = '两次输入的密码不同！'
    elif inputemail == '':
        msg = '邮箱不能为空！'
    elif inputname == '':
        msg = '用户名不能为空！'
    elif inputpassword == '':
        msg = '密码不能为空！'
    elif confirmpassword == '':
        msg = '请确认密码！'
    elif len(inputpassword) < 4:
        msg = '密码至少4位！'
    elif len(q) != 0:
        msg = '该邮箱已被注册！'

    if msg == '':
        p1 = User(nickname=inputname, password=inputpassword, email=inputemail)
        p1.save()
        return render_to_response('my_first.html',locals())
    else :
        return render_to_response('sign_up.html',locals())


def my_first(request):
    inputemail = request.POST['inputEmail']
    print (inputemail)
    inputpassword = request.POST['inputPassword']
    request.session['inputemail'] = inputemail
    q = User.objects.filter(email=inputemail, password=inputpassword)
    msg = ''
    if len(q) == 0:
        msg = '邮箱与密码不匹配！'
        return render_to_response('sign_in.html', locals())
    else:
        username = User.objects.get(email=inputemail, password=inputpassword).nickname
        request.session['username'] = username
        return render_to_response('my_first.html', locals())


def search_line(request):
    print("search_line")
    lenth = 0
    inputemail = request.session['inputemail']
    username = request.session['username']
    return render_to_response('search_line.html',locals())


def find_out_line(request):
    inputemail = request.session['inputemail']
    username = request.session['username']
    depature = request.POST['departure']
    destination = request.POST['destination']
    print (depature,destination)
    d1 = Station.objects.filter(name__contains=depature)
    d2 = Station.objects.filter(name__contains=destination)
    msg = ''
    if len(d1) == 0:
        msg = '出发地不存在！'
        return render_to_response('search_line.html',locals())
    elif len(d2) == 0:
        msg = '目的地不存在！'
        return render_to_response('search_line.html',locals())
    elif len(d1) > 1 or len(d2) >1:
        msg = '请输入更详细的出发地和目的地'
        return render_to_response('search_line.html', locals())
    else :
        table = []
        id1 = Station.objects.get(name__contains=depature).id
        id2 = Station.objects.get(name__contains=destination).id
        name1 = Station.objects.get(name__contains=depature).name
        name2 = Station.objects.get(name__contains=destination).name
        cursor = connection.cursor()
        cursor.callproc("search_line", (id1, id2))
        lenth = 0
        for row in cursor.fetchall():
            lenth += 1
        print (lenth)
        if lenth > 0 :
            table =  [dict(line_id=row[0], line_name = row[4],ETD=str(row[1]),ETA = str(row[2]),span = str(row[3])) for row in cursor]
            cursor.close()
            cursor2 = connection.cursor()
            cursor2.callproc("get_price", (id1, id2))
            price = cursor2.fetchone()
            price = int(price[0])
            highprice = price * 1.5
            cursor2.close()
        else :
            cursor.close()
        connection.close()
        return render_to_response('search_line.html',locals())


def buy_ticket(request):
    inputemail = request.session['inputemail']
    print (inputemail,)
    username = request.session['username']
    line_id =request.POST['line_id']
    request.session['line_id'] =line_id
    id1 = request.POST['id1']
    request.session['id1'] = id1
    id2 = request.POST['id2']
    request.session['id2'] = id2
    print (line_id,request.session['line_id'])
    line_name = Line.objects.get(id=line_id).name
    name1 = Station.objects.get(id=id1).name
    name2 = Station.objects.get(id=id2).name
    return render_to_response('buy_ticket.html',locals())


def order(request):
    inputemail = request.session['inputemail']
    username = request.session['username']
    line_id = request.session['line_id']
    id1 = request.session['id1']
    id2 = request.session['id2']
    line_name = Line.objects.get(id=line_id).name
    name1 = Station.objects.get(id=id1).name
    name2 = Station.objects.get(id=id2).name
    names = request.POST.getlist('personName', [])
    IDs = request.POST.getlist('personID', [])
    isStus = request.POST.getlist('isStu', [])
    isLevel1 = request.POST.getlist('isLevel1', [])
    lenth = len(names)
    isStuBool = []
    isLevel1Bool = []
    price = []
    car = []
    isStuBool = [0 for i in range(lenth)]
    isLevel1Bool = [0 for i in range(lenth)]
    cursor = connection.cursor()
    cursor.callproc("get_price", ( id1, id2))
    base_price = cursor.fetchone()
    base_price = int(base_price[0])
    price = [base_price for i in range(lenth)]
    car = [2 for i in range(lenth)]
    for i in range(lenth) :
        if str(i+1) in isStus:
            isStuBool[i] = 1
            price[i] *= 0.75
        if str(i+1) in isLevel1:
            isLevel1Bool[i] = 1
            price[i] *= 1.5
            car[i] = 1
    print(price)
    '''cursor = connection.cursor()
    cursor.callproc("seat_lv", (line_id, id1, id2, 1))
    lv1 = []
    for row in cursor.fetchall():
        lv1.append(row[0])
    cursor.close()
    lv1_cnt = len(lv1)
    print(lv1)
    cursor2 = connection.cursor()
    cursor2.callproc("seat_lv", (line_id, id1, id2, 2))
    lv2 = []
    for row in cursor.fetchall():
        lv2.append(row[0])
    cursor2.close()
    lv2_cnt = len(lv2)
    print(lv2)'''
    request.session['car'] = car
    request.session['price'] = price
    request.session['lenth'] = lenth
    request.session['names'] = names
    request.session['IDs'] = IDs
    request.session['isStus'] = isStuBool
    request.session['isLevel1'] = isLevel1Bool
    tot_info = [dict(name=names[i], ID = IDs[i],isStu=isStuBool[i],isLevel1 = isLevel1Bool[i],price = price[i],car = car[i]) for i in range(lenth)]
    return render_to_response('show_order.html', locals())


def show_order(request):
    return render_to_response('show_order.html', locals())


def ticket_out(request):
    # 在这个函数把订单和车票插入数据库

    # 都需要的信息：用户id，线路id，route id
    inputemail = request.session['inputemail']
    username = request.session['username']
    user_id = User.objects.get(email=inputemail).id
    line_id = request.session['line_id']
    id1 = request.session['id1']
    id2 = request.session['id2']
    lenth = request.session['lenth']
    cursor = connection.cursor()
    cursor.callproc("search_route", (id1, id2))
    route = cursor.fetchone()
    route_id = route[0]
    cursor.close()
    print(route_id)
    d1 = Station.objects.get(id = id1)
    d2 = Station.objects.get(id = id2)
    l1 = Line.objects.get(id = line_id)  # line对象
    # r1 = Route.objects.raw("select * from ticket_route WHERE id = %s",[route_id])
    #print (r1)
    #以下为车票信息
    names = request.session['names']
    IDs = request.session['IDs']
    isStus = request.session['isStus']

    #车座信息
    isLevel1 = request.session['isLevel1']
    car = request.session['car']
    random.seed()
    seat = []
    temp = random.randint(1, 20)
    seat = [temp + i for i in range(lenth)]


    #以下为显示用信息，插入时不用
    name1 = Station.objects.get(id=id1).name
    name2 = Station.objects.get(id=id2).name
    price = request.session['price']


    #插入订单：
    p1 = Order(time=datetime.datetime.now(),status=0)
    p1.save()
    order_id = p1.id
    print (order_id)
    u1 = User.objects.get(id=user_id)
    p1.user_id.add(u1)
    #插入订单完成

    #获得座位信息
    st = []
    for i in range(lenth):
        st.append(Seat.objects.raw("select id from ticket_seat WHERE car = %s AND num = %s AND line_id = %s",[car[i],seat[i],line_id]))
    seat_ids = []
    for sts in st :
        for i in sts:
            seat_ids.append(i.id)
    #print ("seat_id"+seat_id)
    #插入车票

    cursor = connection.cursor()
    for i in range(lenth):
        cursor.execute(
            "INSERT INTO ticket_ticket(id_number, name, is_stu, line_id, route_id, seat_id) VALUES (%s,%s,%s,%s,%s,%s);", [IDs[i], names[i], isStus[i], line_id, route_id, seat_ids[i]])
    #插入车票完成
    cursor.close()
    #cursor.lastrowid
    tot_info = [dict(name=names[i], ID=IDs[i], isStu=isStus[i], isLevel1=isLevel1[i],price=price[i], car=car[i],seat=seat[i]) for i in range(lenth)]

    return render_to_response('ticket_out.html', locals())










