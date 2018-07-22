class TweetsController < ApplicationController

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/create_tweet'
    else
      redirect to "/login"
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'/tweets/show_tweet'
    else
      redirect to "/login"
    end
  end

  get '/tweets' do
    if logged_in?
      @user = current_user
      @tweets = Tweet.all
      erb :'/tweets/tweets'
    else
      redirect to "/login"
    end
  end

  post '/tweets' do
    if logged_in?
      if params[:tweet][:content] != ""
        @tweet = Tweet.create(params[:tweet])
        @tweet.save
        redirect to "/tweets/#{@tweet.id}"
      else
        redirect to "/tweets/new"
      end
    else
      redirect to "/login"
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        erb :'/tweets/edit_tweet'
      else
        redirect to "/tweets"
      end
    else
      redirect to "/login"
    end
  end

  patch '/tweets/:id' do
    if logged_in?
      if params[:tweet][:content] != ""
        @tweet = Tweet.find_by_id(params[:id])
        @tweet.update(params[:tweet])
        @tweet.save
        redirect to "/tweets/#{@tweet.id}"
      else
        redirect to "/tweets/#{params[:id]}/edit"
      end
    else
      redirect to "/login"
    end
  end

  delete '/tweets/:id/delete' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        @tweet.delete
      end
      redirect to "/tweets"
    else
      redirect to "/login"
    end
  end

end
