The clock applet sets a pipe character `|` between Date and Time when shown side by side.  
The pip looks horrible.  
We can easily add an emoji -for example 🕗️- in the date format, but still cannot remove the pipe easily.  
The solution is to:  
```shell
$ vim $(locate DigitalClock.qml)  
```  
and then find some commands, which I'm sure Google or ChatGPT can help me remember about.  

The next steps would be:  
1. Incorporate the change in the "Digital Clock Settings".  
2. Modify the emoji 🕗️, to change every half hour according to its time.  
3. That's pretty much a big deal.   
