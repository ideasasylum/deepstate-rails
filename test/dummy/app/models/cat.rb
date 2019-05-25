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

class Cat < ApplicationRecord
  include DeepState::Rails

  use_deep_state_machine LifeOfACat, column: :state, as: :life, with: {}
end
