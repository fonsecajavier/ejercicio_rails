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
  end

  def create
    @account = Account.new(params[:account])
    if(@account.save)
      flash[:notice] = "Account #{@account.name} created"
      flash.keep
      redirect_to(accounts_path)
    else
      render :new
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = "Account #{@account.name} updated"
      flash.keep
      redirect_to(accounts_path)
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id]).destroy
    flash[:notice] = "Account #{@account.name} deleted"
    flash.keep
    redirect_to(accounts_path)
  end

end
