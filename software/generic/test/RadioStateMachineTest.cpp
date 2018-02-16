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
#include "FakeRadio.hpp"

TEST(RadioStateMachine, initializes) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
}

TEST(RadioStateMachine, becomesMasterAfterTimeout) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);

  setMillis(RadioStateMachine::kSlaveNoPacketTimeout + 1);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);
}

TEST(RadioStateMachine, sendsHeartbeats) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  setMillis(RadioStateMachine::kSlaveNoPacketTimeout + 1);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);
  RadioPacket *packet = radio.getSentPacket();
  EXPECT_NE(packet, nullptr);
  EXPECT_EQ(packet->type, HEARTBEAT);

  advanceMillis(RadioStateMachine::kMasterHeartbeatInterval);
  stateMachine->Tick();
  packet = radio.getSentPacket();
  EXPECT_NE(packet, nullptr);
  EXPECT_EQ(packet->type, HEARTBEAT);

  advanceMillis(RadioStateMachine::kMasterHeartbeatInterval);
  stateMachine->Tick();
  packet = radio.getSentPacket();
  EXPECT_NE(packet, nullptr);
  EXPECT_EQ(packet->type, HEARTBEAT);
}

TEST(RadioStateMachine, doesntBecomeMasterIfReceivesPackets) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);
  RadioPacket packet;
  packet.packetId = 1;
  packet.type = HEARTBEAT;
  packet.dataLength = 0;

  radio.setReceivedPacket(&packet);
  advanceMillis(RadioStateMachine::kSlaveNoPacketTimeout - 1);
  advanceMillis(2);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);

  advanceMillis(RadioStateMachine::kMasterHeartbeatInterval);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);

  advanceMillis(RadioStateMachine::kMasterHeartbeatInterval);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
}

TEST(RadioStateMachine, respectsClaimMaster) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
  setMillis(RadioStateMachine::kSlaveNoPacketTimeout + 1);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);

  RadioPacket packet;
  packet.packetId = 1;
  packet.type = CLAIM_MASTER;
  packet.dataLength = 0;
  radio.setReceivedPacket(&packet);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
}

TEST(RadioStateMachine, doesElectionAndBecomesSlave) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  setMillis(RadioStateMachine::kSlaveNoPacketTimeout + 1);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);

  RadioPacket packet;
  // The random ID for master election is in the range [1, 0xFFFF)
  packet.packetId = 0xFFFF;
  packet.type = HEARTBEAT;
  packet.dataLength = 0;
  radio.setReceivedPacket(&packet);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Slave);
}

TEST(RadioStateMachine, doesElectionAndBecomesMaster) {
  setMillis(0);
  FakeRadio radio;
  NetworkManager *networkManager = new NetworkManager(&radio);
  RadioStateMachine *stateMachine = new RadioStateMachine(networkManager);

  setMillis(RadioStateMachine::kSlaveNoPacketTimeout + 1);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);

  RadioPacket packet;
  // The random ID for master election is in the range [1, 0xFFFF)
  packet.packetId = 0;
  packet.type = HEARTBEAT;
  packet.dataLength = 0;
  radio.setReceivedPacket(&packet);
  stateMachine->Tick();
  EXPECT_EQ(stateMachine->GetCurrentState(), RadioState::Master);

  RadioPacket *receivedPacket = radio.getSentPacket();
  EXPECT_NE(receivedPacket, nullptr);
  EXPECT_EQ(receivedPacket->type, CLAIM_MASTER);
}
