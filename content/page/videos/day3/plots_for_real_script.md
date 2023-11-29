# Plots for Real

__Hello, this is local news reporter Lois Jones here to report on the extreme penguin conditions we have been seeing. 
The penguins seems to be growing at an alarming rate which is expected to exceed all expectations and estimations.__

__We are cutting live to our reporter Jane Francis who is currently on the scene - what can you tell us Jane?__

_Thank you Lois. We have direct quote from an eye-witness from the R/V Topsy-Scurvy that claims that the penguins are growing. 
In fact they have just shared some disturbing data with us that penguins growth appears to nearing the speed of light! 
This chart depicting mean bill length in mm showing the drastic increasing year on year was produced by the analytic bot on the R/V Topsy-Scurvy using
`ggplot2` and I must say it looks highly professional._

_They've even shared the code they used to create. I'm here now with the an expert in the field of R programming who is good enough to explain this to us and the people watching at home._

_What can you tell us about this code and it's purpose Professor Cowells?_

Well as you can see the first thing they are doing, which is extremely smart by the way, is to call their libraries - including a fairly new one called `ggthemes`.

Next we get into the meat of the code which created the graphic and I want to call you and your viewers attention to this line right here
Notice the tight limits and the specification of the limts in the first place. Not starting your plots at 0 can often make them misleading 
If we change that line to go from 0 to 47.2 we go from this very extreme image to something much less worrisome.

The other line of code that I noticed is the addition of the `geom_line`, by creating this red arrow showing the upward trajectory, it can be very alarming.
I would recommend removing the line and letting the data speak for itself rather than forcing my opinion on others.

_Professor - would you comment on the use of labels to incite panic?_

Well, I don't think I would say that they incited a _panic_ but they do lend themselves to exargeration, with a few small changes you should be able to get
a much more reasonable title and subtitle. I also think the addtion of axis labels is a good habit to get into.

_What is your opinion on the addition of an extra library just for themes?_

There's nothing wrong with using packages, but I also think there are some excellent themes already available in ggplot such as `theme_bw` and `theme_minimal`
Using built in themes can make plots easier for others to replicate since they won't need to install another package to run your code.

There, a much more reasonable graphic of the data I would say.

_Thank you for that blow-by-blow assessment professor. You heard it here first folks - penguin bills are increasing at a very modest rate if at all. More local news starts at 8._
