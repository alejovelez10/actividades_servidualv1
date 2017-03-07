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

require 'test_helper'

class ActividadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
