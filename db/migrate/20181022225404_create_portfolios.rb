class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.decimal :change24hr
      t.decimal :quantity

      t.timestamps
    end
  end
end
