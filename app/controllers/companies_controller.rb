class CompaniesController < ApplicationController
  def index
    response = Company::FindCompanyService.new(params[:country]).get_companies
    render json: { companies: response }
  end

  def create
    response = Company::CreateCompanyService.new(params).create_new_company
    render json: { companies: response }
  end
end
