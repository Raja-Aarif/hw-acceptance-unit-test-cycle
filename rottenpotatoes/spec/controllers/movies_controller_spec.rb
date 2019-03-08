require 'rails_helper'
 describe MoviesController do
     describe "#director" do
        it "find movies with the same director" do
            @movie_id="123"
            @movie=double('random movie', :director => 'random Director')
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(@movie).to receive(:list_with_same_director)
            get :director, {:id => @movie_id}
            expect(response).to render_template(:director)
        end
        
        it "should redirect to the index page" do
            @movie_id="134"
            @movie=double('random movie').as_null_object
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :director, {:id => @movie_id}
            expect(response).to redirect_to(movies_path)
        end
    end
    
    describe "#new" do
        it "Should return create view page" do
            get :new
            expect(response).to render_template(:new)
        end
    end
    
     describe "#edit" do
        it "gives the movie object to edit" do
            @movie = double("Random movie", :id=>"234")
            @movie_id = "321"
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :edit, {:id=>@movie_id}
            expect(response).to render_template(:edit)
        end
    end
end
