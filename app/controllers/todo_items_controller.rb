class TodoItemsController < ApplicationController

	before_action  :set_todo_list

	def new
		@todo_item = @todo_list.todo_items.new
	end

	def show
	end

	def create
		@todo_item = @todo_list.todo_items.build(todo_item_params)
		if @todo_list.save
			flash[:success] = "You have added a todo item"
			redirect_to @todo_list
		else
			flash[:error] = "Todo Item has not saved "
			redirect_to @todo_list
		end
	end


	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])
		if @todo_item.destroy
			flash[:success] = "Todo item successfully deleted"
		else 
			flash[:error] = "Todo item not deleted"
		end
		redirect_to @todo_list
	end




	private




	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end





end
