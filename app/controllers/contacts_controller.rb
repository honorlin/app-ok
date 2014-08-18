class ContactsController < ApplicationController
	before_action :find_agent

  def index
  	@contacts = @agent.contacts.all
  end

  def new
  	@contact = @agent.contacts.new
  end

  def show
  	@contact = @agent.contacts.find(params[:id])
  end

  def edit
		@contact = @agent.contacts.find(params[:id])
  end

  def update
  	@contact = @agent.contacts.find(params[:id])

  	if @contact.update_attributes(contacts_params)
  		flash[:warning] = "Success!"
  		redirect_to agent_contacts_path(@agent)
  	else
  		flash[:warning] = "Fail!:#{@contact.errors.full_messages}"
  		render :edit
  	end
  end

  def create
  	@contact = @agent.contacts.new(contacts_params)

  	if @contact.save
  		flash[:warning] = "Success!"
  		redirect_to agent_contacts_path(@agent)
  	else
  		flash[:warning] = "Fail!#{@contact.errors.full_messages}"
  		render :new
  	end
  end

  def destroy
  	@contact = @agent.contacts.find(params[:id])
  	@contact.destroy
  	redirect_to agent_contacts_path(@agent)
  end

private

	def find_agent
		@agent = Agent.find(params[:agent_id])
	end

	def contacts_params
		params.require(:contact).permit(:name, :email)		
	end

end
