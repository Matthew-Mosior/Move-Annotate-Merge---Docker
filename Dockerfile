#Work from the latest Fedora linux.
#FROM fedora:latest
FROM haskell:8

#Make new directory.
RUN mkdir new

#Move cabal config file to new.
RUN cabal --config-file="/new/.cabal/config" update

#Sed statements.
RUN sed -i 's/\/root/\/new/g' /new/.cabal/config 

#USER root

#Make .cabal file.
#RUN touch .cabal

#Set custom export.
#RUN export HOME=$TMP

#Grab the Haskell Platform.
#RUN dnf install -y haskell-platform
#RUN dnf install cabal-install

#RUN cabal user-config update

#Update Cabal Configuration File as to where to install directories.
#RUN echo "install dirs" >> /root/.cabal/config 

#Grab libraries that MoveAnnotateMerge.hs requires.
RUN cabal --config-file="/new/.cabal/config" update
RUN cabal --config-file="/new/.cabal/config" install split
RUN cabal --config-file="/new/.cabal/config" install process
RUN cabal --config-file="/new/.cabal/config" install boxes
RUN cabal --config-file="/new/.cabal/config" install regex-compat
RUN cabal --config-file="/new/.cabal/config" install temporary
