// Auto-generated. Do not edit!

// (in-package system_package.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class robot_1Request {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.task_id = null;
    }
    else {
      if (initObj.hasOwnProperty('task_id')) {
        this.task_id = initObj.task_id
      }
      else {
        this.task_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_1Request
    // Serialize message field [task_id]
    bufferOffset = _serializer.uint8(obj.task_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_1Request
    let len;
    let data = new robot_1Request(null);
    // Deserialize message field [task_id]
    data.task_id = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'system_package/robot_1Request';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9740a70b18b29c0d20fc5d8dff911576';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 task_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_1Request(null);
    if (msg.task_id !== undefined) {
      resolved.task_id = msg.task_id;
    }
    else {
      resolved.task_id = 0
    }

    return resolved;
    }
};

class robot_1Response {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.task_state = null;
    }
    else {
      if (initObj.hasOwnProperty('task_state')) {
        this.task_state = initObj.task_state
      }
      else {
        this.task_state = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_1Response
    // Serialize message field [task_state]
    bufferOffset = _serializer.string(obj.task_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_1Response
    let len;
    let data = new robot_1Response(null);
    // Deserialize message field [task_state]
    data.task_state = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.task_state.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'system_package/robot_1Response';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'adf0f1fee599407543390220f159892a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string task_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_1Response(null);
    if (msg.task_state !== undefined) {
      resolved.task_state = msg.task_state;
    }
    else {
      resolved.task_state = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: robot_1Request,
  Response: robot_1Response,
  md5sum() { return 'a78760cc430dc3134f2177ea1154f152'; },
  datatype() { return 'system_package/robot_1'; }
};
