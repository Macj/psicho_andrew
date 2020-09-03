class NewController < ApplicationController
  layout "new_layout", only: [:main]
  
  def main
    @client = Client.new
  end
   
end
