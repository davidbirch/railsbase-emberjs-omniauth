require 'spec_helper'
  
describe "sessions: " do
  
  describe "sign in" do
    it "should work for mock credentials" do
      visit root_path
      mock_auth_hash
      page.should have_content("Sign in with Twitter")
      click_link "Sign in with Twitter"
      page.should have_content("Signed in!")
      page.should have_content("mockuser")  # user name
      page.should have_content("Sign out")
    end
    
    it "can handle authentication error" do
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      visit root_path
      page.should have_content("Sign in with Twitter")
      click_link "Sign in with Twitter"
      page.should have_content("Sorry, could not log you in...")
      page.status_code.should be(200)
    end
  end
  
  describe "sign out" do
    it "should work when visiting the sign out path directly" do
      visit signout_path
      page.status_code.should be(200)
    end
    
    it "should work after sign in" do
      visit root_path
      mock_auth_hash
      page.should have_content("Sign in with Twitter")
      click_link "Sign in with Twitter"
      page.should have_content("Signed in!")
      page.should have_content("mockuser")  # user name
      page.should have_content("Sign out")
      click_link "Sign out"
      page.should have_content("Signed out!")
      page.should have_content("Sign in with Twitter")
    end   
  end
  
  describe "auth failure" do
    it "should exist" do
      visit auth_failure_path
      page.status_code.should be(200)
    end
  end
  
  
  

end