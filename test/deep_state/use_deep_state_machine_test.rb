require 'test_helper'

class DeepState::Rails::Test < ActiveSupport::TestCase
  test "if it creates the 'as' method to retrieve the state machine" do
    cat = Cat.new
    assert_equal cat.life.class, LifeOfACat
  end

  test "sets the initial state on validation" do
    cat = Cat.new
    cat.validate
    assert_equal cat.state, 'hungry'
  end

  test "restores the state" do
    penny = cats(:penny)
    assert penny.life.hungry?
  end

  test "saves the current state" do
    penny = cats(:penny)
    penny.life.eat!
    penny.save!
    assert_equal 'curious', penny.reload.state
  end
end
