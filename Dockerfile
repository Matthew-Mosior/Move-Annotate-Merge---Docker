#Work from the latest Haskell image.
FROM haskell:8

#Make a new user.
RUN useradd -ms /bin/bash newuser

#Create a new user (newuser).
USER newuser

#Make a new user.
#RUN useradd -ms /bin/bash newuser

#Login to newuser.
#RUN su - newuser

#Add stuff to path.
RUN export PATH="/opt/ghc/8.6.3/bin/:/usr/local/bin:/usr/bin:/opt/cabal/2.4/bin:/bin"

#Grab libraries that MoveAnnotateMerge.hs requires.
RUN cabal update
RUN cabal install split
RUN cabal install process
RUN cabal install boxes
RUN cabal install regex-compat
RUN cabal install temporary
