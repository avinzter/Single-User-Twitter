class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.order('id DESC')
  	@tweet = Tweet.new
  end #Automatically load app/views/tweets/index.html.erb

  def create
  	@tweet = Tweet.new(params[:tweet])

  	if @tweet.save

  		flash[:success] = "Your tweet was successfully posted."

  		#If our validates, then redirect.
  		redirect_to :action => :index
  	else

  		flash.now[:error] = "Sorry, all tweets must be from 1 to 140 character length"

  		@tweets = Tweet.order('id DESC') 
  		render :action => :index
  	end

  end # No associated view is load, we either redirect or render.
end
