class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def index
    @accounts = Account.all(:order => "name")
  end

  def show
    @account = Account.find(params[:id])
    @employees = Employee.find_all_by_account_id(params[:id], :order => "last_name, first_name")
  end

  def create
    @account = Account.new(params[:account])
    if(@account.save)
      flash[:notice] = "Account #{@account.name} created"
      flash.keep
      redirect_to(accounts_url)
    else
      render :new
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = "Account #{@account.name} updated"
      flash.keep
      redirect_to(accounts_url)
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id])
    Employee.find_all_by_account_id(params[:id]).each { |i|
      i.destroy
    }
    @account.destroy
    flash[:notice] = "Account #{@account.name} deleted"
    flash.keep
    redirect_to(accounts_url)
  end

end
