namespace :db do 
	desc "Fill User and Alert database with sample data"
	task populate: :environment do
		User.create!(name: "Example User",
					 email: "example@railstutorial.org",
					 password: "foobar",
					 password_confirmation: "foobar")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name, email: email, password: password,
						 password_confirmation: password)
		end

		Alert.create!(product: "Spam",
					  trigger: "Raid Degraded",
					  priority: 1)
		Alert.create!(product: "Spam",
					  trigger: "Raid Broken",
					  priority: 1)
		Alert.create!(product: "Spam",
					  trigger: "Active Spare",
					  priority: 5)
		Alert.create!(product: "Spam",
					  trigger: "Allowed Hour 1st Alert",
					  priority: 3)
		Alert.create!(product: "Web Filter",
					  trigger: "Average 15 min Load",
					  priority: 5)
		Alert.create!(product: "Web Filter",
					  trigger: "Average Socket Usage",
					  priority: 5)
		Alert.create!(product: "Web Filter",
					  trigger: "Average Throughput",
					  priority: 5)
		Alert.create!(product: "Web Filter",
					  trigger: "Cluster Check",
					  priority: 2)


	end
end