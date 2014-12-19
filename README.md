MI-est
======

Estimator for mutual information, with the required KDE package.

Before running, you will probably need to compile some C files. Running
@kde/mex/makemex.m should do this. If you have issues, there is some
documentation here:

http://www.ics.uci.edu/~ihler/code/kde.html



Then, ideally, you should just need to call

>> MI_est(Xs, Ys)

for appropriate Xs and Ys as we discussed. test_MI.m contains an example usage.
If needed, you can play around with the parameters a bit, as discussed in
MI_est.m.
