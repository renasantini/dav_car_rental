require 'rails_helper'

feature 'Admin register car models' do
  scenario 'successfully' do
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)

    visit root_path
    click_on 'Modelos de veículos'
    click_on 'Registrar modelo de veículo'
    fill_in 'Nome', with: 'Bolt'
    fill_in 'Ano', with: '2020'
    fill_in 'Motor', with: '203'
    fill_in 'Combustível', with: 'Elétrico'
    select 'Chevrolet', from: 'Fabricante'
    select 'Compacto', from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('Bolt')
    expect(page).to have_content('Chevrolet')
    expect(page).to have_content('2020')
    expect(page).to have_content('203')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Compacto')
  end
end