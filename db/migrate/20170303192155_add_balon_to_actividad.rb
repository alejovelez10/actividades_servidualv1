class AddBalonToActividad < ActiveRecord::Migration[5.0]
  def change
    add_column :actividads, :balon, :string
  end
end
