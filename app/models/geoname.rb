class Geoname < ActiveRecord::Base

  def self.search(search)
    if search
      $redis.keys(search+'*')
    else
      ['Zee boom bah!']
    end
  end

#  def redis_key(str)
#    "user:#{self.id}:#{str}"
#  end
end
