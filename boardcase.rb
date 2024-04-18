class Boardcase
    attr_accessor :position, :content

    def initialize(position, content = " ")
        @position = position
        @content = content
    end
end