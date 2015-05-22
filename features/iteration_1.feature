Feature: Address labels
  As a company that sells goods
  I want to send catalogs to potential customers
  So that they'll remember us and maybe impulse-buy something

  Scenario: Format labels
    Given the comma-separated address
      """
      Baldwin,Michael,Mr.,123 Simple Ct.
      """
    When it is formatted for display
    Then it looks like
      """
      Mr. Michael Baldwin
      123 Simple Ct.
      """

# Some Monty Python character names
# - Ron Obvious
# - Luigi Vercotti
# - Reverend Arthur Belling, Vicar of St Loony Up the Cream Bun and Jam
# - Knights who say Ni
# - Prof. R.J. Gumby
# - Michael Baldwin
# - Harry "Snapper" Organs
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
