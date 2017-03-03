class Actividad < ApplicationRecord
has_and_belongs_to_many :users
	belongs_to :responsable, :class_name => 'User'
	belongs_to :user, :class_name => 'User'
	has_many :seguimientos
mount_uploader :anexo, AnexoActividadUploader
end
