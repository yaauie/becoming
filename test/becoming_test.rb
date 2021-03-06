require 'test_helper'

require 'becoming'

User = Struct.new(:first_name, :last_name) do
  include Becoming
end

module FullNamed
  def full_name
    "#{first_name} #{last_name}"
  end
end

class BecomingTest < MiniTest::Unit::TestCase
  def test_becomings
    user = User.new("Steve", "Klabnik")
    user.becoming(FullNamed)

    assert_equal "Steve Klabnik", user.full_name
  end
end
