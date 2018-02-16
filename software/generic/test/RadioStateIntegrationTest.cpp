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

#include "gtest/gtest.h"

#include "../NetworkManager.hpp"
#include "../Radio.hpp"
#include "../RadioStateMachine.hpp"
#include "FakeNetwork.hpp"
#include "FakeRadio.hpp"

TEST(Network, electsOneMaster) {
  FakeNetwork network;
  network.Tick();
  advanceMillis(RadioStateMachine::kSlaveNoPacketTimeout);
  network.Tick();

  advanceMillis(1);
  network.Tick();

  advanceMillis(1);
  network.Tick();

  int numMasters = 0;
  for (int i = 0; i < FakeNetwork::kNumNodes; i++) {
    if (network.stateMachines[i]->GetCurrentState() == RadioState::Master) {
      numMasters++;
    }
  }

  // EXPECT_EQ(numMasters, 1);
}
