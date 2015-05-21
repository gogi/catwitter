class TweetsController < ApplicationController
  expose(:tweet, attributes: :tweet_params)
  expose(:tweets)
  expose(:user)

  # GET /tweets
  # GET /tweets.json
  def index
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    tweet.user = current_user

    respond_to do |format|
      if tweet.save
        format.html { redirect_to tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: tweet }
      else
        format.html { render :new }
        format.json { render json: tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if tweet.save
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: tweet }
      else
        format.html { render :edit }
        format.json { render json: tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_path, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:text)
    end
end
