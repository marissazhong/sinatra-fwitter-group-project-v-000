class TweetsController < ApplicationController

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
      redirect to "/login"
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'/tweets/show'
    else
      redirect to "/login"
    end
  end

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect to "/login"
    end
  end

  post '/tweets' do
    if logged_in?
      @tweet = Tweet.create(params[:tweet])
      @tweet.save
      redirect to "/tweets/#{tweet.id}"
    else
      redirect to "/login"
    end
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.create(params[:tweet])
    erb :'/tweets/edit_tweet'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.create(params[:tweet])
    @tweet.update(params[:tweet])
    @tweet.save
    redirect to "/tweets/#{tweet.id}"
  end

  delete '/tweets/:id/delete' do

  end

end
