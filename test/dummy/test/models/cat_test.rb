# == Schema Information
#
# Table name: cats
#
#  id               :integer          not null, primary key
#  name             :string
#  lives            :integer
#  state            :string
#  state_updated_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
