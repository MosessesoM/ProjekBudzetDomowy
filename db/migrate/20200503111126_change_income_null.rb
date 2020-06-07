class ChangeIncomeNull < ActiveRecord::Migration[6.0]
  def change
	change_column_null :incomes, :category_id, false
  end
end
