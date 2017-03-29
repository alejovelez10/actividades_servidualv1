# == Schema Information
#
# Table name: document_types
#
#  id         :integer          not null, primary key
#  nombre     :string
#  codigo     :string
#  frecuencia :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DocumentType < ApplicationRecord
	has_many :documents
end
