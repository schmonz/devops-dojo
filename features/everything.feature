Feature: Address labels
  As a company that sells goods
  We want to send catalogs to potential customers
  So that they'll remember us and maybe impulse-buy something

  Scenario: Format one label
    Given the comma-separated address
      """
      Baldwin,Michael,Mr.,123 Simple Ct.
      """
    When it is formatted for display
    Then it should look like
      """
      Mr. Michael Baldwin
      123 Simple Ct.
      """
    And this line is a dummy so Cucumber can parse this feature

  Scenario: Misformat CSV entry with unquoted comma
    Given the comma-separated address
      """
      Belling, Vicar of St Loony Up the Cream Bun and Jam,Arthur,Rev.,789 Incubator-Jones Crescent
      """
    When it is formatted for display
    Then it should look like
      """
      Arthur  Vicar of St Loony Up the Cream Bun and Jam Belling
      Rev.
      """
    And this line is a dummy so Cucumber can parse this feature

  Scenario: Don't forcibly capitalize one non-capitalized label
    Given the comma-separated address
      """
      cummings,e.e.,mr.,123 pretty how town street
      """
    When it is formatted for display
    Then it should look like
      """
      mr. e.e. cummings
      123 pretty how town street
      """
    And this line is a dummy so Cucumber can parse this feature

  Scenario: Format several labels
    Given the comma-separated addresses
      """
      Baldwin,Michael,Mr.,123 Simple Ct.
      Obvious,Ron,Mr.,234 Sample Ln.
      Gumby,R.J.,Prof.,345 Semple Dr.
      """
    When they are formatted for display
    Then it should look like
      """
      Mr. Michael Baldwin
      123 Simple Ct.
      
      Prof. R.J. Gumby
      345 Semple Dr.
      
      Mr. Ron Obvious
      234 Sample Ln.
      """
    And this line is a dummy so Cucumber can parse this feature

  Scenario: Format several labels from a file
    Given the CSV file addresses0.csv
    When they are formatted for display
    Then it should look like
      """
      Mr. Michael Baldwin
      123 Simple Ct.
      
      Prof. R.J. Gumby
      345 Semple Dr.
      
      Mr. Ron Obvious
      234 Sample Ln.
      """
