class ChangeOutgoingsNull < ActiveRecord::Migration[6.0]
  def change
	change_column_null :outgoings, :category_id, false
  end
end
