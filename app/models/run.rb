require_relative 'funding_round'
require_relative 'venture_capitalist'
require_relative 'startup'
require 'pry'

airbnb = Startup.new("Airbnb", "A guy", "Hotels")
homeaway = Startup.new("VRBO", "A gal", "Hotels")
google = Startup.new("Google", "Two Guys", "Search")
yahoo = Startup.new("Yahoo", "Unknown", "Search")

joe = VentureCapitalist.new("Joe", 1000000)
sarah = VentureCapitalist.new("Sarah", 2000000)
kyle = VentureCapitalist.new("Kyle", 30000)
leslie = VentureCapitalist.new("Leslie", 40000000)

puts VentureCapitalist.tres_commas_club

airbnb_angel = FundingRound.new(airbnb, joe, 500, "Angel")
homeaway_seriesA = FundingRound.new(homeaway, sarah, 1000, "Series A")
google_preSeed = FundingRound.new(google, kyle, 1500, "Pre-Seed")
yahoo_seriesC = FundingRound.new(yahoo, leslie, 10, "Series C")

a = google.sign_contract("Angel", 1000, leslie)
b = google.sign_contract("Series A", 10000, joe)
c = google.sign_contract("Series C", 100000, sarah)

g_invest = google.investors
g_num = google.num_funding_rounds
g_funds = google.total_funds

bigs = google.big_investors

yahoo_offer = sarah.offer_contract(yahoo, 25, "Angel")

sarah_rounds = sarah.funding_rounds

sarah_port = sarah.portfolio

sarah_big = sarah.biggest_investment

sarah_d = sarah.invested("Search")



binding.pry


