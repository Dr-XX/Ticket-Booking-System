# -*- coding: utf-8 -*-
from ticket.models import Station
from ticket.models import Route
from ticket.models import Line
from ticket.models import Through


def init_stations():
    Station(name=u'上海虹桥').save()
    Station(name=u'苏州北').save()
    Station(name=u'镇江南').save()
    Station(name=u'南京南').save()
    Station(name=u'徐州东').save()
    Station(name=u'泰安').save()
    Station(name=u'济南西').save()
    Station(name=u'天津南').save()
    Station(name=u'北京南').save()
    Station(name=u'常州北').save()
    Station(name=u'宿州东').save()
    Station(name=u'枣庄').save()


def init_line():
    Line(name=u'G106',num=9).save()
    Line(name=u'G102', num=9).save()


def init_through():
    l1 = Line.objects.get(id = 1)
    l2 = Line.objects.get(id=2)
    Through(station_id=Station.objects.get(id = 1), line_id=l1,ETA='06:39', ETD='06:39', order=1).save()
    Through(station_id=Station.objects.get(id = 2), line_id=l1,  ETA='07:02', ETD='07:04', order=2 ).save()
    Through(station_id=Station.objects.get(id = 3), line_id=l1,  ETA='07:26', ETD='07:28', order=3 ).save()
    Through(station_id=Station.objects.get(id = 4), line_id=l1,  ETA='08:01', ETD='08:03', order=4 ).save()
    Through(station_id=Station.objects.get(id = 5), line_id=l1,  ETA='09:03', ETD='09:08', order=5 ).save()
    Through(station_id=Station.objects.get(id = 6), line_id=l1, ETA='09:40', ETD='09:46',  order=6).save()
    Through(station_id=Station.objects.get(id = 7), line_id=l1,  ETA='10:36', ETD='10:39', order=7 ).save()
    Through(station_id=Station.objects.get(id = 8), line_id=l1,  ETA='11:42', ETD='11:44', order=8 ).save()
    Through(station_id=Station.objects.get(id = 9), line_id=l1,  ETA='12:18', ETD='12:18', order=9).save()

    Through(station_id=Station.objects.get(id = 1), line_id=l2, ETA='06:39', ETD='06:39', order=1).save()
    Through(station_id=Station.objects.get(id = 2), line_id=l2,  ETA='07:02', ETD='07:04', order=2).save()
    Through(station_id=Station.objects.get(id = 10), line_id=l2, ETA='07:26', ETD='07:28', order=3).save()
    Through(station_id=Station.objects.get(id = 4), line_id=l2,  ETA='08:01', ETD='08:03', order=4).save()
    Through(station_id=Station.objects.get(id = 11), line_id=l2, ETA='09:03', ETD='09:08', order=5).save()
    Through(station_id=Station.objects.get(id = 12), line_id=l2, ETA='09:40', ETD='09:46', order=6).save()
    Through(station_id=Station.objects.get(id = 7), line_id=l2,  ETA='10:36', ETD='10:39', order=7).save()
    Through(station_id=Station.objects.get(id = 8), line_id=l2,  ETA='11:42', ETD='11:44', order=8).save()
    Through(station_id=Station.objects.get(id = 9), line_id=l2,  ETA='12:18', ETD='12:18', order=9).save()


def init_route():
    stations = [1,2,3,4,5,6,7,8,9]
    stations2 = [1,2,10,4,11,12,7,8,9]
    pri = [0, 34.5, 104.5, 134.5, 279, 374, 398.5, 508.5, 553]
    pri2 = [0,34.5,74.5,134.5,254.0,309.0,398.5,508.5,553.0]
    for i in range(9):
        for j in range(i):
            Route(departure_id=(Station.objects.get(pre =j + 1)),destination_id=(Station.objects.get(pro = i + 1)),price=(pri[i] - pri[j]),).save(using='kingsTicket')


if __name__ == '__main__':
    #Route.objects.all().delete()
    pass