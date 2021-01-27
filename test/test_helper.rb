require 'simplecov'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'clearance/test_unit'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)
  parallelize(workers: 1)

  def setup
    @unit = create(:unit)
  end

  def setup_unit_with_treks
    users = create_list(:user, 5, unit: @unit)
    users.each do |u|
      create_list(:trek, 5, user: u)
    end
  end

  def sign_in(user = nil)
    @user = user || create(:user)
    visit sign_in_url
    within '#clearance.sign-in' do
      fill_in 'Screen name or email', with: @user.screenname
      fill_in 'Password', with: @user.password
      click_on 'Sign in'
    end
  end
end
