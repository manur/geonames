class Geoname# < ActiveRecord::Base

  def self.searchz(prefix)
    count = 10
    r = Redis.new
    results = []
    rangelen = 10 # This is not random, try to get replies < MTU size
    start = r.zrank(:compl,prefix)
    return [] if !start
    while results.length != count
        range = r.zrange(:compl,start,start+rangelen-1)
        start += rangelen
        break if !range or range.length == 0
        range.each {|entry|
            minlen = [entry.length,prefix.length].min
            if entry[0...minlen] != prefix[0...minlen]
                count = results.count
                break
            end
            if entry[-1..-1] == "*" and results.length != count
                results << entry[0...-1]
            end
        }
    end
    return results
  end


  def self.search(search)
    if search
      $redis.keys(search)
      #$redis.smembers('*ayak').count
    else
      []
    end
  end

  def self.records(keys)
    records = ["\t"*6]
    unless keys.empty?
      idx = 0
      for key in keys
        records += $redis.smembers(key)
        idx += 1
        break if idx > 49
      end
    end
    return records
  end

end
