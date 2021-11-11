require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it { should respond_to :ucode }
    it { should respond_to :name }
    it { should respond_to :icon_url }
    it { should respond_to :country }
  end
end
