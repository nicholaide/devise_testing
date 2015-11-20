require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'one admin user' do
    u = users(:the_admin)
    assert u.has_role?(:admin)
  end
  
  test "admin can read because they can manage" do
    u = users(:the_admin)
    ab = Ability.new(u)
    assert ab.can?(:read, Book.first)
    assert ab.can?(:manage, Book.new)
    
  end
  
end
