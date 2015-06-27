require "./src/**"

scene = [Sphere.new(Vector3.new(0,0,0), 1)]

canvas = Canvas.new(1000,1000)

renderer = Renderer.new(canvas, scene)

writer = TgaWriter.new(File.open("test.tga", "wb"))

(0...canvas.height).to_a.each do |y|
  (0...canvas.width).to_a.each do |z|
    ray = Ray.new(
      Vector3.new(10,0,0),
      Vector3.new(-1,(y-(canvas.height/2))/3000.0,(z-(canvas.width/2))/3000.0).norm
    )
    if scene.any?{|e| e.intersect(ray)}
      canvas[y,z] = [255_u8, 255_u8, 255_u8]
    end
  end
end

writer.write(canvas)
