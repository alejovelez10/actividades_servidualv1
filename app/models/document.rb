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


def self.search(search, search1, search2)

            search != "" ? (scope :codigo, -> { where(obra: search) }) : (scope :codigo, -> { where.not(obra: nil) })
            search2 != "" ? (scope :responsable, -> { where(user_id: search2) }) : (scope :responsable, -> { where.not(user_id: nil) })
             search1 != "" ? (scope :tipo, -> { where(document_type_id: search1) }) : (scope :tipo, -> { where.not(document_type_id: nil) })  
            codigo.responsable.tipo#.where("nombre like '%#{search}%' or descripcion like '%#{search}%' "  )  
        end


end
