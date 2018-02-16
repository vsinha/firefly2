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

#ifndef __FAKE_RADIO_H__
#define __FAKE_RADIO_H__

#include "../Radio.hpp"

class FakeRadio : public Radio {
 public:
  FakeRadio();

  // Overrides
  bool readPacket(RadioPacket &packet) override;
  void sendPacket(RadioPacket &packet) override;

  // Test methods
  void setReceivedPacket(RadioPacket *packet);
  RadioPacket *getSentPacket();

 private:
  RadioPacket *receivedPacket;
  RadioPacket *sentPacket;
};

#endif
