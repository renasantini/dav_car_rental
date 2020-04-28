require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120', car_insurance: '30', third_party_insurance: '20')
    CarCategory.create!(name: 'Sedan', daily_rate: '140', car_insurance: '30', third_party_insurance: '20')

    visit root_path
    click_on 'Categorias de veículos'

    expect(page).to have_content('Compacto')
    expect(page).to have_content('Sedan')
  end

  scenario 'and view details' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120', car_insurance: '30', third_party_insurance: '20')
    CarCategory.create!(name: 'Sedan', daily_rate: '140', car_insurance: '30', third_party_insurance: '20')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Sedan'

    expect(page).to have_content('Sedan')
    expect(page).to have_content('R$ 140,00')
    expect(page).to have_content('R$ 30,00')
    expect(page).to have_content('R$ 20,00')
    expect(page).not_to have_content('Compacto')
  end

  scenario 'and no car categories are created' do
    visit root_path
    click_on 'Categorias de veículos'

    expect(page).to have_content('Nenhuma categoria de veículo cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120', car_insurance: '30', third_party_insurance: '20')
    CarCategory.create!(name: 'Sedan', daily_rate: '140', car_insurance: '30', third_party_insurance: '20')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    CarCategory.create!(name: 'Compacto', daily_rate: '120', car_insurance: '30', third_party_insurance: '20')
    CarCategory.create!(name: 'Sedan', daily_rate: '140', car_insurance: '30', third_party_insurance: '20')

    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Compacto'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end
