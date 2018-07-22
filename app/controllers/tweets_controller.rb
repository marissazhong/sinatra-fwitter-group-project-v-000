class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'/tweets/new'
  end

  get '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :'/tweets/show'
  end

  get '/tweets' do
    @tweets = Tweet.all
    erb :'/tweets/tweets'
  end

  post '/tweets' do
    @tweet = Tweet.create(params[:tweet])
    @tweet.save
    redirect to "/tweets/#{tweet.id}"
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.create(params[:tweet])
    
  end

end
