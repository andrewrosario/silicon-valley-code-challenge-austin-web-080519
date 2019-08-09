require_relative 'venture_capitalist'
class FundingRound
    attr_accessor :investment, :type
    attr_reader :startup, :venture_capitalist

    @@all = []

    def initialize(startup, vc, amount, type)
        @startup = startup
        @venture_capitalist = vc
        @investment = amount
        @type = type
        startup.funds += amount
        @@all << self
        vc.worth -= amount

    end

    def self.all
        @@all
    end
end
