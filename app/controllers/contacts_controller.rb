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
  	@contact.update_attributes(contacts_params)
  	redirect_to agent_contacts_path(@agent)
  end

  def create
  	@agent.contacts.create(contacts_params)
  	redirect_to agent_contacts_path(@agent)
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
