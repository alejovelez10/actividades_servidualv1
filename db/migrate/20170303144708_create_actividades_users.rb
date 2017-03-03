class CreateActividadesUsers < ActiveRecord::Migration[5.0]
  def up
    

     create_table :actividads_users, id: false do |t|
      t.belongs_to :actividad, index: true
      t.belongs_to :user, index: true
    end
  end

  def down
    
    :actividads_users
  end
end
