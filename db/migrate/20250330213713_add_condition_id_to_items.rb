class AddConditionIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :condition_id, :integer, null:false
  end
end
