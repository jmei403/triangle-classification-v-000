class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if triangle_inequality? || side1 < 1 || side2 < 1 || side3 < 1
      begin
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
    elsif side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  def triangle_inequality?
    !((side1 + side2) > side3 || (side1 + side3) > side2 || (side2 + side3) > side1)
  end

  class TriangleError < StandardError
    def message
      "The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. Further, each side must be larger than 0."
    end
  end
end
