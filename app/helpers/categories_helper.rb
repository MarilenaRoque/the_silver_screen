module CategoriesHelper
	def last_article_image(c)
		a = article_last(c)
		if (a.nil?)
			image_url('default.jpg')
		else
			url_for(a.image)
		end
	end

	def last_article_title(c)
		a = article_last(c)
		if (a.nil?)
			"Write and Article for #{c.name
			} Category"
		else
			a.title
		end
	end

	def article_last(c)
		c.articles.last
	end
	

end