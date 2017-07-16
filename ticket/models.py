# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models


class Station(models.Model):
    name = models.CharField(max_length=20)


class Line(models.Model):
    name = models.CharField(max_length=10)
    num = models.IntegerField()


class User(models.Model):
    nickname = models.CharField(max_length=30)
    email = models.EmailField()
    password = models.CharField(max_length=30)

    def __unicode__(self):
        return self.nickname


class Through(models.Model):
    station_id = models.ForeignKey(Station)
    line_id = models.ForeignKey(Line)
    ETD = models.TimeField()
    ETA = models.TimeField()
    order = models.IntegerField()
###########################################################


class Route(models.Model):
    departure_id = models.ForeignKey(Station, related_name='pre')
    destination_id = models.ForeignKey(Station, related_name='pro')
    price = models.FloatField()


class Order(models.Model):
    time = models.TimeField()
    status = models.SmallIntegerField()
    user_id = models.ManyToManyField(User)


class Seat(models.Model):
    line_id = models.ForeignKey(Line)
    level = models.SmallIntegerField()  # 1,2
    num = models.IntegerField()  # 1:2*16*4;2:6*16*5
    status = models.IntegerField()


class Ticket(models.Model):
    id_number = models.CharField(max_length=18)
    name = models.CharField(max_length=20)
    is_stu = models.BooleanField()
    seat_id = models.ForeignKey(Seat)
    route_id = models.ForeignKey(Route)
    line_id = models.ForeignKey(Line)
    order_id = models.ManyToManyField(Order)


if __name__ == '__main__':
    pass

#
# class User(models.Model):
#     name = models.CharField(max_length=30)
#     password = models.CharField(max_length=30)
#     email = models.EmailField();
#
#     def __unicode__(self):
#         return u'%s' % self.name
#
#
# class Stations(models.Model):
#     name = models.CharField(max_length=30)
#     arrive_time = models.TimeField()
#     departure_time = models.TimeField()
#     price = models.IntegerField()
#
#     def __unicode__(self):
#         return u'%s' % self.name
#
#
# class Orders(models.Model):
#     time = models.TimeField()
#     status = models.IntegerField()
#     buyer = models.ForeignKey(User)
#     total_price = models.IntegerField()
#
#     def __unicode__(self):
#         return u'%s' % self.name
#
#
# class Seats(models.Model):
#     carriage_no = models.IntegerField()
#     line_no = models.IntegerField()
#     column_no = models.CharField(max_length=2)
#     status = models.IntegerField()
#
#     def __unicode__(self):
#          return u'%d %d %c' % (self.carriage_no, self.line_no, self.column_no)
#
#
# class Tickets(models.Model):
#     seat = models.ForeignKey(Seats)
#     id_number = models.CharField(max_length=20)
#     name = models.CharField(max_length=10)
#     start = models.ForeignKey(Stations, related_name='station_start')
#     departure = models.ForeignKey(Stations, related_name='station_end')
#     is_child = models.BooleanField()
#     level = models.IntegerField()
#     order = models.ForeignKey(Orders)
#     price = models.IntegerField()
#
#     def __unicode__(self):
#         return u'%s %d %d' % (self.name, self.start_id, self.departure_id)
#

