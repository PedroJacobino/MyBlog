require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # TODO: password length, password confirmation, password_confimariton presence, email uniqueness
  setup do
    @user = users(:one)
  end

  test "should not save password whose length is less than 3" do
    @user.password = "21"
    refute @user.valid?
    assert @user.errors.messages[:password].present?
  end

  test "should not save an email that isn't unique or isn't an email format" do
    @user.email = "22"
    refute @user.valid?
    assert @user.errors.messages[:email].present?
  end

  test "should not save a password without a confirmation" do
    @user.password = "123"
    @user.password_confirmation = nil
    refute @user.valid?
    assert @user.errors.messages[:password_confirmation].present?
  end

  test "should not save a password without the right confirmation" do
    @user.password = "test"
    @user.password_confirmation = "something_else"
    refute @user.valid?
    assert @user.errors.messages[:password_confirmation].present?
  end
end
