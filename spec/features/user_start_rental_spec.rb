require 'rails_helper'

feature 'User start rental' do
  scenario 'successfully' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    car_category = CarCategory.create!(name: 'Compacto', daily_rate: '100',
                                      car_insurance: '30',
                                      third_party_insurance: '20')
    ford = Manufacturer.create!(name: 'Ford')
    car_model = CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford, 
                                motorization: '1.0', fuel_type:'Flex',
                                car_category: car_category) 
    car = Car.create!(license_plate: 'ABC1234', car_model: car_model)
    rental = Rental.create!(customer: customer,
                            car_category: car_model.car_category,
                            start_date: 1.day.from_now,
                            end_date: 2.days.from_now)
    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit search_rentals_path(q: rental.code)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locação'

    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end

  xscenario 'from customer page' do
    car_model = create(:car_model)
    car = create(:car, license_plate: 'ABC1234', car_model: car_model)
    customer = create(:customer, name: 'Fulano Sicrano', 
                                 email: 'teste@teste.com.br')
    rental = create(:rental, customer: customer, 
                             car_category: car_model.car_category)
    user = user_login

    visit customer_path(customer)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locação'

    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end
end