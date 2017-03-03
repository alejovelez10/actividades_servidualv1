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

	 end
end
