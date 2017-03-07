# == Schema Information
#
# Table name: seguimientos
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  actividad_id :integer
#  descripcion  :integer
#  porcentaje   :integer
#  cierre       :boolean
#  anexo        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SeguimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
