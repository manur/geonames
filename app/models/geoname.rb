class Geoname# < ActiveRecord::Base

  def self.search(search)
    if search
      $redis.keys(search)
      #$redis.smembers('*ayak').count
    else
      []
    end
  end

  def self.records(keys)
    unless keys.empty?
      records = []
      idx = 0
      for key in keys
        records += $redis.smembers(key)
        idx += 1
        if idx > 51
          return records
        end
      end
      return records
    else
      return ["Zee boom bah! You must enter a search term!" + "\t"*6]
    end
  end

end
