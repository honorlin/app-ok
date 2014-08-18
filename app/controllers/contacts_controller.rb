class ContactsController < ApplicationController
  def index
  	@contacts = Agent.find(params[:agent_id]).contacts.all
  end

  def new
  	@contact = Contact.new
  	
  end

  def show
  end

  def edit
  end


end
