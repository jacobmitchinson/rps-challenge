
Given(/^I have set my name as "(.*?)"$/) do |name|
  visit path_to('/the homepage/')
  fill_in("name", :with => name)
  click_button("submit")
end

Given(/^the computer chooses "(.*?)"$/) do |move|
  allow_any_instance_of(Computer).to receive(:move).and_return("scissors")
end