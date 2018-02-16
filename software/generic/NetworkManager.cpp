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

#include "NetworkManager.hpp"

NetworkManager::NetworkManager(Radio *const radio) : radio(radio) {
  for (uint8_t i = 0; i < kRecentIdsCacheSize; i++) {
    recentIdsCache[i] = 0;
  }
  recentIdsCacheIndex = 0;
}

bool NetworkManager::receive(RadioPacket &packet) {
  if (!radio->readPacket(packet)) {
    return false;
  }

  // Rebroadcast the packet if we haven't seen it's ID recently.
  for (uint8_t i = 0; i < kRecentIdsCacheSize; i++) {
    if (recentIdsCache[i] == packet.packetId) {
      return true;
    }
  }

  radio->sendPacket(packet);
  AddToRecentIdsCache(packet.packetId);

  return true;
}

void NetworkManager::send(RadioPacket &packet) {
  packet.packetId = random(1, 0xFFFF);
  radio->sendPacket(packet);
  AddToRecentIdsCache(packet.packetId);
}

void NetworkManager::AddToRecentIdsCache(uint16_t id) {
  recentIdsCache[recentIdsCacheIndex++] = id;
  recentIdsCacheIndex %= kRecentIdsCacheSize;
}
