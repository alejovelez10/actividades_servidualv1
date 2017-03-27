class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.integer :obra
      t.integer :user_id
      t.date :document_date
      t.string :anexo
      t.integer :document_type_id
      t.integer :sub_document_type_id
      t.text :description

      t.timestamps
    end
  end
end
