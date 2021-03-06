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

#include "RadioStateMachine.hpp"
#include <cstdio>

RadioStateMachine::RadioStateMachine(NetworkManager *networkManager)
    : networkManager(networkManager) {
  state = RadioState::Slave;
  nextState = RadioState::Slave;
  beginSlave();
}

RadioState RadioStateMachine::GetCurrentState() { return state; }

void RadioStateMachine::Tick() {
  RadioEventData data;
  data.packet = nullptr;
  data.timerExpired = false;

  RadioPacket packet;

  // Note: only allow one event type per iteration. This makes the handler
  // functions simpler (and less error prone).
  if (networkManager->receive(packet)) {
    data.packet = &packet;
  } else if (timerExpiresAt && millis() > timerExpiresAt) {
    data.timerExpired = true;
  }

  if (data.packet != nullptr || data.timerExpired) {
    switch (state) {
      case RadioState::Slave:
        handleSlaveEvent(data);
        break;

      case RadioState::Master:
        handleMasterEvent(data);
        break;
    }
  }

  if (nextState != state) {
    switch (nextState) {
      case RadioState::Slave:
        beginSlave();
        break;

      case RadioState::Master:
        beginMaster();
        break;
    }
    state = nextState;
    // 0 is disabled. Clear the timer - the state will probably set this
    // anyway.
    setTimer(0);
  }

  state = nextState;
}

void RadioStateMachine::handleSlaveEvent(RadioEventData &data) {
  // If the timer fired, then we haven't received a packet in a while and should
  // become master
  if (data.packet != nullptr) {
    if (data.packet->type == HEARTBEAT) {
      setTimer(kSlaveNoPacketTimeout);
    }
  } else if (data.timerExpired) {
    nextState = RadioState::Master;
  }
}

void RadioStateMachine::PerformMasterElection(RadioPacket *receivedPacket) {
  // Master election: generate a random number. If our number is greater
  // than the packet's ID, become master. Otherwise, become slave.
  const uint16_t ourId = random(1, 0xFFFF);
  if (ourId > receivedPacket->packetId) {
    packet.type = CLAIM_MASTER;
    packet.dataLength = 0;
    networkManager->send(packet);
  } else {
    nextState = RadioState::Slave;
  }
}

void RadioStateMachine::handleMasterEvent(RadioEventData &data) {
  if (data.packet != nullptr) {
#ifdef DEBUG
    printf("Received type %d\n", data.packet->type);
#endif
    switch (data.packet->type) {
      case HEARTBEAT:
        PerformMasterElection(data.packet);
        break;

      case CLAIM_MASTER:
        nextState = RadioState::Slave;
        break;
    }
  } else if (data.timerExpired) {
    SendHeartbeat();
  }
}

void RadioStateMachine::beginSlave() { setTimer(kSlaveNoPacketTimeout); }

void RadioStateMachine::beginMaster() {
  SendHeartbeat();
  setTimer(kMasterHeartbeatInterval);
}

void RadioStateMachine::setTimer(uint16_t delay) {
  timerExpiresAt = millis() + delay;
}

void RadioStateMachine::SendHeartbeat() {
  packet.type = HEARTBEAT;
  packet.dataLength = 0;
  networkManager->send(packet);
}
