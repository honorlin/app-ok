class AgentsController < ApplicationController
  def index
  	@agents = Agent.all
  end

  def show
  	@agent = Agent.find(params[:id])
  	@contacts = @agent.contacts.all

  end

  def new
  	@agent = Agent.new
  end

  def create
  	@agent = Agent.new(agent_params)
  	if @agent.save
  		flash[:warning] = "Success!"
  		redirect_to agents_path
  	else
  		flash[:warning] = "Fail!:#{@agent.errors.full_messages}"
  		render :new
  	end

  end

  def edit
  	@agent = Agent.find(params[:id])
  end

  def update
  	@agent = Agent.find(params[:id])
  	
  	if @agent.update_attributes(agent_params)
  		flash[:warning] = "Success!"
  		redirect_to agents_path
  	else	
  		flash[:warning] = "Fail!:#{@agent.errors.full_messages}"
  		render :edit
  	end 

  end

  def destroy
  	@agent = Agent.find(params[:id])
  	@agent.destroy
  	redirect_to agents_path
  end

private

	def agent_params
		params.require("agent").permit(:name, :tel)
	end

end
