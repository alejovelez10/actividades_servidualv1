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

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
