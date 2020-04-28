require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120,00', car_insurance: '30,00', third_party_insurance: '20,00')
    CarCategory.create!(name: 'Sedan', daily_rate: '140,00', car_insurance: '30,00', third_party_insurance: '20,00')

    visit root_path
    click_on 'Categorias de veículos'

    expect(page).to have_content('Compacto')
    expect(page).to have_content('Sedan')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120,00', car_insurance: '30,00', third_party_insurance: '20,00')
    CarCategory.create!(name: 'Sedan', daily_rate: '140,00', car_insurance: '30,00', third_party_insurance: '20,00')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Sedan'

    expect(page).to have_content('Sedan')
    expect(page).to have_content('140')
    expect(page).to have_content('30')
    expect(page).to have_content('20')
    expect(page).not_to have_content('Compacto')
  end

  scenario 'and no car categories are created' do
    visit root_path
    click_on 'Categorias de veículos'

    expect(page).to have_content('Nenhuma categoria de veículo cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120,00', car_insurance: '30,00', third_party_insurance: '20,00')
    CarCategory.create!(name: 'Sedan', daily_rate: '140,00', car_insurance: '30,00', third_party_insurance: '20,00')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120,00', car_insurance: '30,00', third_party_insurance: '20,00')
    CarCategory.create!(name: 'Sedan', daily_rate: '140,00', car_insurance: '30,00', third_party_insurance: '20,00')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Compacto'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end
