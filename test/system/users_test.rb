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

  test 'public pages' do
    setup_unit_with_treks
    visit '/'
    click_on 'users-link'
    click_on 'about-link'
    click_on 'rank-link'
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
end
