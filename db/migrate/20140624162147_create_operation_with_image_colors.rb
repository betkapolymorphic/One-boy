class CreateOperationWithImageColors < ActiveRecord::Migration
  def change
    create_table :operation_with_image_colors do |t|

      t.timestamps
    end
  end
end
