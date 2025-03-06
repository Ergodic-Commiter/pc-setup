
KARABINER_DEFAULT="$HOME/.config/karabiner/karabiner.json"
MY_KARABINER="$PWD/refs/my-libs/mac-apps/karabiner/my_config.json"

rm $KARABINER_DEFAULT
ln -s $MY_KARABINER $KARABINER_DEFAULT