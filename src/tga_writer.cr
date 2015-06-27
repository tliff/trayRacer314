class TgaWriter
  def initialize io
    @io = io
  end

  def write buffer
    @io.write [0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, buffer.width%256, buffer.width/256, buffer.height%256, buffer.height/256, 0x20, 0x00].map{|b| b.to_u8}
    (0...(buffer.width)).each do |x|
      (0...(buffer.height)).each do |y|
        @io.write [buffer[x,y][0]]
        @io.write [buffer[x,y][1]]
        @io.write [buffer[x,y][2]]
        @io.write [0xFF_u8]
      end
    end
    @io.flush
  end

end