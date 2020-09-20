class VotesController < ApplicationController
    def new
        @vote = current_user.votes.build(article_id: params[:article_id])
    end
    
    def create
       @vote = current_user.votes.build(article_id: params[:article_id])
       redirect_to '/categories' if @vote.save
    end

    def destroy
        @vote = current_user.votes.find_by(article_id: params[:article_id])
        redirect_to '/categories' if @vote.destroy
    end
end
