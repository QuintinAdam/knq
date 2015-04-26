class  PicturesController < ApplicationController

  before_action :set_category_list
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first(8) }
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(pictures_params)
    if @picture.save
      redirect_to pictures_path
    else
      redirect_to :back, notice: 'picture was not saved'
    end
  end

  def show_category
    if @category_list.include? params[:category]
      @pictures = Picture.order(created_at: :desc).where("category = ?", Picture.categories[params[:category]])
    else
      redirect_to pictures_path, alert: 'The page you requested does not exist!'
    end
  end

  private

  def set_category_list
    @category_list = Picture.categories
  end

  def pictures_params
    params.require(:picture).permit(:category, :title, :photo)
  end

end
