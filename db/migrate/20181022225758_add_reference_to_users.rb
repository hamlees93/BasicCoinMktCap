class AddReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :portfolio, foreign_key: true
  end
end