require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    before (:each) do
        @movie_attributes = {:title => 'abc', :release_date => '10/3/2018', :rating => 'PG'}
        @movie = FactoryGirl.create(:movie)
    end
    
    describe "POST #create" do
      context "with valid attributes" do 
        it "saves movie" do
            expect {post :create, movie: @movie_attributes}.to change(Movie,:count).by(1)
        end
        it "assigns the saved movie to @movie" do
            post :create, movie: @movie_attributes
            expect(assigns(:movie).title).to include("abc")
        end
        it "redirects to the home page" do
            post :create, movie: @movie_attributes
            expect(response).to redirect_to(:action => 'index')
        end
      end
    end
  
    describe "GET #show" do
      it "assigns the requested movie to @movie" do
        get :show, id: @movie
        expect(assigns(:movie).title).to include("Blazing Saddles")
      end
      it "renders the :show template" do
        get :show, id: @movie
        expect(response).to render_template(:show)
      end
    end
  
    describe "PUT #update" do
      it "located the requested movie" do
        put :update, id: @movie, movie: @movie_attributes
        expect(assigns(:movie)).to eq(@movie)
      end
      it "changed the requested movies attributes" do
        put :update, id: @movie, movie: @movie_attributes
        @movie.reload
        expect(@movie.title).to eq("abc")
        expect(@movie.rating).to eq("PG")
      end
      it "redirects to the updated movie" do
        put :update, id: @movie, movie: @movie_attributes
        expect(response).to redirect_to @contact
      end
    end
  
    describe "DELETE #destroy" do
      it "deletes the movie" do
        expect{
          delete :destroy, id: @movie
        }.to change(Movie,:count).by(-1)
      end
      it "redirects to the main page " do
        delete :destroy, id: @movie
        expect(response).to redirect_to(:action => 'index') 
      end
    end
end
