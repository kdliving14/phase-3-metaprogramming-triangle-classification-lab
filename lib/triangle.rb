class Triangle
  # three arguments
  attr_reader :a, :b, :c

  # upon initialization
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  # define an instance method
  def kind
    # validation method
    validate_triangle

    # eval type
    if a == b && b == c
      # returns a symbol
      :equilateral
    elsif a == b || b == c || a == c
      # returns a symbol
      :isosceles
    else
      # returns a symbol
      :scalene
    end
  end

  def sides_greater_than_zero?
    # sides > 0 (0 is not positive apparently)
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    # 2 sides sum > third side
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    # raise custom error if invalid
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  # custom error
  end

end
