require "spec_helper"

describe "routing: " do

  it "to /" do
    get("/").should route_to("pages#home")
  end

  it "to /contact" do
    get("/contact").should route_to("pages#contact")
  end

  it "to /about" do
    get("/about").should route_to("pages#about")
  end
  
  it "to /signin" do
    get("/signin").should route_to("sessions#new")
  end
  
  it "to /signout" do
    get("/signout").should route_to("sessions#destroy")
  end
  
  it "to /auth/failure" do
    get("/auth/failure").should route_to("sessions#failure")
  end
  
  it "to /auth/:provider/callback" do
    get("/auth/provider/callback").should route_to(
      :controller => "sessions",
      :action => "create",
      :provider => "provider"
    )
  end
  
end
