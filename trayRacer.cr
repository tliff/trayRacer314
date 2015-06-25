require "./src/**"

scene = [Sphere.new(Vector3.new(0,0,0), 1)]

canvas = Canvas.new(200,200)

renderer = Renderer.new(canvas, scene)


pp (Vector3.new(1,1,1) + Vector3.new(2,2,2)).norm.length
