require 'httparty'
class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
    @article = Article.new
      query = params[:topic].gsub(/_/, "+")
        @data = HTTParty.get("https://newsapi.org/v2/everything?q=#{query}&pageSize=100&apiKey=#{ENV['NEWS_API_KEY']}")
        @data_articles = @data["articles"]
    @current_user = current_user
  end

  def show
    # @saved_articles = Article.find(params[:id])
    @articles = Article.all
    @current_user = current_user
    @article = Article.new
  @current_user = current_user
  end

  def create
    Article.create(article_params)
  end 

  private
  def article_params
    params[:article].permit(:title, :url, :user_id)
  end

end