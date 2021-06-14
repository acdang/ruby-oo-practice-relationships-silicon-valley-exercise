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

    def self.tres_commas_club
        self.all.select {|venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|round| round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max {|round1, round2| round1.investment <=> round2.investment}
    end

    def domains(domain)
        self.funding_rounds.select {|round| round.startup.domain == domain}
    end

    def invested(domain)
        self.domains(domain) ? 
        self.domains(domain).map {|round| round.investment}.sum : 0.0
    end
end
