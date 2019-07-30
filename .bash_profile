if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Setting PATH for brew
    PATH="`brew --prefix`/bin:${PATH}"
    export PATH
fi
