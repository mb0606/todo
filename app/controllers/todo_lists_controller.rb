class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end


  def show
  end

  def new
    @todo_list = TodoList.new
  end


  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)


      if @todo_list.save
        flash[:notice] = 'Todo list was successfully created.'
        redirect_to @todo_list
        
      else
        flash[:error] = 'Todo list was not created '
        render :new   
       
      end

  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    if @todo_list.destroy
      flash[:success]= 'Todo list was successfully destroyed.' 
    else 
      flash[:error] = "Did not delete"
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
