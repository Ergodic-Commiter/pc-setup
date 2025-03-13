

KARABINER_BIN='/Library/Application\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'
KARABINER_DEFAULT="$HOME/.config/karabiner/karabiner.json"
MY_KARABINER="$PWD/refs/my-libs/mac-apps/karabiner/my_config.json"

rm $KARABINER_DEFAULT
ln -s $MY_KARABINER $KARABINER_DEFAULT
alias karabiner-cli="$KARABINE_BIN/karabiner_cli"