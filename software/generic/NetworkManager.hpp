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

#ifndef __NETWORK_MANAGER_H__
#define __NETWORK_MANAGER_H__

#include "Radio.hpp"
#include "Types.hpp"

class NetworkManager {
 public:
  NetworkManager(Radio *const radio);

  /**
   * Checks if a packet is available. If so, performs network functions (e.g.
   * rebroadcasting), copies the packet into the passed-in struct, and
   * returns true. If no packet is available, returns false.
   */
  bool receive(RadioPacket &packet);

  /**
   * Sends the given packet.
   */
  void send(RadioPacket &packet);

  // Public for testing
  static const uint8_t kRecentIdsCacheSize = 5;

 private:
  void AddToRecentIdsCache(uint16_t id);

  Radio *const radio;

  /**
   * We maintain a circular buffer of the most recent packet IDs seen. When a
   * packet is sent or received, its packet ID is added to this buffer, and the
   * LRU ID is dropped.
   */
  uint16_t recentIdsCache[kRecentIdsCacheSize];
  uint8_t recentIdsCacheIndex;
};

#endif
