require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#roles= filters out invalid roles" do
    subject = User.new
    subject.roles = ['admin', 'fish']
    assert_equal ['admin'], subject.roles
  end
end
