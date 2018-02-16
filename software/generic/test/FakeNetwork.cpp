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

#include "FakeNetwork.hpp"
#include <cstdio>
#include "../NetworkManager.hpp"

#define DEBUG

FakeNetwork::FakeNetwork() {
  setMillis(0);

  for (int i = 0; i < kNumNodes; i++) {
    advanceMillis(1);
    stateMachines[i] = new RadioStateMachine(new NetworkManager(&radios[i]));
    stateMachines[i]->Tick();
  }
}

void FakeNetwork::Tick() {
  // Note: this means that a sender will receive its own packet. This is OK,
  // since senders should be ignoring their own packets anyway, because of the
  // repeater functionality.
  for (int i = 0; i < kNumNodes; i++) {
    radios[i].setReceivedPacket(packet);
  }
  packet = nullptr;

#ifdef DEBUG
  printf("Running FakeNetwork::Tick at %u millis\n", millis());
#endif

  for (int i = 0; i < kNumNodes; i++) {
#ifdef DEBUG
    printf("Node %d state before: %d\n", i,
           stateMachines[i]->GetCurrentState());
#endif
    stateMachines[i]->Tick();
#ifdef DEBUG
    printf("Node %d state after: %d\n", i, stateMachines[i]->GetCurrentState());
#endif

    if (packet == nullptr) {
      packet = radios[i].getSentPacket();
      if (packet != nullptr) {
        printf("Node %d sending type %d\n", i, packet->type);
      }
    }

#ifdef DEBUG
    printf("\n");
#endif
  }
}
