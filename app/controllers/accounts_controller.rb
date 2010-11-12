class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    if(@account.save)
      flash[:notice] = "Account created"
      flash.keep
      redirect_to(accounts_url)
    else
      render :new
    end
  end
end
