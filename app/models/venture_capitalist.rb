require_relative 'funding_round'
require_relative 'startup'

class VentureCapitalist
    attr_reader :name
    attr_accessor :worth

    @@all = []

    def initialize(name, worth
    )
        @name = name
        @worth = worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        rich = self.all.select{|person| person.worth > 1000000}
    end

    def offer_contract(startup, amount, type)
        new_round = FundingRound.new(startup, self, amount, type)
    end

    def funding_rounds
        all_rounds = FundingRound.all
        my_rounds = all_rounds.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        my_rounds = self.funding_rounds
        my_startups = my_rounds.collect {|round| round.startup}
        unique_startups = my_startups.uniq
    end

    def biggest_investment
        my_rounds = self.funding_rounds
        sorted_rounds = my_rounds.sort_by {|round| round.investment}
        biggest = sorted_rounds[-1].investment
    end

    def invested(domain)
        array = []
        all_startups = Startup.all
        domain_startups = all_startups.select {|startup| startup.domain == domain}
        my_rounds = self.funding_rounds
        domain_startups.each do |startup|
            array << my_rounds.select {|round| round.startup == startup}
        end
        flat_array = array.flatten
        just_investments = flat_array.collect {|round| round.investment}
        just_investments.sum
    end
end
