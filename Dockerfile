#Work from the latest Haskell image.
FROM haskell:8

#Update apt-get and get vim.
RUN apt-get update -y && apt-get install -y vim \
libnss-sss && apt-get install -y git-core 

#Make a new user (haskelluser).
RUN useradd -ms /bin/bash haskelluser

#Create a new group.
RUN addgroup --gid 1024 haskellgroup

#Give newgroup access to haskelluser.
RUN usermod -a -G haskellgroup haskelluser

#Set the haskelluser.
USER haskelluser

#Add stuff to path.
RUN export PATH="/opt/ghc/8.6.3/bin/:/usr/local/bin:/usr/bin:/opt/cabal/2.4/bin:/bin"

#Grab libraries that MoveAnnotateMerge.hs requires.
RUN cabal update
RUN cabal install split
RUN cabal install process
RUN cabal install boxes
RUN cabal install regex-compat
RUN cabal install temporary

#Change working directory to /home/haskelluser.
WORKDIR "/home/haskelluser"

#Git clone the repository to /home/haskelluser.
RUN git clone https://github.com/Matthew-Mosior/Move-Annotate-Merge.git

#Set alias in bashrc to use MAM.
RUN echo "alias MAM='/home/haskelluser/Move-Annotate-Merge/bin/MAM'" > /home/haskelluser/.bashrc

#Source bashrc.
RUN /bin/bash -c "source /home/haskelluser/.bashrc"
