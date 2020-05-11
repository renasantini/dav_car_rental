require 'rails_helper'

feature 'Admin view car models' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    ford = Manufacturer.create!(name: 'Ford')
    cat_compacto = CarCategory.create!(name: 'Compacto', daily_rate: '100', car_insurance: '40', third_party_insurance: '30')

    CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,  motorization: '1.0', fuel_type:'Flex', car_category: cat_compacto)
    CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford,  motorization: '1.0', fuel_type:'Flex', car_category: cat_compacto)
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Modelos de veículos'

    expect(page).to have_content 'Fiat'
    expect(page).to have_content 'Uno'
    expect(page).to have_content '2020'
    expect(page).to have_content 'Ford'
    expect(page).to have_content 'Ka'
    expect(page).to have_content '2021'
  end

  scenario 'no car models' do
  end

  scenario 'and view details' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_compacto = CarCategory.create!(name: 'Compacto', daily_rate: '100', car_insurance: '40', third_party_insurance: '30')
    cm = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type:'Flex', car_category: cat_compacto)
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Modelos de veículos'
    within("tr#car-model-#{cm.id}") do
      click_on 'Ver detalhes'
    end

    expect(page).to have_content 'Uno'
    expect(page).to have_content 'Fabricante: Fiat'
    expect(page).to have_content 'Ano: 2020'
    expect(page).to have_content 'Motor: 1.0'
    expect(page).to have_content 'Combustível: Flex'
    expect(page).to have_content 'Categoria: Compacto'
    expect(page).to have_content 'Diária: R$ 100,00'
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Modelos de veículos')
  end

  scenario 'cannot view unless logged in' do
    visit car_models_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot view new car model page unless logged in' do
    visit new_car_model_path

    expect(current_path).to eq(new_user_session_path)
  end
end
