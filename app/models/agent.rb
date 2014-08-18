class Agent < ActiveRecord::Base
	has_many :contacts
	after_create :create_default_contact

	validates :name, presence: true
	validates :tel, presence: true

	def create_default_contact
		self.contacts.create({ :name => "default_contact:Andy", :email => "andy@gmail.com" })
	end
end

