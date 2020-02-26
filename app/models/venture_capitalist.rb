class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        self.all.select {|vc_instance| vc_instance.total_worth >= 1000000000}
    end

    def offer_contract(startup_instance, type_inv, inv_amount)
        FundingRound.new(startup_instance, self, type_inv, inv_amount)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|round| round.startup}.uniq
    end

    def biggest_investment 
        self.funding_rounds.max_by {|round| round.investment}
    end

    #input: domain as a string
    def invested(domain)
        result = self.funding_rounds.select {|round| round.startup.domain == domain}
        #array of rounds with that domain
        result.reduce(0) {|memo, round| memo += round.investment}
    end
end
