using Replace
using Test
@testset "Replace" begin

@testset "Basic" begin
  @test 1.0 == @replace sin cos sin(0.0)
  @test 0.0 == @replace cos sin cos(0.0)
  # make sure that we haven't clobbered the definition of sin and cos
  @assert cos(0.0) == 1.0 && sin(0.0) == 0.0

  replacement() = pi
  @test pi + exp(0) == @replace rand replacement rand() + exp(0)
end

@testset "Inside a function" begin
  function foo()
    x = @replace cos sin cos(0.0)
  end
  @test foo() == 0.0
end

end
