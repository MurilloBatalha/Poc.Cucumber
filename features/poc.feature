#language: en

Feature: Test this shit!.


  @default
  Scenario: XIMBA-526
    Given that I have 3 coins
    And a "peanut" is 2 coins
    When I try to buy 1 "peanut"
    Then I should have 1 coin
  

  @default
  Scenario: SIMBA-9958
    Given that I have 30 coins
    And a "peanut" is 2 coins
    When I try to buy 10 "peanut"
    Then I should have 10 coin

  @crypt
  Scenario: Crypt-123
    Given a string "aBc"
    When I encrypt
    Then the decrypted string must be "aBc"