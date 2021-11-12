require 'rails_helper'

RSpec.describe 'Company will can create and show clean data', type: :request do
  context 'POST /companies' do
    let(:file)  { Rack::Test::UploadedFile.new(Rails.root + "spec/factories/jsons/mx.json", 'application/pdf')  }
    it 'should return standard format with http success' do
      post '/companies', params: {}
      result = {
        companies: [
          {
            id: 'TL-1',
            name: 'Uno Dos Tres',
            icon: 'https://google.com'
          }
        }

      expect(response.body).to eq(result)
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
    end

    it 'should return message error when the file is other format' do
      result = {
        message: 'A ocurrido un error, ten cuidado por favor.'
      }

      expect(response.body).to eq(result)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the endpoint receive a country consult' do
    let(:company_co) { create(:company, country: 'co') }
    let(:companies_mx) { create_list(:company, 5, country: 'mx') }
    let(:companies_us) { create_list(:company, 5, country: 'us') }

    it 'should return all info companies in correct format' do
      result = {
        companies: [
          {
            id: 'TL-1',
            name: 'Uno Dos Tres',
            icon: 'https://google.com'
          }
        ]
      }

      expect(response.body).to eq(result)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end

    it 'should return message error when cant find the country' do
      result = {
        message: 'Pais no encontrado, revisa tu solicitud'
      }

      expect(response.body).to eq(result)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end
  end
end
