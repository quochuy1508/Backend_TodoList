class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]

  # GET /todos
  def index
    # get current user todos
    @todos = current_user.todos.order("id")
    json_response(@todos)
  end

  # POST /todos
  def create
    # create todos belonging to current user
    @todo = current_user.todos.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET todos/:id
  def show
    json_response(@todo)
  end

  # PUT todos/:id
  def update
    @todo.update!(todo_params)
    @todos = current_user.todos.order("id")
    json_response(@todos)
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :isPending, :isDoing, :isDone, :priority)
  end


  def set_todo
    @todo = Todo.find(params[:id])
  end
end
