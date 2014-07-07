"Since the 19th century, home knitting machines were a popular manufacturing tool which allowed knitters to produce rapidly knitted items to sell or for household crafts.  The possibility to use jacquard patterns started with the use of punched hole cards and began to be computerised in the 80's. The immediate and low raw material resource needed to produce a knitted surface is what make knitting machines mobile and accessible for experimenting and prototyping. Since the late 80's these knitting machines have stopped been produced.
These last years hackers and makers have started to open up knitting machines and found new ways to hack them by allowing the machines to be controlled directly by a modern computer. These hacked knitting machines become a sort of textile printer. Having a direct communication between digital tools and the knitting machine pushes the boundaries of traditional knitted patterns and gives us the opportunity to think of new way's in conceiving patterns . 

In this workshop we will explore how our knitting machine can become a way of printing out (generated) data on a textile surface.
First we will show how the monitoring system and the arduino controls the knitting machine as well as how the mechanics of the machine works in general.
We will then experiment hands on with field recordings of our surrounding environment. Our sound cartography’s will then be translated and visualised with Pure Data and then sent to the machine to be knitted out. These patterns can be read as a visual translation of rhythms, silences and noises embedded in a palpable knitted surface." Claire Williams.
        

BROTHER KH-940
  - 200 steacheses
  - Two end lines sensors
  - One encoder wille with two sensors mounted on it :
    - The first sensor is composed by two photointerrupter embedded into a single component (SHARP IA06). This double sensor is used to sens the direction ot the carriage
    - The second sensor is a single photo interrupter used for the phase (SHARP - GP1A52LRJ00F)

For technicals specifications see the service manual : http://maurin.box.free.fr/_DOCs/brother_kh930_knitting_machine_service_manual.pdf

To use this programme you must start to knit from the left side of the knitting machine.
The carriage must be out of the sticheses

  - This code is a fork from Sokanno KnitHack project : https://github.com/sokanno/KnitHack
  - The Git repository : https://github.com/MaurinElectroTextile/KnitHack_KH940


Pure Data (patch)

This patch analyse a sound with an FFT algorithm to identify all of it's frequencies
If the volume of a specific frequency is above a certain threshold the corresponding stitch is triggered.

Sound track format
  - track : mono
  - format : .WAV
  - freq : 44100 Hz
  - resolution : 16 bits
