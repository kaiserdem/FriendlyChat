//
//  Message.swift
//  FriendlyChat
//
//  Created by Kaiserdem on 29.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import Foundation

class Message {
  private var _content: String
  private var _senderId: String
  
  var content: String {
    return _content
  }
  
  var senderId: String {
    return _senderId
  }
  
  init(content: String, senderId: String) {
    self._content = content
    self._senderId = senderId
  }
}
