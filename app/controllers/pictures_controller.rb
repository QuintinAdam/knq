class  PicturesController < ApplicationController

  before_action :set_category_list
  def index
    @pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first(8) }
  end

  def show
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

end
