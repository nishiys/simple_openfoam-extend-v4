FROM ubuntu:bionic
MAINTAINER nishiys
RUN apt-get update \
	&& apt-get install -y \
        # from the installation guide
        git-core \
        build-essential \
        binutils-dev \
        cmake \
        flex \
        zlib1g-dev \
        qt4-dev-tools \
        libqt4-dev \
        libncurses5-dev \
        libxt-dev \
        rpm \
        mercurial \
        graphviz \
        python \
        python-dev \
        gcc-5 \
        g++-5 \
		# fundamentals
        vim \
		ssh \
		sudo \
		wget \
		software-properties-common \
    # shrink the image size
	&&  apt-get clean \
    &&	rm -rf /var/lib/apt/lists/*

# 
RUN useradd --user-group --create-home --shell /bin/bash foam_user ;\
	echo "foam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# change the user who conduct the following commands
USER foam_user

# get the source code from github
RUN cd $HOME \
    && mkdir foam \
    && cd foam \
    && git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 ./foam-extend-4.0

# compile on bash
## change the shell to bash (since Docker 1.12)
SHELL ["/bin/bash", "-c"]

RUN cd $HOME/foam/foam-extend-4.0 \
    # preparation
    && echo export WM_THIRD_PARTY_USE_BISON_27=1  >> etc/prefs.sh \
    && echo export QT_SELECT=qt4  >> etc/prefs.sh \
    && echo "export WM_CC='gcc-5'"  >> etc/prefs.sh \
    && echo "export WM_CXX='g++-5'"  >> etc/prefs.sh \
    && echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh \
    # source the shell script
    && source ./etc/bashrc \
    # alias setting
    && echo "alias fe40='source \$HOME/foam/foam-extend-4.0/etc/bashrc'" >> $HOME/.bashrc \
    # preparation
    && sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' $HOME/foam/foam-extend-4.0/ThirdParty/tools/makeThirdPartyFunctionsForRPM \
    && sed -i -e 's/gcc/\$(WM_CC)/' $HOME/foam/foam-extend-4.0/wmake/rules/linux64Gcc/c \
    && sed -i -e 's/g++/\$(WM_CXX)/' $HOME/foam/foam-extend-4.0/wmake/rules/linux64Gcc/c++ \
    # Allwmake (it takes a lot of time)
    && ./Allwmake.firstInstall

