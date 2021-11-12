class CompaniesController < ApplicationController
  def index
    response = Companies::FindCompanyService.new(sanatize_params).list_companies
    render json: { companies: response }
  end

  def create
    response = Companies::CreateCompanyService.new(params).create_new_company
    render json: { companies: response }
  end

  private

  def sanatize_params
    params.permit(:country)
  end
end
