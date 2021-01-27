require 'test_helper'

class TrekTest < ActiveSupport::TestCase
  test "creating a valid trek" do
    assert create(:trek)
  end

  test "creating an invalid trek" do
    trek = build(:trek)
    assert trek.valid?

    trek.date = nil
    assert_not trek.valid?

    trek.date = Date.today
    trek.distance_in_miles = nil
    assert_not trek.valid?
  end

  test "updating miles count" do
    trek = create(:trek)
    user = trek.user
    count = trek.distance_in_miles
    assert_equal count, user.miles_count
    trek_2 = create(:trek, user: user)
    assert_equal count + trek_2.distance_in_miles, user.reload.miles_count
    more_treks = create_list(:trek, 5, user: user)
    total_count = count + trek_2.distance_in_miles + more_treks.sum{ |t| t.distance_in_miles }
    assert_equal total_count, user.reload.miles_count

    more_treks[2].destroy
    assert_equal total_count - more_treks[2].distance_in_miles, user.reload.miles_count
  end

  test "percentage of goal achieved" do
    user = create(:user)

    assert_equal 0, user.percentage_of_goal
    trek = create(:trek, distance_in_miles: 1.0, user: user)
    assert_equal 10, user.percentage_of_goal
    trek = create(:trek, distance_in_miles: 0.5, user: user)
    assert_equal 15, user.percentage_of_goal
  end
end
