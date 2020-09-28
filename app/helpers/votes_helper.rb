module VotesHelper
  def vote_button(article)
    if !article.votes.where(user_id: current_user.id).exists?
      link_to(image_tag('vote.png', height: '32', width: '23', class: 'vote'),
              votes_path(article_id: article.id,
                         category_id: @category.id), method: :post).html_safe
    else
      link_to(image_tag('unvote.png', height: '32', width: '23', class: 'vote'),
              vote_path(article_id: article.id,
                        category_id: @category.id), method: :delete).html_safe
    end
  end
end
