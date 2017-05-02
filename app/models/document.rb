# == Schema Information
#
# Table name: documents
#
#  id                   :integer          not null, primary key
#  obra                 :integer
#  user_id              :integer
#  document_date        :date
#  anexo                :string
#  document_type_id     :integer
#  sub_document_type_id :integer
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Document < ApplicationRecord
	belongs_to :user
	belongs_to :document_type
	mount_uploader :anexo, AnexoDocumentUploader
    validate :archivo_size_validation, :if => "anexo?" 

     

  def archivo_size_validation
      
      errors[:anexo] << "El archivo no puede ser mayor a 40MB" if anexo.size > 40.megabytes
  
  end

def self.search(search, search1, search2)
puts "holdddddddddddddddddddddddda"
puts search
            search != "" && search != nil ? (scope :codigo1, -> { where(obra: search) }) : (scope :codigo1, -> { where.not(obra: nil) })
            search1 != "" && search != nil  ? (scope :tipo1, -> { where(document_type_id: search1) }) : (scope :tipo1, -> { where.not(document_type_id: nil) })  
             search2 != "" && search != nil  ? (scope :responsable1, -> { where(user_id: search2) }) : (scope :responsable1, -> { where.not(user_id: nil) })
            codigo1.responsable1.tipo1#.where("nombre like '%#{search}%' or descripcion like '%#{search}%' "  )  
        end


end
