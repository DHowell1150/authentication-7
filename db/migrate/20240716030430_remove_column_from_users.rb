class RemoveColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :confirmation_password, :string
  end
end
