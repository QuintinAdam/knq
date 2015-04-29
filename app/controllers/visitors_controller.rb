class VisitorsController < ApplicationController

  def index
    @rsvp = User.new
    #@category_pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first }
  end

end
