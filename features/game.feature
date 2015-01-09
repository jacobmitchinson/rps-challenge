Feature: Play a game
	In order to play rock, paper, scissors
	As a bored person
	I want to play the game

Scenario: Greet
	Given I am on the homepage
	Then I should see "Welcome, to the game!"

Scenario: Set my name
	Given I am on the homepage
	And I fill in "name" with "Jake"
	And I press "submit"
	Then I should see "Hi, Jake, let's play."

