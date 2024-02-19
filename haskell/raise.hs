-- a single step for raising
raiseStep :: Num m => m -> m -> Int -> m;
raiseStep result base remaining = 
    if remaining > 0 
        then raiseStep (result * base) base (remaining-1)
        else result

-- definition of raising to
raise :: Num m => m -> Int -> m;
raise = raiseStep 1

-- the main function
main = putStrLn ("4^5 is " ++ show (raise 4 5))
