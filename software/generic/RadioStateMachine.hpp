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

#ifndef __RADIO_STATE_MACHINE_H__
#define __RADIO_STATE_MACHINE_H__

#include "NetworkManager.hpp"
#include "Types.hpp"

/**
 * The data passed to a state when an event occurs.
 */
struct RadioEventData {
  /**
   * The packet that was received, or null if no packet was received.
   */
  RadioPacket *packet;

  /**
   * Whether a timer expired.
   */
  bool timerExpired;
};

/**
 * The possible states for this state machine.
 */
enum class RadioState {
  Slave,
  Master,
};

class RadioStateMachine {
 public:
  RadioStateMachine(NetworkManager *networkManager);

  RadioState GetCurrentState();

  /** Runs the state machine. Should be called frequently. */
  void Tick();

  // Tuning constants. Public for testing.
  /**
   * If a slave doesn't receive a heartbeat for this long, it'll become master.
   * TODO: add a random factor.
   */
  static const uint16_t kSlaveNoPacketTimeout = 5000;

  /**
   * When master, send a heartbeat this often.
   */
  static const uint16_t kMasterHeartbeatInterval = 1000;

 private:
  // Handler functions
  void handleSlaveEvent(RadioEventData &data);
  void handleMasterEvent(RadioEventData &data);

  // These are called when a state is entered.
  void beginSlave();
  void beginMaster();

  // Support functions
  /** Sets an event to fire delay milliseconds from now.  */
  void setTimer(uint16_t delay);

  /** Performs master election based on the received heartbeat. */
  void PerformMasterElection(RadioPacket *receivedPacket);

  /** Sends a heartbeat packet. */
  void SendHeartbeat();

  NetworkManager *const networkManager;

  /** The current state. */
  RadioState state;

  /** If not equal to state, the next state. */
  RadioState nextState;

  /** The milliseconds when the timer expires and fires an event. */
  uint16_t timerExpiresAt = 0;

  RadioPacket packet;
};

#endif
