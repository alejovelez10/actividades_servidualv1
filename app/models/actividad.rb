# == Schema Information
#
# Table name: actividads
#
#  id             :integer          not null, primary key
#  consecutivo    :integer
#  tipo           :string
#  user_id        :integer
#  prioridad      :string
#  responsable_id :integer
#  nombre         :string
#  descripcion    :text
#  anexo          :string
#  f_entrega      :date
#  porcentaje     :integer
#  estado_cierre  :boolean
#  estado_envio   :boolean
#  contador       :integer
#  codigo         :string
#  e_vencimiento  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  balon          :string
#

class Actividad < ApplicationRecord
    has_and_belongs_to_many :users
	belongs_to :responsable, :class_name => 'User'
	belongs_to :user, :class_name => 'User'
	has_many :seguimientos
    mount_uploader :anexo, AnexoActividadUploader
	after_save :enviar


scope :estado_f, -> { where(estado_cierre: false).order(created_at: :desc) }




def self.search(search, search1, search2)

if search2 == "Proxima"
search2 = "Proxima a Vencer"
end
            search1 != "" ? (scope :responsable, -> { where(responsable_id: search1) }) : (scope :responsable, -> { where.not(responsable_id: nil) })
             search2 != "" ? (scope :estado, -> { where(e_vencimiento: search2) }) : (scope :estado, -> { where.not(e_vencimiento: nil) })  
            responsable.estado#.where("nombre like '%#{search}%' or descripcion like '%#{search}%' "  )  
        end
    

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
