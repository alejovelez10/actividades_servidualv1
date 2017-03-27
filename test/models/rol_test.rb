# == Schema Information
#
# Table name: rols
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  act_admin    :boolean
#  act_basico   :boolean
#  act_director :boolean
#  doc_admin    :boolean
#  doc_basico   :boolean
#  doc          :string
#  director     :boolean
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
