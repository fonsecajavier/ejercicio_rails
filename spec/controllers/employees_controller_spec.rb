require 'spec_helper'

describe EmployeesController do
  it "INDEX path should not be routable.  Contents already shown on AccountController" do {:get => "accounts/3/employees"}.should_not be_routable end
  it "SHOW path should not be routable.  Nothing to see here" do {:get => "accounts/3/employees/1"}.should_not be_routable end
  it {{:get => "accounts/3/employees/new"}.should route_to(:controller => "employees", :account_id => "3", :action => "new")}
  it {{:post => "accounts/3/employees"}.should route_to(:controller => "employees", :account_id => "3", :action => "create")}
  it {{:get => "accounts/3/employees/1/edit"}.should route_to(:controller => "employees", :id => "1", :account_id => "3", :action => "edit")}
  it {{:put => "accounts/3/employees/1"}.should route_to(:controller => "employees", :id => "1", :account_id => "3", :action => "update")}
  it {{:delete => "accounts/3/employees/1"}.should route_to(:controller => "employees", :id => "1", :account_id => "3", :action => "destroy")}

  context "acting based on non-existing records" do
    before(:each) do
      @account = Factory(:account)
      @employee = Factory.build(:employee, :account_id => @account.id)
    end

    context "POST create" do
      it "should render :new once again on invalid POST params" do
        @employee.first_name = ""
        post :create, :account_id => @account.id, :employee => @employee.attributes
        response.should render_template("new")
      end

      it "should render employees_path (index of employee) on valid creation" do
        post :create, :account_id => @account.id, :employee => @employee.attributes
        response.should redirect_to(account_path(@account))
      end

      it "should effectively create the account on the DB after valid params are received" do
        post :create, :account_id => @account.id, :employee => @employee.attributes
        Employee.find_by_first_name_and_last_name(@employee.first_name, @employee.last_name).should_not be_nil
      end
    end

  end

  context "acting based on existing records" do
    before(:each) do
      @account = Factory(:account)
      @employee = Factory(:employee, :account_id => @account.id)
    end

    context "GET edit" do
      it "assigns correct employee to the template depending on its id" do
        get :edit, {:account_id => @account.id, :id => @employee.id}
        assigns(:employee).should == @employee
      end
    end

    context "PUT update" do
      it "should render :edit once again on invalid PUT params" do
        put :update, {:account_id => @account.id, :id => @employee.id,
                       :employee => {:first_name => ""}}
        response.should render_template("edit")
      end

      it "should render account_path (index of employees) on valid update" do
        put :update, {:account_id => @account.id, :id => @employee.id,
                      :employee => {:first_name => "edited first name"}}
        response.should redirect_to(account_path(@account.id))
      end

      it "should effectively edit the account on the DB after valid params are received" do
        put :update, {:account_id => @account.id, :id => @employee.id,
                      :employee => {:first_name => "edited first name"}}
        @employee.reload
        @employee.first_name.should == "edited first name"
      end
    end

    context "DELETE destroy" do
      it "should render account_path (index of employees) on valid destruction" do
        delete :destroy, {:account_id => @account.id, :id => @employee.id}
        response.should redirect_to(account_path(@account.id))
      end

      it "should effectively delete the employee on valid destruction" do
        delete :destroy, {:account_id => @account.id, :id => @employee.id}
        Account.all.should_not include(@employee)
      end
    end

  end

end

