require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'user links' do
    visit root_url
    within '#main-nav' do
      click_link 'Sign up'
    end
    assert_selector 'h1', text: 'Sign up'
    within '#body' do
      click_link 'Sign in'
    end
    assert_selector 'h1', text: 'Sign in'

    within '#main-nav' do
      click_link 'Sign in'
    end
    assert_selector 'h1', text: 'Sign in'
    within '#body' do
      click_link 'Sign up'
    end
    assert_selector 'h1', text: 'Sign up'
  end

  test 'signing up' do
    visit root_url
    within '#main-nav' do
      click_link 'Sign up'
    end
    assert_selector 'h1', text: 'Sign up'
    within '#clearance.sign-up' do
      fill_in 'Screenname', with: Faker::Internet.username(specifier: 8..15)
      all('#user_unit_id option')[0].select_option
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'password'
      click_on 'Sign me up'
    end
    assert_selector "#primary-nav"
    assert_text "You"
    click_link "You"
  end

  test 'forgot password' do
    visit '/'
    within '#main-nav' do
      click_link 'Sign in'
    end
    click_link 'Forgot password?'
    assert_selector 'h1', text: 'Reset your password'
    fill_in 'Email address', with: Faker::Internet.email
    click_on 'Reset password'
    assert_text 'You will receive an email within the next few minutes. It contains instructions for changing your password.'
  end

  # test 'creating user with invalid email' do
  #   visit sign_up_url
  #   assert_no_difference('User.count', 'user should not have been added with a bad email') do
  #     within '#clearance.sign-up' do
  #       fill_in 'Email', with: 'bademail'
  #       fill_in 'Password', with: Faker::Internet.password
  #       click_on 'Sign up'
  #     end
  #   end
  # end

  # test 'signing up, and using an existing unit' do
  #   unit = create(:unit)
  #   visit sign_up_url
  #   within '#clearance.sign-up' do
  #     fill_in 'Email', with: Faker::Internet.email
  #     fill_in 'Password', with: 'password'
  #     all('#unit-select option')[1].select_option
  #     click_on 'Sign up'
  #   end
  #   assert_equal unit, User.last.unit
  # end

  # test 'visiting profile' do
  #   user = create(:user)
  #   visit sign_in_url
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   within '#clearance.sign-in' do
  #     click_on 'Sign in'
  #   end
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end
  # end

  # test 'unsubscribing and subscribing a user' do
  #   user = create(:user)
  #   assert user.is_subscribed
  #   visit user_unsubscribe_path(user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end
  #   assert_not find('#user_is_subscribed').checked?

  #   check 'user_is_subscribed'
  #   click_on 'Update'

  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end
  #   assert find('#user_is_subscribed').checked?
  # end

  # test 'editing a user' do
  #   user = create(:user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end

  #   assert_no_selector '#user_is_admin'
  #   assert_no_selector '#user_is_owner'
  #   assert_selector '#user_is_subscribed'

  #   fill_in 'Email', with: 'new_email@example.com'
  #   click_on 'Update'
  #   assert_text 'Your account has been updated'
  #   # click_on "navbarDropdown"
  #   # has_link? "new_email@example.com"
  # end

  # test 'editing an admin' do
  #   user = create(:admin_user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end

  #   assert_selector '#user_is_admin'
  #   assert_no_selector '#user_is_owner'
  #   assert_selector '#user_is_subscribed'
  # end

  # test 'editing an owner' do
  #   user = create(:owner_user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     click_on user.email
  #   end

  #   assert_no_selector '#user_is_admin'
  #   assert_selector '#user_is_owner'
  #   assert_selector '#user_is_subscribed'
  # end

  # test 'editing a user unit' do
  #   user = create(:user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     assert_no_link user.unit.name
  #   end
  # end

  # test 'editing a admin unit' do
  #   user = create(:admin_user)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     assert_link user.unit.name
  #     click_on user.unit.name
  #   end
  #   assert_selector 'h1', text: user.unit.name
  #   has_table? '#users'
  # end

  # test 'editing a owner unit' do
  #   user = create(:owner_user)
  #   user_2 = create(:user, unit: user.unit)
  #   sign_in(user)
  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     assert_link user.unit.name
  #     click_on user.unit.name
  #   end
  #   assert_selector 'h1', text: user.unit.name
  #   has_table? '#users'

  #   click_on "user-#{user.id}-edit-link"
  #   assert_no_selector '#user_is_admin'
  #   find_field 'user[is_owner]', disabled: true
  #   assert_selector '#user_is_subscribed'

  #   click_on 'navbarDropdown'
  #   within '#user-menu' do
  #     assert_link user.unit.name
  #     click_on user.unit.name
  #   end
  #   click_on "user-#{user_2.id}-edit-link"
  #   assert_no_selector '#user_is_admin'
  #   assert_no_selector '#user_is_owner'
  #   assert_selector '#user_is_subscribed'
  # end
end
