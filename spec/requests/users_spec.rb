require 'spec_helper'

describe "User" do

  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        lambda do
          visit '/signup'
          fill_in "Name",         :with => ""
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""
          click_button "Sign up"
#         response.should render_template('users/new')
#         response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end
  end

  describe "success" do

      it "should make a new user" do

        lambda do
          visit '/signup'
          fill_in "Name",        :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button "Sign up"
#      response.should render_template('pages/home')
        end.should change(User, :count).by(1)
      end
    end
  end
