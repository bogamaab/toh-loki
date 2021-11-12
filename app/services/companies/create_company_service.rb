class Companies::CreateCompanyService
  KEYS_CO = { name: 'short-name', ucode: 'code', icon_url: 'image-url' }.freeze
  KEYS_MX = { name: 'name', ucode: 'id', icon_url: 'icon_url' }.freeze
  KEYS_USA = { name: 'companyName', ucode: 'companyID', icon_url: 'icon' }.freeze

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def create_new_company
    country = country_name
    constant = "#{self.class}::KEYS_#{country.upcase}".constantize
    data = json_parser

    if data.is_a?(Hash)
      data = data.values.flatten
    end

    data.each do |company|
      Company.create(
        name: company.fetch(constant[:name]),
        ucode: company.fetch(constant[:ucode]),
        icon_url: company.fetch(constant[:icon_url]),
        country: country
      )
    end
  end

  private

  def country_name
    File.basename(file.original_filename, '.json')
  end

  def file_reader
    File.read(file)
  end

  def json_parser
    JSON.parse(file_reader)
  end
end
