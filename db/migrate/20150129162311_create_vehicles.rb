class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string  :make
      t.string  :model
      t.date    :year      
      t.integer :stock
      t.decimal :bid, precision: 8, scale: 2
      t.decimal :payout, precision: 8, scale: 2
      t.text    :description
      t.references :auction, index: true

      t.timestamps null: false
    end
    add_foreign_key :vehicles, :auctions
  end
end
