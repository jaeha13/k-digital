from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse

def from1(request) :
   action = request.GET.get('action', 'one')
   result = None
   if action =='two' :
        print("redirect to /redirectapp/resultpage/")
        result = redirect('/redirectapp/resultpage/')
   elif action == 'three' :
        print("redirect to http://localhost:8000/redirectapp/resultpage/")
        result = redirect('http://localhost:8000/redirectapp/resultpage/')
   else :
        print("redirect to to1")
        result = redirect('to1')
   return result

def from2(request) :
   action = request.GET.get('action', 'one')
   result = None
   if action =='two':
        print("redirect to /redirectapp/resultpage/?q=two!! ㅋㅋㅋ")
        result = redirect('/redirectapp/resultpage/?q=two!! ㅋㅋㅋ')
   elif action == 'three':
        print("redirect to http://localhost:8000/redirectapp/resultpage/?q=three!! ㅋㅋㅋ")
        result = redirect('http://localhost:8000/redirectapp/resultpage/?q=three!! ㅋㅋㅋ')
   else :
        print("redirect to to2")
        result = redirect('to2', data1="100", data2="200")
   return result


def to1(request):
    msg = "<h1>redirect가 잘 되었네용!!</h1>"
    q = request.GET.get("q")
    if q:
        msg += "<h2>q="+q+"도 전달되었고요..</h2>"
    return HttpResponse(msg)


def to2(request, data1, data2) :
    return HttpResponse("<h1>" + data1 + " : " + data2 +"</h1>")


