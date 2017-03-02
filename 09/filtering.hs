
multiplesOf3 = filter (\x -> rem x 3 == 0) [1..30]

noArticles xs = filter (\x -> x /= "the" && x /= "an" && x /= "a") $ words xs