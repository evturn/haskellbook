import           Criterion.Main
import qualified Data.Map       as M
import qualified Data.Set       as S

bumpIt (i, v) = (i + 1, v + 1)

m :: M.Map Int Int
m = M.fromList $ take 10000 stream
  where
    stream = iterate bumpIt (0, 0)

s :: S.Set Int
s = S.fromList $ take 10000 stream
  where
    stream = iterate (+1) 0

lookupMap :: Int -> Maybe Int
lookupMap i = M.lookup i m

lookupSet :: Int -> Maybe Int
lookupSet i = S.lookupIndex i s

main :: IO ()
main = defaultMain
  [ bench "lookup map" $
    whnf lookupMap 9999
  , bench "lookup set" $
    whnf lookupSet 9999
  ]
