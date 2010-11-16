class EmployeesController < ApplicationController
  
  before_filter :find_account

  def new
    @employee = @account.employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = @account.employee.new(params[:employee])
    if(@employee.save)
      flash[:notice] = "Employee #{@employee.first_name} #{@employee.last_name} created"
      flash.keep
      redirect_to(account_url(@account))
    else
      render :new
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:notice] = "Employee #{@employee.first_name} #{@employee.last_name} updated"
      flash.keep
      redirect_to(account_path(@employee.account_id))
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee #{@employee.first_name} #{@employee.last_name} deleted"
    flash.keep
    redirect_to(account_path(@employee.account_id))
  end

private

  def find_account
    @account = Account.find(params[:account_id])
    return(redirect_to(accounts_url)) unless @account
  end

end
