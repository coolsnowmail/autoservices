namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

      moderator = Moderator.create(email: "moderator@mail.ru",
        password: "123",
        password_confirmation: "123")
    # Create 15 posts
    15.times do
      Autoservice.create do |autoservice|
        autoservice.name = Faker::Job.title
        autoservice.address = Faker::Address.city + ", " + Faker::Address.street_name + ", " + Faker::Address.street_address
        autoservice.phone = Faker::PhoneNumber.cell_phone

        rand(15..30).times do
          Service.create do |service|
            service.name = Faker::Job.field
            autoservice.services << service
          end
        end

        rand(10..40).times do
          Comment.create do |comment|
            comment.text = Faker::Lorem.paragraph(rand(10..30))
            comment.mail = Faker::Internet.email
            autoservice.comments << comment
          end
        end
      end
    end
  end
end