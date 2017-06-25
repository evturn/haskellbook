cattyConny :: String -> String -> String
cattyConny x y = x ++ " hmm " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "ooook"

frappe :: String -> String
frappe = flippy "blarf"