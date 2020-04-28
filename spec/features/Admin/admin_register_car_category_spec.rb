require 'rails_helper'

feature 'Admin register car category' do
  scenario 'from index page' do
    visit root_path
    click_on 'Categorias de veículos'

    expect(page).to have_link('Registrar nova categoria', href: new_car_category_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Compacto'
    fill_in 'Diária', with: '100,00'
    fill_in 'Seguro', with: '25,00'
    fill_in 'Seguro para terceiros', with: '10,00'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Compacto')
    expect(page).to have_content('100')
    expect(page).to have_content('25')
    expect(page).to have_content('10')
    expect(page).to have_link('Voltar')
  end
  
  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de veículos'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Sedan'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Sedan')
    expect(page).to have_content('140')
    expect(page).to have_content('30')
    expect(page).to have_content('20')
    expect(page).to have_link('Voltar')
  end
end
