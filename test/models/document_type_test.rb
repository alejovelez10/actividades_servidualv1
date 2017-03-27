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

require 'test_helper'

class DocumentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
