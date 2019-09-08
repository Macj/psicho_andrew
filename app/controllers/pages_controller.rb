class PagesController < ApplicationController
	layout "main", only: [:main]
	
	def main
	  @client = Client.new
	end

	def about

	end

	def consultation

	end

  def education

  end

  def tests
  	
  end

end
