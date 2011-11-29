class CompanyMembershipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin

  # TODO: add before filter to check for admin

  def edit
    @company = current_user.companies.find(params[:company_id])
    @memberships = @company.company_memberships.all
  end

  def update
    CompanyMembership.update_roles(params[:company], params[:company_id])
    flash[:notice] = 'Company membership was successfully updated'
    redirect_to edit_company_memberships_path
  end
end
