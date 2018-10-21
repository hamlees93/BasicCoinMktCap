class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.decimal :change24hr
      t.decimal :volume24hr

      t.timestamps
    end
  end
end
