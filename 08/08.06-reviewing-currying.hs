cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-----------------------------------------------------------------------------
-- 1.
appedCatty' :: String
appedCatty' = appedCatty "woohoo!"

-----------------------------------------------------------------------------
-- 2.
frappe' :: String
frappe' = frappe "1"

-----------------------------------------------------------------------------
-- 3.
frappe'' :: String
frappe'' = frappe (appedCatty "2")

-----------------------------------------------------------------------------
-- 4.
appedCatty'' :: String
appedCatty'' = appedCatty (frappe "blue")

-----------------------------------------------------------------------------
-- 5.
cattyConny' :: String
cattyConny' = cattyConny (frappe "pink")
                         (cattyConny "green" (appedCatty "blue"))

-----------------------------------------------------------------------------
-- 6.
cattyConny'' :: String
cattyConny'' = cattyConny (flippy "Pugs" "are") "awesome"
