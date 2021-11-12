class CompaniesController < ApplicationController
  def index
    response = Companies::FindCompanyService.new(sanatize_params_index).list_companies
    render json: { companies: response }
  end

  def create
    response = Companies::CreateCompanyService.new(sanatize_params_create[:file]).create_new_company
    render json: response, status: :ok
  end

  private

  def sanatize_params_index
    params.permit(:country)
  end

  def sanatize_params_create
    params.permit(:file)
  end
end
