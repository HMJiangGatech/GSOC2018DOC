a = matrix(1:12,ncol=3)
b = matrix(rep(2,9),ncol=3)

c = MatrixMul(a,b)

test_that("MatrixMul is C++ implemented matrix multiplication function", {
  expect_equal(c, a%*%b)
})
