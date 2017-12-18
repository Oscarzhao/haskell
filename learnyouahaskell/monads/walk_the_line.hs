-- Walk the line
--
-- Pierre has decided to take a break from his job at the fish farm and try
-- tightrope walking.  He's not that bad at it, but he does have one problem:
-- birds keep landing on his balancing pole!  They come and they take a short
-- rest, chat with their avian friends and then take off in search of breadcrumbs.
-- This wouldn't bother him so much if the number of birds on the left side of 
-- the pole was always equal to the number of birds on the right side.  But
-- sometimes, all the birds decide that they like one side better and so they
-- throw hime off balance, which results in an embarrassing tumble for Pierre
-- (he's using a safety net).
--
-- Let's say that he keeps his balance if the number of birds on the left side
-- of the pole and on the right side of the pole is within three.  So if there's
-- one bird on the right side and four birds on the left side, he's okay.  But
-- if a fifth bird lands on the lfet side, then he loses his balance and take
-- a dive.

type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right) 
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs ((right + n) - left) < 4 = Just (left, right + n)
    | otherwise                     = Nothing


-- Usage (function chaining):
-- Just (0,0) >>= landLeft 3 >>= landRight 3 >>= landRight 4
-- return (0,0) >>= landLeft 3 >>= landRight 2 >>= landRight 2 >>= landLeft 1 >>= landRight (-4)


-- We can make a function that let Pierre slip
banana :: Pole -> Maybe Pole
banana _ = Nothing

-- Usage:
-- return (0,0) >>= landLeft 1 >> banana >>= landRight 1 
-- expect Nothing
