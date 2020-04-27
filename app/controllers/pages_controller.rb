class PagesController < ApplicationController
  before_action :authenticate_user!, except: ['tmp']
	layout "main", only: [:main]
	
	def main
	  @client = Client.new
	  @services = Service.all[0..2]
	end

	def about
		@problems = Article.first(12)
		@services = Service.all[0..2]
		@reviews = Review.first(3)
	end

	def consultation

	end

  def contacts
    @client = Client.new
    @services = Service.all[0..2]
  end

  def education
  	@courses = Course.all.reverse
  end

  def faq
    @courses = Course.first(3)
    @news = Article.last(3)
  end

  def contract

  end

  def services
    @services = Service.all
  end

  def work_with
  	@problems = Article.all.order(:id => "ASC")[0..11]
  end

  def methods
    @problems = Article.where(id: (23..28).to_a).order(:id => "ASC")
  end

  def reviews
  	@reviews = Review.all
  end

  def tests
  	
  end

  def tmp
    @hide_menu = true
  end

  def text; end
  def make_order; end
  def new_menu; end

end
