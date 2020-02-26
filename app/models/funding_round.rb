class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        
        if investment.class == Float && investment > 0
            @investment = investment
        else 
            raise ArgumentError, 'Please make sure investment is greater than zero and is a float'
        end
        
        @@all << self
    end

    def self.all
        @@all
    end


end
