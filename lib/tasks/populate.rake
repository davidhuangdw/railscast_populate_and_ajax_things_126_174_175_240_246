require 'populator'
require 'faker'

namespace :db do
  namespace :populate do
    desc "Erase and fill products and categories"
    task products: :environment do

      [Category, Product].each(&:delete_all)

      Category.populate 10 do |category|
        category.name = Populator.words(2..5).titleize
        Product.populate 10..30 do |p|
          p.category_id = category.id
          p.name = Populator.words(3..8).titleize
          p.description = Populator.sentences(2..10)
          p.price = [4,99, 9.99, 100]
          p.created_at = 2.years.ago..Time.now
        end
      end
    end

    desc "Erase and fill people"
    task people: :environment do
      Person.delete_all

      Person.populate 100 do |p|
        p.name = Faker::Name.name
        p.company = Faker::Company.name
        p.email = Faker::Internet.email
        p.phone = Faker::PhoneNumber.phone_number
        p.country = Faker::Address.country
        p.street = Faker::Address.street_address
        p.city = Faker::Address.city
        p.state = Faker::Address.state_abbr
        p.zip = Faker::Address.zip_code
      end
    end

    desc "Erase and fill all"
    task all: [:products, :people]
  end
end