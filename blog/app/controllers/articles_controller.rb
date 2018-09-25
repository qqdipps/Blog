class ArticlesController < ApplicationController

	def show 
		@article = Article.find(params[:id])
	end
	def new
	end


	def create
	# Ruby secuirity (strong parameters)  (params[:article]) does not work  
	# @article = Article.new(params.require[:article].permit(:title,:text))
	  @article = Article.new(article_params)

	  @article.save
	  redirect_to @article
	end


	#Refactor for reuse and set private to avoid unintended use.
	private 
	def article_params
		params.require(:article).permit(:title, :text)
	end
end