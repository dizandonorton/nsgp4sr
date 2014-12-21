nsgp4sr
=======

Novelty Search, as defined in (Lehman & Stanley, 2008), is a technique used in Evolutionary Robotics to substitute the fitness
function with a novelty measure in order to explore the behavioral space of the individuals (solutions) during generations. 
Novelty Search is having recognized success in many experiments involving Evolutionary Robotics, Neuro-Evolution and other 
Evolutionary Computation subfields.

nsgp4sr is an algorithm that implements the novelty search approach for symbolic regression problems in Genetic Programming.
This is the second try at the problem of applying novelty search for symbolic regression, being the first one presented in
(Martinez et al., 2013).

nsgp4sr was developed using the plug and play capability of GPLAB (http://gplab.sourceforge.net). GPLab is a Genetic Programming toolbox for Matlab. You can download the latest version of GPLab <a href="http://gplab.sourceforge.net/download.html">here</a>. I made small changes to the original implementation of GPLab, so you can just clone/download nsgp4sr and use it as if you were simply using GPLab. Please note that all the credits of GPLab is given to Sara Silva, PhD.