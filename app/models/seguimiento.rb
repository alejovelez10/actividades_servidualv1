class Seguimiento < ApplicationRecord
		belongs_to :actvidad
	belongs_to :user
	 mount_uploader :anexo, AnexoSeguimientoUploader
end
