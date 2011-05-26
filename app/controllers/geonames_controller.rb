class GeonamesController < ApplicationController

  # GET /
  def index
    @tstart = Time.now
    @keys = Geoname.searchz(params[:search])
    @records = Geoname.records(@keys)
    @records.map! do |r|
      r.split("\t")
    end
    @tstop = Time.now - @tstart
  end

end
