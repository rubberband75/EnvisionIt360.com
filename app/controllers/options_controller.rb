class OptionsController < ApplicationController
    def index
        @options = Option.all
    end
    
    def show
        @option = Option.find(params[:id])
    end
    
    def new
        @option = Option.new
    end
    
    def create
        @option = Option.new(option_params)
        
        if @option.save
            redirect_to all_options_path
        else
            redirect_to "#"
        end
    end
    
    def edit
        @option = Option.find(params[:id])
    end
    
    def update
        @option = Option.find(params[:id])
        if @option.update(option_params)
            redirect_to all_options_path(@option)
        else
            redirect_to "#"
        end
    end
    
    def destroy
        @option = Option.find(params[:id])
        @option.destroy
        
        redirect_to all_options_path
    end
    
    private
    def option_params
        params.require(:option).permit(:name, :file, :category)
    end
    
    
end
