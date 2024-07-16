require 'rails_helper'

RSpec.describe "User registration form" do
  describe "HAPPY PATHES" do 
    it "creates new user" do
      visit root_path
      
      click_on "Register as a User"
      
      expect(current_path).to eq(new_user_path)
      
      username = "funbucket13"
      password = "test"
      correct_password = "test"
      
      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_confirmation_password, with: correct_password

      click_on "Create User"

      # expect(current_path).to eq(user_path())
      expect(page).to have_content("Welcome, #{username}!")
    end
  end

  describe "SAD PATHS" do 
    it "needs correct login information" do 

      visit root_path
      
      click_on "Register as a User"
      
      # When I visit `/register`
      expect(current_path).to eq(new_user_path)
      
      username = "funbucket13"
      password = "test"
      incorrect_password = "test123"
      
      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_confirmation_password, with: incorrect_password
      
      click_on "Create User"
      
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Sorry, username or password is incorrect")
    end
  end
end