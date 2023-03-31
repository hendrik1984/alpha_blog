class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        # redirect_to article_path(@article) # commonly use
        redirect_to @article # shortcut
        # render plain: @article.inspect
        
    end

    private

    # def article_params
    #     params.require(:article).permit(:title, :description)
    # end
    

end