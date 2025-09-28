# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy, :toggle]
  before_action :set_user_name

  def index
    @todos = Todo.order(created_at: :desc)
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params.merge(user_name: @user_name))

    if @todo.save
      redirect_to todos_path, notice: 'Todo created!'
    else
      @todos = Todo.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # Turbo Frame handles the magic
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle
    @todo.update(completed: !@todo.completed)
    head :ok
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end

  def set_user_name
    @user_name = session[:user_name] ||= "User #{rand(1000..9999)}"
  end
end
