Given(/^I have set my name as "(.*?)"$/) do |name|
  visit path_to('/the homepage/')
  fill_in("name", :with => name)
  click_button("submit")
end