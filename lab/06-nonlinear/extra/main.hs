{-
    A function that returns a list of approximations for the Newton Raphson method,
    given the function, its derivative and an initial approximation 
-}
newtonRaphson :: (Double -> Double) -> (Double -> Double) -> Double -> [Double]
newtonRaphson f df = iterate (\x -> x - (f x) / (df x))

secant :: (Double -> Double) -> Double -> Double -> [Double]
secant f x0 x1 = result
    where
        result = x0 : x1 : zipWith (\prev curr -> curr - (f curr) * (curr - prev) / ((f curr) - (f prev)))
                    result (tail result)

newtonSol = newtonRaphson (\x -> x * x - 4) (2 *) 4

secantSol = secant (\x -> x * x - 4) 4 3