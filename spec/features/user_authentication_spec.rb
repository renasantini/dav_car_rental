require 'rails_helper'

feature "User authentication" do
  context ' log in' do
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
  
    xscenario 'and must fill in all fields' do
      visit root_path
      click_on 'Entrar'
      fill_in "Email",	with: '' 
      fill_in "Senha",	with: ''
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Email não pode ficar em branco')
      expect(page).to have_content('Senha não pode ficar em branco')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
    end
    
  end

  context 'log out' do
    scenario 'successfully' do
      user = User.create!(email: 'teste@teste.com.br', password: '12345678')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end
      click_on 'Sair'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end
