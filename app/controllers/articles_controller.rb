class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all
      end
      def show
        @article = Article.find(params[:id])
      end
     def new
        @article= Article.new
     end

      def create 
        @article = Article.new(task_params)
        @article.save
        redirect_to article_path(@article)
      end
        def edit
            @article = Article.find(params[:id])
          end
        
          def update
            @article = Article.find(params[:id])
            @article.update(article_params)
        
            redirect_to article_path(@article)
          end
          def destroy
            @article.destroy
        
            # no need for app/views/restaurants/destroy.html.erb
         redirect_to articles_path
          end

private

def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
