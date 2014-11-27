module 'Timings'

# Voor het vergroten van de timing als het nodig is.
multi = 5

Timings.firstEvent = Utils.toMilliseconds(1*multi)
Timings.secondEvent = Timings.firstEvent + Utils.toMilliseconds(3*multi)
Timings.thirdEvent = Timings.secondEvent + Utils.toMilliseconds(5*multi)
Timings.forthEvent = Timings.thirdEvent + Utils.toMilliseconds(3*multi)
Timings.fifthEvent = Timings.forthEvent + Utils.toMilliseconds(5*multi)
