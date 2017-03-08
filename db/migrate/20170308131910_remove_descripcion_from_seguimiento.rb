class RemoveDescripcionFromSeguimiento < ActiveRecord::Migration[5.0]
  def change
    remove_column :seguimientos, :descripcion, :integer
    add_column :seguimientos, :descripcion, :string
  end
end
