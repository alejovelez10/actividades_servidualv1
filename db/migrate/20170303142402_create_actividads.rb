class CreateActividads < ActiveRecord::Migration[5.0]
  def change
    create_table :actividads do |t|
      t.integer :consecutivo
      t.string :tipo
      t.integer :user_id
      t.string :prioridad
      t.integer :responsable_id
      t.string :nombre
      t.text :descripcion
      t.string :anexo
      t.date :f_entrega
      t.integer :porcentaje
      t.boolean :estado_cierre
      t.boolean :estado_envio
      t.integer :contador
      t.string :codigo
      t.string :e_vencimiento

      t.timestamps
    end
  end
end
