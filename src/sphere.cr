class Sphere
  def initialize center, radius
    @center = center
    @radius = radius
  end

  def intersect ray
    v = ray.origin - @center

    desc = ( (ray.direction * v )** 2 ) - (ray.direction *  ray.direction ) * ( v * v  - @radius*@radius );
    return false if desc < 0

    desc = Math.sqrt(desc)
    tmp = ray.direction * -1.0

    dista = (tmp * v + desc)
    distb = (tmp * v - desc)


    dista, distb = distb, dista if dista > distb

    dista, distb = distb, dista if dista < 0

    return false if dista < 0

    point = ray.origin + ray.direction*dista

    {point, (point - @center).norm }

  end

end