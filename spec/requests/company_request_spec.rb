require 'rails_helper'

RSpec.describe 'Company will can create and show clean data', type: :request do
  context 'when the endpoint receive one json' do
    it 'should return standard format' do
      request =
      response = {
        companies: [
          {
            id: 'TL-1',
            name: 'Uno Dos Tres',
            icon: 'https://google.com'
          }
        ]
      }

      expect(response).to eq(request)
    end

    it 'should return message error when the file is other format' do
      response = {
        message: 'A ocurrido un error, ten cuidado por favor.'
      }

      expect(response).to eq(request)
    end
  end

  context 'when the endpoint receive a country consult' do
    let(:company_co) { create(:company, country: 'co') }
    let(:companies_mx) { create_list(:company, 5, country: 'mx') }
    let(:companies_us) { create_list(:company, 5, country: 'us') }

    it 'should return all info companies in correct format' do
      response = {
        companies: [
          {
            id: 'TL-1',
            name: 'Uno Dos Tres',
            icon: 'https://google.com'
          }
        ]
      }
    end

    it 'should return message error when cant find the country' do
      response = {
        message: 'Pais no encontrado, revisa tu solicitud'
      }

      expect(respose).to eq(request)
    end
  end
end
