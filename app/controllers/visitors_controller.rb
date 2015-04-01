class VisitorsController < ApplicationController

  def index
    # @categories = Picture.order(:category).select(:category).map(&:category).uniq
    @category_pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first }
  end

end
