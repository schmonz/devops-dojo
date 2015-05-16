Feature: Address labels
  As a company that sells goods
  I want to send catalogs to potential customers
  So that they'll remember us and maybe impulse-buy something

  Scenario: Format labels
    Given the comma-separated address Phillips,Kevin,Mr.,123 Simple Ct.
    When it is formatted for display
    Then it looks like
"""
Mr. Kevin Phillips
123 Simple Ct.
"""
