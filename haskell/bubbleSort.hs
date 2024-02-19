-- type definition with constraints
bubbleSortStep :: (Ord v) => [v] -> Int -> Int -> Int -> [v]

-- sorting step, takes values, total length, no. of swaps, and current step
bubbleSortStep values total swaps step = do
    let index = step `mod` total
        x = values !! index
        y = values !! (index + 1)
        left = take index values 
        right = drop (index + 2) values
        sorted = left ++ (if x < y then [x, y] else [y, x]) ++ right
        swapcount = if sorted !! index == y then swaps + 1 else swaps
    
    if (step == 0) || (swapcount == 0) && (index == total)
        then values -- optimization: when no swapping occurs in an entire iteration, then it is sorted
        else bubbleSortStep sorted total 0 (step-1)

-- this calls bubbleSortStep by inferring the no. of steps (iterations x index)
bubbleSort :: (Ord v) => [v] -> [v]
bubbleSort values = do
    let total = length values-1
        steps = total^2
    bubbleSortStep values total 0 steps

{- 
  This is an example implementation of bubble sort in haskell,
  It has some optimizations but nothing too fancy.
-}
main = do
    let unsorted = [2,4,1,3,7,6,5]
    let sorted = bubbleSort unsorted
    putStrLn ("Original: " ++ show unsorted)
    putStrLn ("  Sorted: " ++ show sorted)