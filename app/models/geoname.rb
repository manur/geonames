class Geoname# < ActiveRecord::Base

  def self.search(search)
    if search
      $redis.keys(search)
      #$redis.smembers('*ayak').count
    else
      ['Zee boom bah!']
    end
  end

  def self.records(keys)
    if keys
      records = []
      for key in keys
        records += $redis.smembers(key)
      end
      return records
    else
      return ['Zee boom bah! You must enter a search term!']
    end
  end

end
