Socket examples for humans
===

Because writing and reading C code is inhumane, we present a number of
studies in Haskell aimed to shed some light on how protocols get implemented,
how data gets from one computer to another, what sockets are and what they
aren't.

For ease of understanding, I'm not using do-notation in these studies.

Requirements
---

I don't plan to include any packaging here, as I package and build this project
locally with [Nix packaging tools](http://nixos.org). In my opinion, there is no
proper way to package and build Haskell projects (cabal sandboxes almost cut it
though) other than using Cabal *with* Nix. However Nix isn't adopted widely enough,
so I don't add related files to the project. 

So, with this disclaimer in mind, here are the requirements —

 - GHC should be able to find Network Haskell package 
 - Shell should be able to find nc (netcat) binary
 - You must run a UNIX-like system

Contributing
---

 - I'll gladly merge equivalent code in other programming languages to this
   repository.
 - I'll gladly merge detailed instructions about building this thing in a cabal 
   sandbox.
