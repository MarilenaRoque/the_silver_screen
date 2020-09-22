module BookmarksHelper
  def bookmark_button(article)
    if !article.bookmarks.where(user_id: current_user.id).exists?
      link_to(image_tag('bookmark.svg', height: '32', width: '23'),
              bookmarks_path(article_id: article.id, category_id: @category.id),
              method: :post).html_safe
    else
      link_to(image_tag('unbookmark.svg', height: '32', width: '23'),
              bookmark_path(article_id: article.id, category_id: @category.id),
              method: :delete).html_safe
    end
  end
end
