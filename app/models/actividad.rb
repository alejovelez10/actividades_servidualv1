class Actividad < ApplicationRecord
    has_and_belongs_to_many :users
	belongs_to :responsable, :class_name => 'User'
	belongs_to :user, :class_name => 'User'
	has_many :seguimientos
    mount_uploader :anexo, AnexoActividadUploader
	after_save :enviar

def enviar

	   if self.estado_envio && (self.e_vencimiento != "Vigente" &&  self.e_vencimiento != "Proxima a Vencer" &&  self.e_vencimiento != "Vencida")
        user = User.find(self.responsable_id)
        @times = self.f_entrega.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador = (@time / 60 / 60/ 24) + 1
        self.e_vencimiento = "Vigente"
        save
        ActividadMailer.creacion(user,self).deliver
        self.users.each do |user|
                
                ActividadMailer.invitado(user,self).deliver
        end
     
        
      end
 end 
end
