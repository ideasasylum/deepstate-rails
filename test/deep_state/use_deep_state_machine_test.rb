require 'test_helper'

class DeepState::Rails::Test < ActiveSupport::TestCase
  test "if it creates the 'as' method to retrieve the state machine" do
    cat = Cat.new
    # 'life' is specified as the name of the method
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

  test "in_state scope" do
    murph = cats(:murph)
    assert_equal murph, Cat.in_state(:sleeping).first
  end

  test "sets the model in the state machine context" do
    murph = cats(:murph)
    assert_equal murph.life.context.model, murph
    assert_equal murph.life.context.cat, murph
  end
end
