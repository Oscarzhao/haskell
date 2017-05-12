# Heathrow to London

## Description

Our next problem is this: your plane has just landed in England and you rent a car. 
You have a meeting really soon and you have to get from Heathrow Airport to London 
as fast as you can (but safely!).

There are two main roads going from Heathrow to London and there's a number of 
regional roads crossing them. It takes you a fixed amount of time to travel from 
one crossroads to another. It's up to you to find the optimal path to take so 
that you get to London as fast as you can! You start on the left side and can 
either cross to the other main road or go forward.

![London's ReadMap](roads.png "RoadMap")

As you can see in the picture, the shortest path from Heathrow to London in this 
case is to start on main road B, cross over, go forward on A, cross over again 
and then go forward twice on B. If we take this path, it takes us 75 minutes. 
Had we chosen any other path, it would take more than that.

Our job is to make a program that takes input that represents a road system and 
print out what the shortest path across it is. Here's what the input would look 
like for this case:

```
50  
10  
30  
5  
90  
20  
40  
2  
25  
10  
8  
0 
```

Reference: [Solve Problem](http://learnyouahaskell.com/functionally-solving-problems "solve problem")
