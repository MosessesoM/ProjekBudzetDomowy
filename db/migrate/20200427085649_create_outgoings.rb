class CreateOutgoings < ActiveRecord::Migration[6.0]
  def change
    create_table :outgoings do |t|
      t.string :title
      t.text :text
      t.numeric :amount

      t.timestamps
    end
  end
end
