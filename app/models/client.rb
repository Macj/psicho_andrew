class Client < ActiveRecord::Base
	has_many :requests

	validates :name, :presence => true
	validates :phone, :presence => true
end
