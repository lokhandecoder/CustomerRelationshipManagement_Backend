class CreateInteractions < ActiveRecord::Migration[7.1]
  def change
    create_table :interactions do |t|
      t.text :content
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
