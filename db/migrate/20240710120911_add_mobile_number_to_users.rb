class AddMobileNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobilenumber, :integer
  end
end
