enum BtConnectionStatus {
  connecting,
  connected,
  error
}

extension BtConnectionStatusName on BtConnectionStatus{
  String get statusName {
    switch(this){
      case BtConnectionStatus.connecting: return 'Connecting';
      case BtConnectionStatus.connected: return 'Connected';
      case BtConnectionStatus.error: return 'Connection error';
    }
  }
}