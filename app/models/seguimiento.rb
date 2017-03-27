# == Schema Information
#
# Table name: seguimientos
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  actividad_id :integer
#  porcentaje   :integer
#  cierre       :boolean
#  anexo        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  descripcion  :string
#

class Seguimiento < ApplicationRecord
		belongs_to :actividad
	    belongs_to :user
	    mount_uploader :anexo, AnexoSeguimientoUploader
	 	after_create :seguimiento


	 def seguimiento

            actividad = Actividad.find(self.actividad_id)
            actividad.porcentaje = self.porcentaje
            actividad.save
            if self.user_id == actividad.responsable_id
                
                actividad.balon = "asignador"
                actividad.save
             
        elsif self.user_id == actividad.user_id
             actividad.balon = "responsable" 	
             actividad.save
          end

            if self.cierre 

                actividad.estado_cierre = true
                actividad.save

            end
        user1 = User.find(actividad.responsable_id)
        ActividadMailer.seguimiento(user1,self).deliver
        actividad.users.each do |user|
                
        ActividadMailer.seguimiento(user,self).deliver
        end

	 end
end
