require 'rails_helper'

feature 'User register customer' do 
  scenario 'succesfully' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Cadastre-se'

    fill_in "Nome",	with: "João Ubaldo Ribeiro" 
    fill_in "CPF",	with: "00000000000" 
    fill_in "email",	with: "joaoubaldo@gmail.com" 
    click_on 'Cadastrar'

    expect(current_path).to eq customer_path(Customer.last.id)
    expect(page).to have_content("João Ubaldo Ribeiro")
    expect(page).to have_content("00000000000")
    expect(page).to have_content("joaoubaldo@gmail.com")
    expect(page).to have_link('Voltar', href: root_path)
  end
end