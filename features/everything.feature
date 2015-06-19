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

  Scenario: Format one very long name label
    Given the comma-separated address
      """
      Peter Brian Telescope Adrian Umbrella Stand Jasper Wednesday Stoatgobbler John Raw Vegetable Arthur Norman Michael Featherstone Smith Northcott Edwards Harris Mason Frampton Jones Fruitbat Gilbert "We'll keep a welcome in the" Williams If I Could Walk That Way Jenkin Tiger-drawers Pratt Thompson "Raindrops Keep Falling On My Head" Darcy Carter Pussycat "Don't Sleep In The Subway" Barton Mainwaring Smith,Malcolm,Mr.,12 St. John-Mollusc Whorl
      """
    When it is formatted for display
    Then it should look like
      """
      Mr. Malcolm Peter Brian Telescope Adrian Umbrella Stand Jasper
        Wednesday Stoatgobbler John Raw Vegetable Arthur Norman Michael
        Featherstone Smith Northcott Edwards Harris Mason Frampton Jones
        Fruitbat Gilbert "We'll keep a welcome in the" Williams If I Could
        Walk That Way Jenkin Tiger-drawers Pratt Thompson "Raindrops Keep
        Falling On My Head" Darcy Carter Pussycat "Don't Sleep In The Subway"
        Barton Mainwaring Smith
      12 St. John-Mollusc Whorl
      """
    And this line is a dummy so Cucumber can parse this feature

  Scenario: Format CSV entry with unquoted comma
    Given the comma-separated address
      """
      Belling, Vicar of St Loony Up the Cream Bun and Jam,Arthur,Rev.,789 Incubator-Jones Crescent
      """
    When it is formatted for display
    Then it should look like
      """
      Rev. Arthur Belling, Vicar of St Loony Up the Cream Bun and Jam
      789 Incubator-Jones Crescent
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
