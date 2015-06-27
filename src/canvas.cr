class Canvas
  getter width
  getter height
  def initialize width, height
    @width = width
    @height = height
    @data = Array.new(width*height){|i| [0_u8,0_u8,0_u8]}
  end

  def [] x,y
      @data[x*@width+y]
  end
  def []= x,y, z
    @data[x*@width+y] = z
  end

end