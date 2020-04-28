require 'rails_helper'

feature "admin edit car category" do
  scenario "succesfully" do
    CarCategory.create!(name: 'Compacto', daily_rate: '100', car_insurance: '30',
                        third_party_insurance: '20')
    
    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Compacto'
    click_on 'Editar'
    fill_in 'Nome', with: 'Sedan'
    click_on 'Enviar'
  
    expect(page).to have_content('Sedan')
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('R$ 30,00')
    expect(page).to have_content('R$ 20,00')
  end

  scenario "name cannot be blank" do
    CarCategory.create!(name: 'Compacto', daily_rate: '100', car_insurance: '30',
                        third_party_insurance: '20')
    
    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Compacto'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'
  
    expect(page).to have_content('não pode ficar em branco')
  end
end
