require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  describe "GET #index" do
    it "returns a successful HTTP request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful HTTP request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      before(:each) do
        post :create, location: Fabricate.attributes_for(:location)        
      end

      it "saves the new user object" do
        expect(Location.count).to eq(1)
      end

      it "redirects to the 'locations#show' page" do
        expect(response).to have_http_status('302')
      end

      it "sets the 'success' flash message" do
        expect(flash[:success]).to eq("Location was successfully created.")
      end
    end
    
    context "an unsuccessful create" do
      before(:each) do
        post :create, location: Fabricate.attributes_for(:location, address: nil)
      end
      
      it "does not save the new user object with invalid inputs" do
        expect(Location.count).to eq(0)
      end

      it "sets the 'danger' flash message" do
        expect(flash[:danger]).to eq("Location has not been created.")
      end

      it "renders the 'new' template" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    let!(:location) { Fabricate(:location) }

    it "returns a successful http request status code" do
      get :show, id: location.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    let!(:location) { Fabricate(:location) }
    it "sends a successful edit request" do
      get :edit, id: location

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    let(:location) { Fabricate(:location, address: "101 Old Main St.") }
    context "a successful update" do

      before(:each) do
        put :update, id: location.id, :location => { address: "101 Main St." }
      end

      it "updates the location object" do

        expect(Location.last.address).to eq("101 Main St.")
        expect(Location.last.address).not_to eq("101 Old Main St.")
      end

      it "sets a 'success' flash message" do
        expect(flash[:success]).to eq("Location was successfully updated.")
      end
      
      it "shows a successful redirect http code" do

        expect(response).to have_http_status("302")
        expect(response).to redirect_to location_path(Location.last)
      end
    end

    context "an unsuccessful update" do
      before(:each) do
        put :update, id: location.id, :location => { address: " " }
      end

      it "does not update the location object" do
        expect(Location.last.address).to eq("101 Old Main St.")
        expect(Location.last.address).not_to eq("101 Main St.")
      end

      it "sets a 'danger' flash message" do
        expect(flash[:danger]).to eq("Location has not been updated.")
      end

      it "renders the 'edit' page" do
        expect(response).to render_template(:edit)
      end
    end
  end
end