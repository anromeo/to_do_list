class TodosController < ApplicationController
  before_filter :find_list

  # GET /todos
  # GET /todos.json
  def index
    @todos = @list.todos.all
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = @list.todos.find(params[:id])
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = @list.todos.build
  end

  # GET /todos/1/edit
  def edit
    @todo = @list.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = @list.todos.build(params[:todo])

    if @todo.save
      flash[:notice] = 'To do was successfully created.'
      redirect_to list_path(@list)
    else
      flash[:notice] = "To do was not created."
      render :action => "new"
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = @list.todos.find(params[:id])

      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'To do was successfully updated.'
        redirect_to list_path(@list)
      else
        flash[:alert] = "To do was not updated."
        render :action => "edit"
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = @list.todos.find(params[:id])
    @todo.destroy

    flash[:notice] = "The to do was destroyed."
    redirect_to @list
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end
end