class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            # redirect_to article_path(@article) # commonly use
            flash[:notice] = "Article was created succesffuly."
            redirect_to @article # shortcut
            # render plain: @article.inspect
        else
            # render :new, status: :unprocessable_entity
            render "new"
        end
    end

    private

    # def article_params
    #     params.require(:article).permit(:title, :description)
    # end
end