class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :delete]
  before_action :set_service, only: [:show, :index]
  layout "new_layout"

  def set_service
    @services = Service.all[0..2]
  end

  # GET /articles
  # GET /articles.json
  def index
    q = params["query"]
    
    @articles = Article.search(q).records.all if q
    @articles = @articles || Article.all

    id = params[:category_id]
    @articles = @articles.with_category(id) if id

    page = params[:page] || 1
    @articles = @articles.page(page).per(6) 

    s = params[:sort]
    case s
    when "views"
      @articles = @articles.order("view_counter ASC")      
    when "new"
      @articles = @articles.order("created_at ASC")
    when "old"
      @articles = @articles.order("created_at DESC")
    when "time_less"
      @articles = @articles.order("reading_time ASC")
    when "time_more" 
      @articles = @articles.order("reading_time DESC")
    end

    tag = params[:tag_name]
    if tag
      @articles = @articles.where("tags like '%#{tag}%'")
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @courses = Course.first(3)
    @latest = Article.latest(@article.id)
    @news = @article.latest
    @article.increment!(:view_counter)
  end

  # GET /articles/new
  def new
    @article = Article.new
    render :new, layout: "application"
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def delete
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      attrs = params.require(:article).permit(:title, :body, :description, :reading_time, :cathegory_id, :style, :tags, :image)
      attrs[:tags] = attrs[:tags].split(" ")
      attrs 
    end
end
