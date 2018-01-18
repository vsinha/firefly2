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
  void setReceivePacket(RadioPacket *packet);
  RadioPacket *getSentPacket();

 private:
  RadioPacket *receivedPacket;
  RadioPacket *sentPacket;
};

#endif
