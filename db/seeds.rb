User.create(
  name: 'Christopher Hopkins',
  location: 'Toronto, Canada',
  age: 28,
  gender: 'male',
  height: "6'0\""
)

step_data = [7301, 14723, 7429, 9968, 4613, 2439, 613]
step_data.each{ |s| Step.create(quantity: s) }
