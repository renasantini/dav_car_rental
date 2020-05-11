require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'succesfully' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    
    login_as user, scope: :user  
    visit root_path
    click_on 'Filiais'
    click_on 'Campinas'
    click_on 'Editar'
    fill_in 'Nome',	with: 'Jundiaí'
    click_on 'Enviar' 

    expect(page).to have_content ('Jundiaí')
  end

  scenario 'name cannot be blank' do
    Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    
    login_as user, scope: :user    
    visit root_path
    click_on 'Filiais'
    click_on 'Campinas'
    click_on 'Editar'
    fill_in 'Nome',	with: ' '
    click_on 'Enviar'

    expect(page).to have_content ('não pode ficar em branco')
  end
end
