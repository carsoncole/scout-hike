require 'test_helper'

class UsesrTest < ActiveSupport::TestCase
  test "creating a user" do
    assert create(:unit)
  end

  test "percentage of goal" do
    user = create(:user)
    create_list(:trek, 3, user: user)
    assert_equal user.miles_count / user.unit.miles_goal * 100, user.percentage_of_goal
  end

  test "user rank" do
    user = create(:user)
    create_list(:trek, 3, distance_in_miles: 1, user: user)

    user_2 = create(:user, unit: user.unit)

    assert_equal user, User.ranked.first

    user_3 = create(:user, unit: user.unit)
    create_list(:trek, 5, distance_in_miles: 10, user: user_3)

    assert user_3.miles_count > user.miles_count
    assert_equal user_3, User.ranked.first
  end
end
