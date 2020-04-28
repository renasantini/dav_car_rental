require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'from index page' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_link('Registrar nova filial', href: new_subsidiary_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Campinas'
    fill_in 'CNPJ', with: '32.685.705/0001-86'
    fill_in 'Endereço', with: 'Av. Imperatriz Dona Tereza Cristina, 11'
    click_on 'Enviar'

    expect(current_path).to eq subsidiary_path(Subsidiary.last.id)
    expect(page).to have_content('Campinas')
    expect(page).to have_content('32.685.705/0001-86')
    expect(page).to have_content('Av. Imperatriz Dona Tereza Cristina, 11')
    expect(page).to have_link('Voltar')
  end
end
