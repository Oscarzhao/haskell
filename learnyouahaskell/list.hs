describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "emtpy."
                                               [x] -> "singleton list."
                                               xs -> "a longer list."
