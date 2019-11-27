class Client < ActiveRecord::Base
	has_many :requests

	validates :name, :presence => true
	validates :email, :presence => true
	validates :phone, :presence => true
end
