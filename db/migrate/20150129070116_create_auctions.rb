class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip, :limit => 5 # https://github.com/rails/rails/issues/6272

      t.timestamps null: false
    end
  end
end
