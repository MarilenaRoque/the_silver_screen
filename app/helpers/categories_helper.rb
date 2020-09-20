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
			"Write the first Article for #{c.name
			} Category"
		else
			a.title
		end
	end

	def article_last(c)
		c.articles.last
	end

	def most_voted_partial
		@most_voted_article = Article.last ###### Need to change this with the new feature
		if !@most_voted_article.nil?
			(render 'main_article', :most_voted => @most_voted_article).html_safe
		else
			(render partial: 'main_default').html_safe
		end
	end

	def order(i)
		if (i % 4) >= 2 then
			'order-1' 
		else
			'order-2'
		end
	end
end