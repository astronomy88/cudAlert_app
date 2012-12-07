class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :product
      t.string :trigger
      t.integer :priority

      t.timestamps
    end
  end
end
