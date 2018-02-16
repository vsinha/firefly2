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

#include "FakeRadio.hpp"

FakeRadio::FakeRadio() {
  receivedPacket = nullptr;
  sentPacket = nullptr;
}

bool FakeRadio::readPacket(RadioPacket &packet) {
  if (receivedPacket == nullptr) {
    return false;
  } else {
    memcpy(&packet, receivedPacket, sizeof(RadioPacket));
    return true;
  }
}

void FakeRadio::sendPacket(RadioPacket &packet) {
  // Note: this is sort-of wrong, since it just copies the pointer, not the
  // struct itself. However, since this is only used in tests, it's OK.
  sentPacket = new RadioPacket();
  memcpy(sentPacket, &packet, sizeof(RadioPacket));
}

void FakeRadio::setReceivedPacket(RadioPacket *packet) {
  receivedPacket = packet;
}

RadioPacket *FakeRadio::getSentPacket() {
  RadioPacket *thePacket = sentPacket;
  sentPacket = nullptr;
  return thePacket;
}
