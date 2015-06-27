class Matrix44
  getter values
  def initialize *args
    raise "too short, dude" if args.length != 16
    @values = args.map{|e| e.to_f64}
  end

  def * other : Float64
    Matrix44.new(*@values.map{|e| e*other} )
  end

  def * other : Matrix44
    Matrix44.new(
      @values[0] * other.values[0+0] + @values[1] * other.values[4+0] + @values[2] * other.values[8+0] + @values[3] * other.values[12+0],
      @values[0] * other.values[0+1] + @values[1] * other.values[4+1] + @values[2] * other.values[8+1] + @values[3] * other.values[12+1],
      @values[0] * other.values[0+2] + @values[1] * other.values[4+2] + @values[2] * other.values[8+2] + @values[3] * other.values[12+2],
      @values[0] * other.values[0+3] + @values[1] * other.values[4+3] + @values[2] * other.values[8+3] + @values[3] * other.values[12+3],

      @values[4] * other.values[0+0] + @values[5] * other.values[4+0] + @values[6] * other.values[8+0] + @values[7] * other.values[12+0],
      @values[4] * other.values[0+1] + @values[5] * other.values[4+1] + @values[6] * other.values[8+1] + @values[7] * other.values[12+1],
      @values[4] * other.values[0+2] + @values[5] * other.values[4+2] + @values[6] * other.values[8+2] + @values[7] * other.values[12+2],
      @values[4] * other.values[0+3] + @values[5] * other.values[4+3] + @values[6] * other.values[8+3] + @values[7] * other.values[12+3],

      @values[8] * other.values[0+0] + @values[9] * other.values[4+0] + @values[10] * other.values[8+0] + @values[11] * other.values[12+0],
      @values[8] * other.values[0+1] + @values[9] * other.values[4+1] + @values[10] * other.values[8+1] + @values[11] * other.values[12+1],
      @values[8] * other.values[0+2] + @values[9] * other.values[4+2] + @values[10] * other.values[8+2] + @values[11] * other.values[12+2],
      @values[8] * other.values[0+3] + @values[9] * other.values[4+3] + @values[10] * other.values[8+3] + @values[11] * other.values[12+3],

      @values[12] * other.values[0+0] + @values[13] * other.values[4+0] + @values[14] * other.values[8+0] + @values[15] * other.values[12+0],
      @values[12] * other.values[0+1] + @values[13] * other.values[4+1] + @values[14] * other.values[8+1] + @values[15] * other.values[12+1],
      @values[12] * other.values[0+2] + @values[13] * other.values[4+2] + @values[14] * other.values[8+2] + @values[15] * other.values[12+2],
      @values[12] * other.values[0+3] + @values[13] * other.values[4+3] + @values[14] * other.values[8+3] + @values[15] * other.values[12+3]
    )
  end

  def * other : Vector3
    scale = @values[12] * other.x + @values[13] * other.y + @values[14] * other.z + @values[15] * 1
    Vector3.new(
      @values[0] * other.x + @values[1] * other.y + @values[2] * other.z + @values[3] * 1,
      @values[4] * other.x + @values[5] * other.y + @values[6] * other.z + @values[7] * 1,
      @values[8] * other.x + @values[9] * other.y + @values[10] * other.z + @values[11] * 1
    ) / scale
  end

  def determinant
    @values[0]  * @values[5]  * @values[10] * @values[15] -
    @values[0]  * @values[5]  * @values[11] * @values[14] +
    @values[0]  * @values[9]  * @values[14] * @values[7]  -
    @values[0]  * @values[9]  * @values[6]  * @values[15] +
    @values[0]  * @values[13] * @values[6]  * @values[11] -
    @values[0]  * @values[13] * @values[10] * @values[7]  -
    @values[4]  * @values[1]  * @values[10] * @values[15] +
    @values[4]  * @values[1]  * @values[11] * @values[14] -
    @values[4]  * @values[9]  * @values[14] * @values[3]  +
    @values[4]  * @values[9]  * @values[2]  * @values[15] -
    @values[4]  * @values[13] * @values[2]  * @values[11] +
    @values[4]  * @values[13] * @values[10] * @values[3]  +
    @values[8]  * @values[1]  * @values[6]  * @values[15] -
    @values[8]  * @values[1]  * @values[14] * @values[7]  +
    @values[8]  * @values[5]  * @values[14] * @values[3]  -
    @values[8]  * @values[5]  * @values[2]  * @values[15] +
    @values[8]  * @values[13] * @values[2]  * @values[7]  -
    @values[8]  * @values[13] * @values[6]  * @values[3]  -
    @values[12] * @values[1]  * @values[6]  * @values[11] +
    @values[12] * @values[1]  * @values[10] * @values[7]  -
    @values[12] * @values[5]  * @values[10] * @values[3]  +
    @values[12] * @values[5]  * @values[2]  * @values[11] -
    @values[12] * @values[9]  * @values[2]  * @values[7]  +
    @values[12] * @values[9]  * @values[6]  * @values[3]
  end

  def transpose
    Matrix44.new(
      @values[0], @values[4], @values[8],  @values[12],
      @values[1], @values[5], @values[9],  @values[13],
      @values[2], @values[6], @values[10], @values[14],
      @values[3], @values[7], @values[11], @values[15]
    )
  end

  #def cofactor
  #
  #end
  #
  #def adjoint
  #
  #end

  def inverse

  end

  def to_s

  end

  def == other
    (0...16).to_a.each do |i|
      return false unless @values[i].approx(other.values[i])
    end
    true
  end

end
