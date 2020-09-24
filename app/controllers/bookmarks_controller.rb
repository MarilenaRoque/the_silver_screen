class BookmarksController < ApplicationController
  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.includes(:article)
  end

  # POST /bookmarks
  def create
    @bookmark = current_user.bookmarks.build(article_id: params[:article_id])
    respond_to do |format|
      if @bookmark.save
        format.html do
          redirect_to category_path(params[:category_id]),
                      notice: 'Bookmark was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(article_id: params[:article_id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to category_path(params[:category_id]), notice: 'Bookmark was successfully destroyed.' }
    end
  end

  private


  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:user_id, :article_id)
  end
end
