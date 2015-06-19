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
    Given the CSV file addresses1.csv
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

# Some Monty Python character names
# - Luigi Vercotti
# - Reverend Arthur Belling, Vicar of St Loony Up the Cream Bun and Jam
# - Knights who say Ni
# - Harry "Snapper" Organs
# - Raymond Luxury Yacht (pronounced "Throatwobbler Mangrove")
# - Jean-Brian Zatapathique
#
# "Upper Class Twit of the Year"
# - Vivian Smith-Smythe-Smith
# - Simon Zinc-Trumpet-Harris
# - Nigel Incubator-Jones
# - Gervaise Brook-Hampster
# - Oliver St. John-Mollusc
#
# "Election Night Special"
# - Alan Jones (Sensible)
# - Tarquin Fin-tim-lin-bin-whin-bim-lim-bus-stop-F'tang-F'tang-Olé-Biscuitbarrel (Silly)
# - Kevin Phillips-Bong (Slightly Silly)
# - James Walker (Sensible)
# - Mr Elsie Zzzzzzzzzzzzzzzip (Silly)
# - Malcolm Peter Brian Telescope Adrian Umbrella Stand Jasper Wednesday (pops mouth twice) Stoatgobbler John Raw Vegetable (whinnying) Arthur Norman Michael (blows squeaker) Featherstone Smith (whistle) Northcott Edwards Harris (fires pistol, then 'whoop') Mason (chuff-chuff-chuff-chuff) Frampton Jones Fruitbat Gilbert (sings) 'We'll keep a welcome in the' (three shots) Williams If I Could Walk That Way Jenkin (squeaker) Tiger-drawers Pratt Thompson (sings) 'Raindrops Keep Falling On My Head' Darcy Carter (horn) Pussycat (sings) 'Don't Sleep In The Subway' Barton Mainwaring (hoot, 'whoop') Smith (Very Silly)
#
# "Dirty Hungarian Phrasebook"
# - Hungarian name order (but nothing else from this sketch!)
# - Also there's Spanish name order
# - Other variations where "last name" wouldn't sort
# - Other variations where the name otherwise wouldn't print nicely (long?)
#
# Unicode 6 characters (emoji) (accented names?)
# Han Chinese characters
