class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title, null: false
      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end
