class CreateCodigos < ActiveRecord::Migration[5.0]
  def change
    create_table :codigos do |t|
      t.integer :consecutivo
      t.string :nombre_proyecto
      t.string :codigo_completo
      t.string :cliente

      t.timestamps
    end
  end
end
