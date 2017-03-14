class UnityController < ApplicationController
    #
    
    
    def houseName
        @name = House.first.name
        render :layout => false
    end
    
    def houseNameUpdate
        @house = House.first
        @oldName = @house.name
        @newName = ""
        if @newName = params[:name]
            @house.name = @newName
            @house.save
        end
        render :layout => false
    end
    
    def username
        @name = "Not Logged In"
        
        if current_user
            @name = current_user.first_name + " " + current_user.last_name
        end
        
        
        render :layout => false
    end
    
    
    def currentH
        @house = "None Selected"
        
        if session[:current_house]
            @hosue = session[:current_house]
        end
        
        render :layout => false
    end
    
    
    
    def highscore
        
        @score = House.first.score
        render :layout => false
    end
    
    def highscoreUpdate
        @house = House.first
        @oldScore = @house.score
        @newScore = ""
        puts "GOT HOUSE"
        if @newScore = params[:score]
            @house.score = @newScore
            @house.save
        end
    end
    
    def optionsJSON
        @house = House.first
        @options = @house.options
        #@options = Option.all
        @first = Option.last
        
        if params[:brace] == "1"
            @braces = true
        end
        
        render :layout => false
    end
    
    def gameStarter
        @house = House.find(params[:id])
        session[:house_id] = @house.id
        #redirect_to gameTester_path
        redirect_to '/unitywebbuild/index.html'
    end
    
    def gameTester
        @house = House.find(session[:house_id])
        @types = Option.getTypes
        @user = current_user
        
        
        @availableOptions = @house.options
        @availableTypeNames = @house.options.collect { |x| x.category }.uniq
        @typeAvailable = Hash.new
        
        @availableTypeNames.each do |t|
           
           @typeAvailable[t] = @availableOptions.where(category: t)
            
        end
        
        if current_user.buyer?
            @selected = @user.selected_options.collect { |o| o.category}.uniq
            @typeChoice = @selected.collect{ |t| [t, @user.selected_options.find_by(category: t).name] }
        end
    end
    
    def updateChoices
        @house = House.find(session[:house_id])
        @availableOptions = @house.options
        @availableTypeNames = @house.options.collect { |x| x.category }.uniq
        @user = current_user
        
        @newSelections = []
        
        params.each do |p, v|
            if @availableTypeNames.include?(p)
                @user.selected_options.clear
                #puts "Time to update the #{p} option to: #{Option.find(v).name}"
                @newSelections.push(Option.find(v))
                
            end
        end
        
        puts @newSelections
        @user.selected_options << @newSelections
        
        redirect_to gameTester_path
    end
        
        
        
    def gameData
        @response = ""
        
        if @request = params[:request]
            current_user ? @user = current_user : @user = User.find(5)
            
            
            case @request
                when "username"
                    @response = @user.first_name + " " + @user.last_name
                when "user"
                    if params[:id] && User.exists?(params[:id])
                        @user = User.find(params[:id].to_s)
                    end
                
                when "house"
                    
                    if params[:id] && House.exists?(params[:id])
                        @house = House.find(params[:id].to_s)
                    else
                        if session[:house_id]
                            @house = House.find(session[:house_id])
                        else
                            @house = House.find(1)
                        end
                    end
                    
                when "option"
                    @option = House.find(session[:house_id]).options.first
                    if params[:id] && Option.exists?(params[:id])
                        @option = Option.find(params[:id].to_s)
                    end
                    
                when "options"
                    if session[:house_id]
                        @house = House.find(session[:house_id])
                    else
                        @house = House.find(1)
                    end
                    
                    @options = @house.options
                    
                    if params[:house] && House.exists?(params[:house].to_s)
                        @options = House.find(params[:house].to_s).options
                    end
                    if params[:category]
                        @options = @options.where(category: params[:category])
                    end
                    if params[:selectedOptions]
                         if current_user && current_user.buyer?
                            @user = current_user
                        else
                            @user = User.find(5)
                        end
                        @options = @user.selected_options
                    end
                    
                when "house_id"
                    @response = session[:house_id]
                    
                when "availableOptions"
                    @options = House.find(session[:house_id]).options
                    @names = @options.collect { |x| x.category }.uniq
                
                        
            end
           
        elsif @update = params[:update]
            
            if current_user && current_user.buyer?
                @user = current_user
            else
                @user = User.find(5)
            end
            
            case @update
            
                when "selectedOptions"
                    if @list = params[:list]
                        @idArray = @list.split(',')
                        
                        @user.selected_options.clear
                        @idArray.each do |id|
                            @user.selected_options << Option.find(id)
                            
                        end
                        
                    end
            end
        
        
        end
        
        render :layout => false
    end
    
    
        
        
end
