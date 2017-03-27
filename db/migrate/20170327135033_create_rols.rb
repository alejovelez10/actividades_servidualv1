class CreateRols < ActiveRecord::Migration[5.0]
  def change
    create_table :rols do |t|
      t.string :name
      t.text :description
      t.boolean :act_admin
      t.boolean :act_basico
      t.boolean :act_director
      t.boolean :doc_admin
      t.boolean :doc_basico
      t.string :doc
      t.boolean :director
      t.integer :user_id

      t.timestamps
    end
  end
end
