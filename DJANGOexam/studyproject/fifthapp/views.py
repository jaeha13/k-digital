from django.shortcuts import render, redirect
from .models import Todo


def index(request):
    todos = Todo.objects.all()
    context = {'todos': todos}
    return render(request, 'fifthapptemplates/index.html', context)


def createTodo(request):
    user_input_str = request.POST['todoContent']
    new_todo = Todo(content=user_input_str)
    new_todo.save()
    return redirect("index")


def deleteTodo(request) :
    done_todo_id = request.GET['todoNum']
    todo = Todo.objects.get(id=done_todo_id)
    todo.delete()
    return redirect("index")
