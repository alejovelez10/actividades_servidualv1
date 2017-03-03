class Seguimiento < ApplicationRecord
		belongs_to :actividad
	    belongs_to :user
	    mount_uploader :anexo, AnexoSeguimientoUploader
	 	after_create :seguimiento


	 def seguimiento

            actividad = Actividad.find(self.actividad_id)
            actividad.porcentaje = self.porcentaje
            actividad.save
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
