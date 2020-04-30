require 'rails_helper'

feature "User authentication" do
  scenario "succesfully" do
    user = User.create!( email: 'teste@teste.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in "Email",	with: "teste@teste.com.br" 
    fill_in "Senha",	with: "12345678"
    within 'form' do
      click_on 'Entrar'
    end
    
    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair') 
    expect(current_path).to eq(root_path)

  end
end
