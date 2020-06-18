class AddBlock < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :block, :bool, default: false
  end
end
