# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    
    UserLanguage.destroy_all

    Language.destroy_all

    User.destroy_all


10.times do

    User.create(name: Faker::Food.fruits, 
        username: Faker::Hipster.word, 
        email: Faker::Internet.email,
        password: "password",   
    )
end


    list_of_langs = [
        "Italian",
        "Arabic",
        "Spanish",
        "English",
        "Portuguese",
        "Catalan",
        "French",
        "Korean",
        "Japanese",
        "German"
    ]
      
    
    
        list_of_langs.each do | language |
    
            Language.create(name: language,
            description: "Sample Language Description",
            language_family: "Sample Language Family",
            number_of_speakers: Faker::IDNumber.valid_south_african_id_number)
    
        end 
    


        20.times do

            UserLanguage.create(time_spent: rand(1..1000000), 
                                enjoying: true, 
                                why_learn: "Sample reason to learn",
                                goals: "Sample Goals",
                                user: User.all.sample,
                                language: Language.all.sample
                            )
                    end







puts ". . . SEEDS HAVE BEEN PLANTED :D . . ."