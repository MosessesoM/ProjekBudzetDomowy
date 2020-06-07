class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :title
      t.text :text
      t.numeric :amount

      t.timestamps
    end
  end
end
