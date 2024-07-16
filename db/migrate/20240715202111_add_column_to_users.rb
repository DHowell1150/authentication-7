class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmation_password, :string
  end
end
