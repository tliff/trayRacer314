struct Float64
  EPSILON = 0.000001
  def approx other
    (other - self).abs < EPSILON
  end
end
