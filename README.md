# PAC-AntiMagicBullet


WARNING (Thanks for the pmpy to reporting this vulnerability.)
Just a heads-up but the way you have this script setup can be exploited by any lua executor and just mass ban your players on the server by using the pac:magicbullet event you have setup in your main.lua file that’s on the server-side.

Players can easily make a for loop in a lua executor to loop through 1-X numbers and ban any players online on the server.

A simple client-side dump by a cheater with a half decent brain will find this and most likely try to exploit it.

Our other resources you can be interested

* https://forum.cfx.re/t/paid-double-connection-fix-pac-doubleconnection/5002895
* https://forum.cfx.re/t/paid-anti-event-triggering-pac-antieventtriggering/5010660
* https://forum.cfx.re/t/paid-standalone-anti-event-triggering-client-sided-pac-anticlienteventtriggering/5017448
* https://forum.cfx.re/t/paid-anti-meta-files-pac-antimetafiles/5009622
* https://forum.cfx.re/t/paid-anti-e-n-menu-pac-antiemenu/5013600
* https://forum.cfx.re/t/paid-anti-no-props-pac-antinoprop/5014329
