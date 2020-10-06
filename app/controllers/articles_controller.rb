class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def new
    @categories = Category.all
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  def show; end

  # POST /articles
  def create
    @categories = Category.all
    @article = current_user.articles.new(article_params)
    unless @article.image.attached?
      @article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.jpg')),
                            filename: 'default.jpg',
                            content_type: 'image/jpg')
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, categories_list: [])
  end
end
