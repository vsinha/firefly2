#!/bin/bash -eu
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Formats all of the source files using clang-format.
clang-format -i -style=Google $(find . -name *.[ch]pp)

# Inserts the license header
for file in $(find . | grep -v ".\/.git" | grep -v format.sh  |grep ".*.\([ch]pp\|sh\)$"); do
  if ! grep "Google LLC" $file > /dev/null; then
    ~/bin/autogen/autogen -c "Google LLC" -l apache -i $file
  fi
done
