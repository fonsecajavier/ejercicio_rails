require 'spec_helper'

describe AccountsController do

  context "routing" do
    it {{:delete => "accounts/3"}.should route_to(:controller => "accounts", :id => "3", :action => "destroy")}
    it {{:get => "/"}.should route_to(:controller => "accounts", :action => "index")}
    it {{:get => "accounts/3/edit"}.should route_to(:controller => "accounts", :action => "edit", :id => "3")}
    it {{:post => "accounts"}.should route_to(:controller => "accounts", :action => "create")}
    it {{:put => "accounts/3"}.should route_to(:controller => "accounts", :action => "update", :id => "3")}
    it {{:get => "accounts/3"}.should route_to(:controller => "accounts", :action => "show", :id => "3")}
    it {{:get => "accounts/new"}.should route_to(:controller => "accounts", :action => "new")}
  end

  context "acting based on non-existing records" do
    before(:each) do
      @account = Factory.build(:account)
    end

    context "POST create" do
      it "should render :new once again on invalid POST params" do
        @account.name = ""
        post :create, :account => @account.attributes
        response.should render_template("new")
      end

      it "should render accounts_path (index of accounts) on valid creation" do
        post :create, :account => @account.attributes
        response.should redirect_to(accounts_path)
      end

      it "should effectively create the account on the DB after valid params are received" do
        post :create, :account => @account.attributes
        Account.find_by_name(@account.name).should_not be_nil
      end
    end

  end

  context "acting based on existing records" do

    before(:each) do
      @account = Factory(:account)
      #@account = mock_model(Account, :null_object => true)
      #Account.stub!(:all).and_return([@account])
      #Account.stub!(:new).and_return(@account)
      #Account.stub!(:find).and_return(@account)
    end

    context "GET index" do
      it "assigns all accounts to @accounts" do
        get :index
        #assigns(:accounts).should include (@account)
        assigns(:accounts).should == Account.all
      end
    end

    context "GET show" do
      it "assigns a specific account to @account" do
        get :show, {:id => @account.id}
        #assigns(:accounts).should include (@account)
        assigns(:account).should == @account
      end
    end

    context "GET edit" do
      it "assigns correct account to the template depending on its id" do
        get :edit, {:id => @account.id}
        assigns(:account).should == @account
      end
    end

    context "PUT update" do
      it "should render :edit once again on invalid PUT params" do
        #@account.stub!(:update_attributes).and_return(false)
        put :update, {:id => @account.id, :account => {:bank_name=> ""}}
        #assigns[:account] = @account
        response.should render_template("edit")
      end

      it "should render accounts_path (index of accounts) on valid update" do
        put :update, {:id => @account.id, :account => {:name=> "edited name"}}
        #assigns[:account] = @account
        response.should redirect_to(accounts_path)
      end

      it "should effectively edit the account on the DB after valid params are received" do
        put :update, {:id => @account.id, :account => {:name => "edited name"}}
        @account.reload
        @account.name.should == "edited name"
      end
    end

    context "DELETE destroy" do
      it "should render accounts_path on valid destruction" do
        delete :destroy, {:id => @account.id}
        response.should redirect_to(accounts_path)
      end

      it "should effectively delete the account on valid destruction" do
        delete :destroy, {:id => @account.id}
        Account.all.should_not include(@account)
      end
    end

  end

end
