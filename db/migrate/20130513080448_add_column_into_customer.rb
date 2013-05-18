class AddColumnIntoCustomer < ActiveRecord::Migration
  def up
    add_column :customers, :parent_id, :integer
  end

  def down
    remove_column :customers, :parent_id
  end
end
