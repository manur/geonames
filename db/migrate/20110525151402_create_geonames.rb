class CreateGeonames < ActiveRecord::Migration
  def self.up
    create_table :geonames do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :geonames
  end
end
