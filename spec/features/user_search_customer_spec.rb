require 'rails_helper'

feature 'User search customer' do
  scenario 'by exact name' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    another_customer = Customer.create!(name: 'João da Silva', 
                                        email: 'joao@dasilva.com',
                                        document: '581.280.655-13')
    user = User.create!(email: 'teste@teste.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: customer.name
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)
  end

  scenario 'by partial name' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    another_customer = Customer.create!(name: 'João da Silva', 
                                        email: 'joao@dasilva.com',
                                        document: '581.280.655-13')
    user = User.create!(email: 'email@test.com', password: '12345678')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: 'José'
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)
  end

  scenario 'finds more then one by partial name' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    another_customer = Customer.create!(name: 'João da Silva', 
                                        email: 'joao@dasilva.com',
                                        document: '581.280.655-13')
    user = User.create!(email: 'email@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: 'Silva'
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(another_customer.name)
    expect(page).to have_content(another_customer.email)
    expect(page).to have_content(another_customer.document)
  end

  scenario 'finds nothing' do
    customer = Customer.create!(name: 'José da Silva', 
      email: 'teste@teste.com.br',
      document: '095.950.470-23')
    another_customer = Customer.create!(name: 'João da Silva', 
              email: 'joao@dasilva.com',
              document: '581.280.655-13')
    user = User.create!(email: 'email@test.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: 'John'
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado encontrado para: John')
    expect(page).not_to have_content(customer.name)
    expect(page).not_to have_content(customer.email)
    expect(page).not_to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)
  end

  scenario 'by document' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    another_customer = Customer.create!(name: 'João da Silva', 
                                        email: 'joao@dasilva.com',
                                        document: '581.280.655-13')
    user = User.create!(email: 'teste@teste.com', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: customer.document
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)
  end
end