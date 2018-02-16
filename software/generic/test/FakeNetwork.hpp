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

#ifndef __FAKE_NETWORK_H__
#define __FAKE_NETWORK_H__

#include "../Radio.hpp"
#include "../RadioStateMachine.hpp"
#include "FakeRadio.hpp"

class FakeNetwork {
 public:
  FakeNetwork();

  /**
   * Runs one cycle of packet distribution. Runs the Tick method on each
   * state manager, and sends up to one packet to the network.
   */
  void Tick();

  static const long kNumNodes = 5;
  RadioStateMachine *stateMachines[kNumNodes];

 private:
  FakeRadio radios[kNumNodes];
  RadioPacket *packet = nullptr;
};

#endif
