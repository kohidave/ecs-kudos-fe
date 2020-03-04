class Awards
    attr_reader :name, :image, :description
    def self.all
        all_awards = []
        all_awards.push(Awards.new("Participant", "🏅", "created one or more issues", Proc.new{|created_issues| created_issues >= 1}))
        all_awards.push(Awards.new("Detective", "🕵️‍♀️", "created two or more issues", Proc.new{|created_issues| created_issues >= 2}))
        all_awards.push(Awards.new("Helper Bee", "🐝", "created three or more issues", Proc.new{|created_issues| created_issues >= 3}))
    end
    def initialize(name, image, description, condition)
        @name = name
        @image = image
        @description = description
        @condition = condition
    end

    def eligible?(issues_created)
        @condition.call(issues_created)
    end
end
