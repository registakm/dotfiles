# --------------------------------
# ----------- rbenv --------------
# --------------------------------
if [ -d ${HOME}/.rbenv  ] ; then
    export PATH=${HOME}/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# --------------------------------
# ----------- nodebrew -----------
# --------------------------------
if [ -d ${HOME}/.nodebrew  ] ; then
    export PATH=${HOME}/.nodebrew/current/bin:$PATH
fi

# --------------------------------
# -------------- go --------------
# --------------------------------
export GOPATH=${HOME}
export PATH=$GOPATH/bin:$PATH