describe "Vector3" do
  describe "add" do
    it "should work for integers" do
      (Vector3.new(1,2,3) + Vector3.new(3,2,0)).should eq(Vector3.new(4,4,3))
    end
    it "should work for floats" do
      (Vector3.new(0.2, 0.7, 0.8) + Vector3.new(1.3, 9.2, 1.4)).should eq(Vector3.new(1.5,9.9,2.2))
    end
  end

  describe "subtract" do
    it "should work for integers" do
      (Vector3.new(1,2,3) - Vector3.new(3,2,0)).should eq(Vector3.new(-2,0,3))
    end
    it "should work for floats" do
      (Vector3.new(0.2, 0.7, 0.8) - Vector3.new(1.3, 9.2, 1.4)).should eq(Vector3.new(-1.1,-8.5,-0.6))
    end
  end

  describe "length" do
    it "should work with a null vector" do
      Vector3.new(0,0,0).length.should eq 0
    end
  end

  describe "norm" do
    it "should work" do
      Vector3.new(19,2,18).norm.should eq(Vector3.new(0.723842, 0.0761939, 0.685745))
    end
  end

  describe "scale up" do
    it "should scale with 0" do
      (Vector3.new(192.38,128,-3.21) * 0.0).should eq(Vector3.new(0,0,0))
    end
    it "should scale with -1" do
      (Vector3.new(192.38,128,-3.21) * -1.0).should eq(Vector3.new(-192.38,-128,3.21))
    end
  end

  describe "scale down" do
    it "should scale down with 2" do
      (Vector3.new(192.38,128,-3.21) / 2.0).should eq(Vector3.new(96.19, 64, -1.605))
    end
  end

  describe "cross" do
    it "should calculate the cross product" do
      (Vector3.new(1,2,3) % Vector3.new(2,3,4)).should eq(Vector3.new(-1,2,-1))
    end
  end

  describe "dot" do
    it "should calculate the dot product" do
      (Vector3.new(1,2,3) * Vector3.new(2,3,4)).should eq(20)
    end
  end

end