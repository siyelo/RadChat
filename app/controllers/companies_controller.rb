class CompaniesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @rooms = current_user.available_rooms(current_user.current_company)
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def update
    @company = current_user.companies.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "The company has been updated"
      redirect_to edit_company_path(params[:id])
    else
      flash[:error] = "We could not update the company"
      render :edit
    end
  end
end
