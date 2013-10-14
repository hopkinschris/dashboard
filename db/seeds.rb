require 'highline/import'

u = User.create(
  name: ask("Name?  ") { |q| q.default = "Christopher Hopkins" },
  location: ask("Location?  ") { |q| q.default = "Toronto" },
  age: ask("Age?  ") { |q| q.default = "28" },
  gender: ask("Gender?  ") { |q| q.default = "male" },
  height: ask("Height? (e.g. 6'0\")") { |q| q.default = "6'0\"" },
  admin: true
)

step_data = [7301, 14723, 7429, 9968, 4613, 2439, 613]
step_data.each{ |s| u.steps.build(quantity: s);u.save }

calorie_data = [2280, 2785, 2001, 2252, 1697, 1989, 2349]
calorie_data.each{ |c| u.calories.build(quantity: c);u.save }

weight_data = [170.9, 173.5, 173.2, 169.6, 170.1, 173.3, 170.1]
weight_data.each{ |w| u.weights.build(quantity: w);u.save }

u.build_sleep(quality: 70, light_sleep: 10000, deep_sleep: 8000);u.save
u.build_mood(title: "Good", sub_type: 8);u.save
u.build_pulse(rate: 60);u.save
