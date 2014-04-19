require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

# Note: the FQDN tests do not go through the web server because they use
# rack_test instead of selenium/firefox or selenium/chrome (DB)
  
describe "pages: " do
   
  describe "home page" do
    it "should exist" do
      visit root_path
      page.status_code.should be(200)
    end
    
    it "should link to the about page when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      click_link "About"
      page.should have_content("Pages#about")
      page.status_code.should be(200)  
    end
    
    it "should link to the contact page when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      click_link "Contact"
      page.should have_content("Pages#contact")
      page.status_code.should be(200)  
    end
  end
  
  describe "about page" do
    it "should exist when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      visit about_path
      page.should have_content("Pages#about")
      page.status_code.should be(200)
    end
    
    it "should return an error when not authenticated" do
      visit about_path
      page.should have_content("You need to sign in for access to this page.")
      page.status_code.should be(200)
    end
    
    it "should link back to the home page when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      visit about_path
      click_link('Home')
      page.should have_content("Pages#home")
      page.status_code.should be(200)  
    end
  end

  describe "contact page" do
    it "should exist when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      visit contact_path
      page.should have_content("Pages#contact")
      page.status_code.should be(200)
    end
    
    it "should return an error when not authenticated" do
      visit contact_path
      page.should have_content("You need to sign in for access to this page.")
      page.status_code.should be(200)
    end
    
    it "should link back to the home page when authenticated" do
      visit root_path
      mock_auth_hash
      click_link "Sign in with Twitter"
      visit contact_path
      click_link('Home')
      page.should have_content("Pages#home")
      page.status_code.should be(200)  
    end
  end

end