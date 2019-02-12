#Work from the latest Fedora linux.
#FROM fedora:latest
FROM haskell:8

USER root

#Make .cabal file.
#RUN touch .cabal

#Set custom export.
#RUN export HOME=$TMP

#Grab updates.
#RUN dnf install -y haskell-platform
#RUN dnf install cabal-install

#Grab libraries that MoveAnnotateMerge.hs requires.
RUN cabal update
RUN cabal install split
RUN cabal install process
RUN cabal install boxes
RUN cabal install regex-compat
RUN cabal install temporary
