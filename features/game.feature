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

Scenario: Player wins
	Given I am on /play
	And I press "rock"
	Then I should see "You win."

Scenario: Player draws
	Given I am on /play
	And I press "scissors"
	Then I should see "Draw."
	And I should not see "You win."
	And I should not see "You lose."

Scenario: Player loses 
	Given I am on /play
	And I press "paper"
	Then I should see "You lose."
	And I should not see "You win."
	And I should not see "Draw."

