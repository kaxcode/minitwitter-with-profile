class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /tweets
  def index
    @tweets = Tweet.all.order("created_at DESC").where("text LIKE ?", "%#{params[:search]}%")
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_name = current_user.email

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # likes/hearts feature
  def like
    @tweet = Tweet.find(params[:id])
    if @tweet.not_hearted_already?(current_user)
      @tweet.hearts.create(user: current_user)
      redirect_to tweets_path
    else
      @tweet.hearts.where(user: current_user).delete_all
      redirect_to tweets_path
    end

  end

  private
    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:text, :user_name)
    end
end
