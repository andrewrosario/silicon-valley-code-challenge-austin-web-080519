require_relative 'funding_round'
require 'pry'

class Startup
    attr_reader :founder, :domain, :name
    attr_accessor :funds

    @@all = []

    def initialize(name, founder, domain, fund = 0)
        @name = name
        @founder = founder
        @domain = domain
        @funds = 0
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        my_startups = self.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        self.all.collect{|startup| startup.domain}
    end

    def sign_contract(type, amount, vc)
        new_round = FundingRound.new(self, vc, amount, type)
    end

    def num_funding_rounds
        all_rounds = FundingRound.all
        my_rounds = all_rounds.select {|round| round.startup == self}
        my_rounds.length
    end

    def total_funds
        self.funds
    end

    def investors
        all_rounds = FundingRound.all
        my_rounds = all_rounds.select {|round| round.startup == self}
        my_rounds.collect{|round| round.venture_capitalist}
    end

    def big_investors
        self.investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end



end
