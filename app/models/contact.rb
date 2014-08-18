class Contact < ActiveRecord::Base
	belongs_to :agent
	validates :name, presence: true
	validates :email, presence: true

end
