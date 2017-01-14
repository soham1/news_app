class NewsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @news = News.all
    end

    def new
        @news = current_user.news.build
    end

    def edit
        @news = News.find(params[:id])
    end

    def show
        @news = News.find(params[:id])
    end

    def create
        @news = current_user.news.build(news_params)

        @news.save
        redirect_to @news
    end

    def update
        @news = News.find(params[:id])
        
        if @news.update(news_params)
            redirect_to @news
        else
            render 'edit'
        end
    end

    
    def destroy
        @news = News.find(params[:id])
        @news.destroy
        
        redirect_to news_index_path
    end

    private
        def news_params
            params.require(:news).permit(:title, :summary, :text, :date, :online)
        end
end
