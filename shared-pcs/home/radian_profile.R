
# Está duplicado en profile.R ya que le falta configuración a Radian. 
library(here)

this_dir <- here()

mappings <- list(
    list(key="-", value=" <- " ),
    list(key="m", value=" %>% "))
	
options(radian.escape_key_map = mappings,
        radian.editing_mode = "vi")

# enable the [prompt_toolkit](https://python-prompt-toolkit.readthedocs.io/en/master/index.html) [`auto_suggest` feature](https://python-prompt-toolkit.readthedocs.io/en/master/pages/asking_for_input.html#auto-suggestion)
# this option is experimental and is known to break python prompt, use it with caution
options(radian.auto_suggest = FALSE)

# highlight matching bracket
options(radian.highlight_matching_bracket = FALSE)

# auto indentation for new line and curly braces
options(radian.auto_indentation = TRUE)
options(radian.tab_size = 4)

# pop up completion while typing
options(radian.complete_while_typing = TRUE,
        radian.completion_prefix_length = 2,
        radian.completion_timeout = 0.05,
        radian.completion_adding_spaces_around_equals = TRUE)

# automatically adjust R buffer size based on terminal width
options(radian.auto_width = TRUE)

# insert new line between prompts
options(radian.insert_new_line = FALSE)

# About history commands
options(radian.global_history_file = "~/.radian_history",
        radian.local_history_file = ".radian_history",
        radian.history_search_no_duplicates = FALSE,
        radian.history_search_ignore_case = TRUE)

# custom prompt for different modes
options(radian.prompt        = "\033[0;34mr$>\033[0m ")
options(radian.shell_prompt  = "\033[0;31m#!>\033[0m ")
options(radian.browse_prompt = "\033[0;33mBrowse[{}]>\033[0m ")

# show vi mode state when radian.editing_mode is `vi`
options(radian.show_vi_mode_prompt = TRUE)
options(radian.vi_mode_prompt = "\033[0;34m[{}]\033[0m ")

# stderr color format
options(radian.stderr_format = "\033[0;31m{}\033[0m")

# Reticulate Python runtime and prompt triggers `~`
options(radian.force_reticulate_python = FALSE,
        radian.enable_reticulate_prompt = TRUE)

source(this_dir %>% file.path("profile.R"))
