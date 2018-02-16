#!/bin/bash

# Formats all of the source files using clang-format.
clang-format -i -style=Google $(find . -name *.[ch]pp)

# Inserts the license header
find . -name *.[ch]pp | xargs -n 1 ~/bin/autogen/autogen -c "Google LLC" -l apache -i
