class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        self.name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    #inputs: sting of domain, string of name
    #changes domain and name
    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    #inputs: a string of the founder's name
    def self.find_by_founder(founder_name)
        self.all.find {|startup_instance| startup_instance.founder == founder_name}
    end

    def self.domains
        self.all.map {|startup_instance| startup_instance.domain}
    end

    #inputs: VentureCapitalist instance, type as a string, investment amount as float

    def sign_contract(vc_instance, type_inv, inv_amount)
        FundingRound.new(self, vc_instance, type_inv, inv_amount)
    end

    def num_funding_rounds
        rounds = FundingRound.all.select {|round_instance| round_instance.startup == self}
        rounds.count
    end

    def total_funds
        FundingRound.all.reduce(0) do |sum, round|
            if round.startup == self
                sum += round.investment
            end
            sum
        end
    end

    def investors
        result = FundingRound.all.select {|round| round.startup == self}
        result.map {|round| round.venture_capitalist}.uniq
    end

    def big_investors
        #look at all the unique investors for this startup and compare to tres_comma_club
        self.investors.select do |investor| 
            VentureCapitalist.tres_comma_club.include?(investor)
        end
    end

end

