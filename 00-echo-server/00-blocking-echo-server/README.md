Blocking Echo Server
===

Prints data, received over TCP socket (using [Lazy I/O](http://book.realworldhaskell.org/read/io.html) 
which is [considered harmful™](http://stackoverflow.com/a/5892699)), blocking new connections to be
handled while that happens (i.e. we don't use [forkIO](http://hackage.haskell.org/package/base-4.7.0.2/docs/Control-Concurrent.html#v:forkIO) 
in this example, neither for accept loop, nor for the worker loop).
