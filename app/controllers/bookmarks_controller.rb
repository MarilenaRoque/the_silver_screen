class BookmarksController < ApplicationController

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.includes(:article)
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
     @bookmark = current_user.bookmarks.build(article_id: params[:article_id])
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = current_user.bookmarks.build(article_id: params[:article_id])
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to category_path(params[:category_id]), notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
        
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = current_user.bookmarks.find_by(article_id: params[:article_id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to category_path(params[:category_id]), notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :article_id)
    end
end
