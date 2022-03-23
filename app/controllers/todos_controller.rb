class TodosController < ApplicationController

    def index
        @todos = Todo.all
    end
    def new
        @todo = Todo.new
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def create
        @todo = Todo.create(todo_params)
        
        if @todo.save
            redirect_to todo_path(@todo)
            flash[:notice] = "Todo was created successfully"
        else
            redirect_to  new_todo_path
            flash[:error] = @todo.errors.full_messages
        end  
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "Todo was updated successfully"
            redirect_to todo_path(@todo)
        else
            redirect_to edit_todo_path(@todo)
            flash[:error] = @todo.errors.full_messages
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = "Todo has been successfully deleted"
        redirect_to todos_path
    end


    private
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end