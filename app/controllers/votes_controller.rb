class VotesController < ApplicationController
  def new
    @vote = current_user.votes.build(article_id: params[:article_id])
  end

  def create
    @vote = current_user.votes.build(article_id: params[:article_id])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to category_path(params[:category_id]), notice: 'Vote was successfully created.' }
      else
        format.html { redirect_to category_path(params[:category_id]) }
      end
    end
  end

  def destroy
    @vote = current_user.votes.find_by(article_id: params[:article_id])
    respond_to do |format|
      if @vote.destroy
        format.html { redirect_to category_path(params[:category_id]), notice: 'Vote was successfully destroyed.' }
      else
        format.html { redirect_to category_path(params[:category_id]) }
      end
    end
  end
end
