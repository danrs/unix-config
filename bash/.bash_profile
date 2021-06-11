if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Setting PATH for brew
    PATH="`brew --prefix`/bin:${PATH}"
    export PATH
    export PATH="/usr/local/opt/openssl/bin:$PATH"
    export PATH="/usr/local/opt/ruby/bin:$PATH"
    export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
fi
