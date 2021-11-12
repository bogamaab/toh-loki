class Companies::FindCompanyService
  attr_reader :country

  def initialize(country)
    @country = country
  end

  def list_companies
    companies = search_companies
    return { message: 'No records with this country' } if companies.blank?

    companies.map do |company|
      { id: company.ucode, name: company.name, icon: company.icon_url }
    end
  end

  private

  def search_companies
    Company.where(country: country.values)
  end
end
