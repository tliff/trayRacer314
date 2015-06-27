class Vector3
  getter x,y,z

  def initialize x, y, z
    @x = x.to_f64
      @y = y.to_f64
    @z = z.to_f64
  end

  def length
    Math.sqrt(@x**2+@y**2+@z**2)
  end

  def norm
    Vector3.new(@x / length, @y / length, @z / length)
  end

  def + other
    Vector3.new(@x+other.x,@y+other.y,@z+other.z)
  end

  def - other
    Vector3.new(@x-other.x,@y-other.y,@z-other.z)
  end

  def * scale : Float64
    scale = scale.to_f64
    Vector3.new(@x*scale, @y*scale, @z*scale)
  end

  def / scale
    scale = scale.to_f64
    self * (1/scale)
  end

  def * other : Vector3
    @x * other.x +
    @y * other.y +
    @z * other.z
  end

  def % other : Vector3
    Vector3.new(@y*other.z - @z*other.y, @z*other.x - @x*other.z, @x*other.y - @y*other.x)
  end

  def == other
    @x.approx(other.x) && @y.approx(other.y) && @z.approx(other.z)
  end

  def to_s
    "[#{@x},#{@y},#{@z}]"
  end

end