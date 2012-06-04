require 'spec_helper'

describe ThingsController do

  context "with mocks" do

    let(:mock_thing) { mock_model(Thing).as_null_object }

    describe "GET index" do
      it "returns things" do
        Thing.stub!(:all).and_return [ mock_thing ]
        get :index
        assigns(:things).should eq [ mock_thing ]
      end

      it "returns things" do
        Thing.should_receive(:all)
        get :index
      end
    end

    describe "GET thing" do
      it "fetches thing from the database" do
        Thing.should_receive(:find).with("42").once
        get :show, id: 42
      end

      it "assigns thing" do
        Thing.stub!(:find).and_return [ mock_thing ]
        get :show, id: 42
        assigns(:thing).should eq [ mock_thing ]
      end
    end

    describe "GET edit" do
      it "fetches thing from the database" do
        Thing.should_receive(:find).with("42").once
        get :edit, id: 42
      end

      it "assigns thing" do
        Thing.stub!(:find).and_return [ mock_thing ]
        get :show, id: 42
        assigns(:thing).should eq [ mock_thing ]
      end
    end

    describe "GET new" do
      it "builds new thing" do
        Thing.should_receive(:new).once
        get :new
      end

      it "assigns new thing" do
        Thing.stub!(:new).and_return [ mock_thing ]
        get :new
        assigns(:thing).should eq [ mock_thing ]
      end
    end

    describe "POST create" do
      let(:thing) { { 'name' => 'Thingy' } }

      it "creates new thing with params" do
        Thing.stub!(:new).and_return [ mock_thing ]

        # TODO: NoMethodError: undefined method `save' for [#<Thing:0x3ffea0ae1c88 @name="Thing_1001">]:Array
        #mock_thing.stub!(:save).and_return [ true ]
        pending "aks Dimitri about NoMethodError on mock_thing.save"

        Thing.should_receive(:new).with(thing).once
        post :create, thing: thing
      end
    end

    describe "PUT update" do
      let(:thing) { { 'name' => 'Thingy' } }

      it "updates thing's attributes" do
        Thing.stub!(:find).and_return [ mock_thing ]

        # TODO: NoMethodError: undefined method `update_attributes' for [#<Thing:0x3ffea0ae1c88 @name="Thing_1001">]:Array
        pending "aks Dimitri about NoMethodError on mock_thing.update_attributes"

        Thing.should_receive(:find).with("42").once
        mock_thing.should_receive(:update_attributes).with(:thing).once
        put :update, id: 42, thing: thing
      end
    end

    describe "DELETE destroy" do
      it "removes thing from the database" do
        Thing.stub!(:find).and_return [ mock_thing ]

        # TODO: NoMethodError: undefined method `destroy' for [#<Thing:0x3ffea0ae1c88 @name="Thing_1001">]:Array
        pending "aks Dimitri about NoMethodError on mock_thing.destroy"

        Thing.should_receive(:find).with("42").once
        mock_thing.should_receive(:destroy).once
        delete :destroy, id: 42
      end
    end

    describe "thing not found" do
      before(:each) do
        Thing.stub!(:find).and_raise ActiveRecord::RecordNotFound
        get :show, id: 1
      end

      it "returns 404 status" do
        response.status.should == 404
      end

      it "redirects to 404 page" do
        # TODO: Works in real request but not here... wrong syntax?
        pending "works in reality but not here"
        response.should render_template '/public/404.html'
      end
    end

  end
end
