class RemoveNamePriceChangeFromPortfolios < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :name, :string
    remove_column :portfolios, :price, :decimal
    remove_column :portfolios, :change24hr, :decimal
  end
end
