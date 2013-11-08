class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.order('id DESC')
  	@tweet = Tweet.new
  end #Automatically load app/views/tweets/index.html.erb

  def create
  	@tweet = Tweet.new(params[:tweet])

  	if @tweet.save
  		#If our validates, then redirect.
  		redirect_to :action => :index
  	else
  		@tweets = Tweet.order('id DESC') 
  		render :action => :index
  	end

  end # No associated view is load, we either redirect or render.
end
