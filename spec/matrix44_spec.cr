def test_matrix_1
  Matrix44.new(
    1.0, 2.0, 3.0, 4.0,
    4.0, 5.0, 1.0, 0.0,
    -9.0, 2.0, -17.0, 4.0,
    -49.0, 2.0, 0.0, 1.0
  )
end

def test_matrix_2
  Matrix44.new(
    4.0, -19.0, -4.0, 5.0,
    17.0, -5.0, 0.0, 3.0,
    9.0, -12.0, 7.0, 1.0,
    9.0, 0.0, 0.0, 17.0)
end

describe "Matrix44" do
  describe "scale" do
    it "should scale correctly" do
      (test_matrix_1 * 2.0).should eq(Matrix44.new(2.0, 4.0, 6.0, 8.0, 8.0, 10.0, 2.0, 0.0, -18.0, 4.0, -34.0, 8.0, -98.0, 4.0, 0.0, 2.0))
    end
  end

  describe "multiply" do
    it "should multiply with other matrices" do
      (test_matrix_1 * test_matrix_2).should eq(Matrix44.new(101.0, -65.0, 17.0, 82.0, 110.0, -113.0, -9.0, 36.0, -119.0, 365.0, -83.0, 12.0, -153.0, 921.0, 196.0, -222.0))
    end

    it "should multiply with vectors" do
      (test_matrix_1 * Vector3.new(-7.0,2.0,0.0)).should eq(Vector3.new(1/348.0,-3/58.0,71/348.0))
    end
  end

  describe "determinant" do
    it "should calculate the determinant" do
      test_matrix_1.determinant.should eq(-19970.0)
    end
  end

  describe "transpose" do
    it "should calculate the transpose" do
      test_matrix_1.transpose.should eq(Matrix44.new(1, 4, -9, -49, 2, 5, 2, 2, 3, 1, -17, 0, 4, 0, 4, 1))
    end
  end

 # describe "cofactor" do
 #   it "should calculate the cofactor" do
 #   end
 # end
 #
 # describe "adjoint" do
 #   it "should calculate the adjoint" do
 #   end
 # end

  describe "inverse" do
    it "should calculate the inverse" do
    end
  end

end