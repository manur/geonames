class GeonamesController < ApplicationController

  # GET /
  def index
    @tstart = Time.now
    @keys = Geoname.search(params[:search])
    @records = Geoname.records(@keys)
    @tstop = Time.now - @tstart
  end

end
