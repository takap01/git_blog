class TweetsController < ApplicationController
    
    before_action :move_to_index, except: :index
    
    def index 
        @tweet = Tweet.order("created_at DESC")
    end


    def new 
    end
    
    def create
        Tweet.create(name: tweet_params[:name], text: tweet_params[:text], user_id: current_user.id)
        # redirect_to('/tweets')
        flash[:notice] ="投稿が完了しました！！"
    end
    
    private
    def tweet_params
      params.permit(:name, :text)
    end
    
    def move_to_index 
        redirect_to action: :index unless user_signed_in?
    end
    
    
    
end
