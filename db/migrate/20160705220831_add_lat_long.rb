class AddLatLong < ActiveRecord::Migration
  def change
      add_column :notifications, :latitude, :float
      add_column :notifications, :longitude, :float
  end
end
