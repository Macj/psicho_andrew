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

    @sort = params[:sort] || 'new'
    @category_id = params[:category_id] || 'new'

    case @sort
    when "views"
      @articles = @articles.order("view_counter DESC")
      @sort_text = 'популярности'      
    when "new"
      @articles = @articles.order("created_at DESC")
      @sort_text = 'дате - от самой новой'
    when "old"
      @articles = @articles.order("created_at ASC")
      @sort_text = 'дате - от самой старой'
    when "time_less"
      @articles = @articles.order("reading_time ASC")
      @sort_text = 'длительности чтения - от<br>наименьшей'
    when "time_more" 
      @articles = @articles.order("reading_time DESC")
      @sort_text = 'длительности чтения - от<br>наибольшей'
    end
    @sort_text = @sort_text.html_safe

    @category_id_text = 'Все статьи'

    case @category_id
    when "7"
      @category_id_text = 'Невроз и психосоматика'
    when "8"
      @category_id_text = 'Тревога'
    when "13"
      @category_id_text = 'Навязчивости (ОКР)'
    when "14"
      @category_id_text = 'Низкая самооценка'
    when "15"
      @category_id_text = 'Психотравмы'
    when "9"
      @category_id_text = 'Депрессия и уныние'
    when "11"
      @category_id_text = 'Панические атаки'
    when "2"
      @category_id_text = 'Психология отношений'
    when "3"
      @category_id_text = 'Общая психология'
    when "4"
      @category_id_text = 'Исследования'
    when "5"
      @category_id_text = 'Саморазвитие'
    when "6"
      @category_id_text = 'Для профи'
    end

    tag = params[:tag_name]
    if tag
      @articles = @articles.where("tags like '%#{tag}%'")
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @courses = Course.first(2)
    @popular = Article.popular(@article.id)
    @news = @article.latest
    @article.increment!(:view_counter)
  end

  # GET /articles/new
  def new
    @article = Article.new
    @article.make_content
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
      attrs = params.require(:article).permit(:reading_time, :cathegory_id, :style, :image_file_name, article_contents_attributes: [:id, :ln, :tags, :body, :description, :title])
      attrs[:article_contents_attributes].each do |key,val|
        val[:tags] = val[:tags]&.split(" ")
      end
      attrs 
    end
end
