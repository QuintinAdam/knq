class VisitorsController < ApplicationController

  def index
    @rsvp = User.new(email: 'q@q.com', first_name: 'Quintin', last_name: 'adam')
    @category_pictures = Picture.order(:category, created_at: :desc).group_by(&:category).map{ |category, value| value.first }
  end

end
