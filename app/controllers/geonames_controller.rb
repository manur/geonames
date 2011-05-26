class GeonamesController < ApplicationController

  # GET /
  def index
    @tstart = Time.now
    @keys = Geoname.searchz(params[:search])
    @records = Geoname.records(@keys)
    @records = @records[0..50].map do |r|
      r.split("\t")
    end
    @tstop = Time.now - @tstart
  end

end
