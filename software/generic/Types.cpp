// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// TODO: High-level file comment.

#include "Types.hpp"

uint16_t random(uint16_t max) { return rand() % max; }

uint16_t random(uint16_t min, uint16_t max) { return min + (rand() % max); }

// Oh noes, a global variable!
uint16_t currentTime = 0;
uint16_t millis() { return currentTime; }

void setMillis(uint16_t time) { currentTime = time; }

void advanceMillis(uint16_t time) { currentTime += time; }
