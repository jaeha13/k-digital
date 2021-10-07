from django.shortcuts import render
from .models import Upload


def fileupload(request) :
    context = None
    if request.method == 'POST' :
        upload = Upload(title = request.POST['title'], content=request.POST['content'], photo=request.FILES['photo'])
        upload.save()
        context = {"upload" : upload}

    return render(request, "fileupload.html", context)
