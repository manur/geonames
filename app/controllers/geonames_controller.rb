class GeonamesController < ApplicationController

  # GET /
  def index
    @geonames = Geoname.search(params[:search])
  end

end
