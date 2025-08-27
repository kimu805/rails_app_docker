class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.timestamps
      t.string :name, null: false
      t.text :text
    end
  end
end
