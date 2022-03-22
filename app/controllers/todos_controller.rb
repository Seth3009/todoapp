class TodosController < ApplicationController

    def index
    end
    def new
        @todo = Todo.new
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def create
        @todo = Todo.create(todo_params)
        
            if @todo.save
                flash[:notice] ="Todo was successfully created"
                redirect_to todo_path(@todo)
            else 
                format.html { 
                flash[:errors] = @todo.errors.full_messages               
                redirect_to 'new'
                }
            end
        
    end


    private
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end