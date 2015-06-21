class  PicturesController < ApplicationController

  before_action :set_category_list
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy]

  def index
    @pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first(8) }
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    if current_user
      @picture = current_user.pictures.new(pictures_params)
    else
      @picture = Picture.new(pictures_params)
    end

    respond_to do |format|
      @picture.save
      format.html { redirect_to pictures_path }
      format.js
    end
  end

  def show_category
    if @category_list.include? params[:category]
      @pictures = Picture.order(created_at: :desc).where("category = ?", Picture.categories[params[:category]])
    else
      redirect_to pictures_path, alert: 'The page you requested does not exist!'
    end
  end

  def upload
    @picture = Picture.new
    @category = 'wedding'
  end


  private

  def set_category_list
    @category_list = Picture.categories
  end

  def pictures_params
    params.require(:picture).permit(:category, :title, :photo)
  end

end
