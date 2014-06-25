class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    t.integer :colortype
    t.integer :colortype1
    t.integer :colortype2
    t.integer :colortype3
    t.integer :colortype4
    t.string  :url
    t.string :rgb_colors
    t.timestamps
    end
  end
end
