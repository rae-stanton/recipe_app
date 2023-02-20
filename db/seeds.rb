User.create!(name: "Faust Lune",
             email: "flune@henlo.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)