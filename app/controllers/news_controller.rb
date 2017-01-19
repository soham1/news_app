class NewsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :get_news, only: [:edit, :show, :update, :destroy]
    
    def index
        @news = News.order('date DESC, title')
    end

    def new
        @news = current_user.news.build
    end

    def edit
    end

    def show
    end

    def create
        @news = current_user.news.build(news_params)

        @news.save
        redirect_to @news
    end

    def update
        if @news.update(news_params)
            redirect_to @news
        else
            render 'edit'
        end
    end

    
    def destroy
        @news.destroy
        
        redirect_to news_index_path
    end

    private
        def get_news
            @news = News.find(params[:id])   
        end 

        def news_params
            params.require(:news).permit(:title, :summary, :text, :date, :online)
        end
end
