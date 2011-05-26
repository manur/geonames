namespace :geonames do
  desc "Import all records from allCountries.txt to Redis"
  task :import => :environment do
    File.open('lib/tasks/allCountries.txt').each do |record|
      cols = record.split("\t")
      #geonameid = cols[0]
      #lat = cols[4]
      #lon = cols[5]
      $redis.sadd(cols[1],record)
    end
  end

  desc "test env"
  task :test => :environment do
    puts $redis
  end

end

# 3038814	Costa de Xurius	Costa de Xurius		42.5	1.48333	T	SLP	AD		00			1316	Europe/Andorra	1993-12-23
# 3038815	Font de la Xona	Font de la Xona		42.55003	1.44986	H	SPNG	AD		04		2082	Europe/Andorra	2010-01-11
# 3038816	Xixerella	Xixerella		42.55327	1.48736	P	PPL	AD		04		1520	Europe/Andorra	2009-04-24
# 3038817	Xixerella	Xixerella	Xixerella	42.55	1.48333	A	ADMD	AD		00		1548	Europe/Andorra	2011-05-07
# 3038818	Riu Xic	Riu Xic		42.56667	1.68333	H	STM	AD		00				2340	Europe/Andorra	1993-12-23

# The main 'geoname' table has the following fields :
# ---------------------------------------------------
# geonameid         : integer id of record in geonames database
# name              : name of geographical point (utf8) varchar(200)
# asciiname         : name of geographical point in plain ascii characters, varchar(200)
# alternatenames    : alternatenames, comma separated varchar(5000)
# latitude          : latitude in decimal degrees (wgs84)
# longitude         : longitude in decimal degrees (wgs84)
# feature class     : see http://www.geonames.org/export/codes.html, char(1)
# feature code      : see http://www.geonames.org/export/codes.html, varchar(10)
# country code      : ISO-3166 2-letter country code, 2 characters
# cc2               : alternate country codes, comma separated, ISO-3166 2-letter country code, 60 characters
# admin1 code       : fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)
# admin2 code       : code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80) 
# admin3 code       : code for third level administrative division, varchar(20)
# admin4 code       : code for fourth level administrative division, varchar(20)
# population        : bigint (8 byte int) 
# elevation         : in meters, integer
# gtopo30           : average elevation of 30'x30' (ca 900mx900m) area in meters, integer
# timezone          : the timezone id (see file timeZone.txt)
# modification date : date of last modification in yyyy-MM-dd format

