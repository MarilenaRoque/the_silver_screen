module CategoriesHelper
	def last_article_image(c)
		if (c.articles.last.nil? || c.articles.last.image.nil?)
			image_url('default.jpg')
		else
			url_for(c.articles.last.image)
		end
	end
	

end