require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    Subsidiary.create!(name: 'Guarulhos', cnpj: '76.415.862/0001-47', address: 'Rod. Hélio Smidt, s/nº')

    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Campinas')
    expect(page).to have_content('Guarulhos')
  end

  scenario 'and view details' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    Subsidiary.create!(name: 'Guarulhos', cnpj: '76.415.862/0001-47', address: 'Rod. Hélio Smidt, s/nº')

    visit root_path
    click_on 'Filiais'
    click_on 'Campinas'

    expect(page).to have_content('Campinas')
    expect(page).to have_content('32.685.705/0001-86')
    expect(page).to have_content('Av. Imperatriz Dona Tereza Cristina, 11')
    expect(page).not_to have_content('Guarulhos')
  end

  scenario 'and no subisidiaries are created' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Nenhuma filial cadastrada')
  end

  scenario 'and return to home page' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    Subsidiary.create!(name: 'Guarulhos', cnpj: '76.415.862/0001-47', address: 'Rod. Hélio Smidt, s/nº')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to subsidiaries page' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    Subsidiary.create!(name: 'Guarulhos', cnpj: '76.415.862/0001-47', address: 'Rod. Hélio Smidt, s/nº')

    visit root_path
    click_on 'Filiais'
    click_on 'Campinas'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
