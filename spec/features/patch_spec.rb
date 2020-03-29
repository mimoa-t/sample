require 'rails_helper'

RSpec.feature "Patches", type: :feature do
  scenario 'patch test' do
    user = FactoryGirl.create( :user_with_address )
    expect( User.count ).to eq 1
    expect( Address.count ).to eq 1
    expect( Card.count ).to eq 1
  end
end