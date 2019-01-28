; Auto-generated. Do not edit!


(cl:in-package system_package-srv)


;//! \htmlinclude robot_2-request.msg.html

(cl:defclass <robot_2-request> (roslisp-msg-protocol:ros-message)
  ((task_id
    :reader task_id
    :initarg :task_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass robot_2-request (<robot_2-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_2-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_2-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_package-srv:<robot_2-request> is deprecated: use system_package-srv:robot_2-request instead.")))

(cl:ensure-generic-function 'task_id-val :lambda-list '(m))
(cl:defmethod task_id-val ((m <robot_2-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_package-srv:task_id-val is deprecated.  Use system_package-srv:task_id instead.")
  (task_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_2-request>) ostream)
  "Serializes a message object of type '<robot_2-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_2-request>) istream)
  "Deserializes a message object of type '<robot_2-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_2-request>)))
  "Returns string type for a service object of type '<robot_2-request>"
  "system_package/robot_2Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_2-request)))
  "Returns string type for a service object of type 'robot_2-request"
  "system_package/robot_2Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_2-request>)))
  "Returns md5sum for a message object of type '<robot_2-request>"
  "a78760cc430dc3134f2177ea1154f152")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_2-request)))
  "Returns md5sum for a message object of type 'robot_2-request"
  "a78760cc430dc3134f2177ea1154f152")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_2-request>)))
  "Returns full string definition for message of type '<robot_2-request>"
  (cl:format cl:nil "uint8 task_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_2-request)))
  "Returns full string definition for message of type 'robot_2-request"
  (cl:format cl:nil "uint8 task_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_2-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_2-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_2-request
    (cl:cons ':task_id (task_id msg))
))
;//! \htmlinclude robot_2-response.msg.html

(cl:defclass <robot_2-response> (roslisp-msg-protocol:ros-message)
  ((task_state
    :reader task_state
    :initarg :task_state
    :type cl:string
    :initform ""))
)

(cl:defclass robot_2-response (<robot_2-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_2-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_2-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_package-srv:<robot_2-response> is deprecated: use system_package-srv:robot_2-response instead.")))

(cl:ensure-generic-function 'task_state-val :lambda-list '(m))
(cl:defmethod task_state-val ((m <robot_2-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_package-srv:task_state-val is deprecated.  Use system_package-srv:task_state instead.")
  (task_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_2-response>) ostream)
  "Serializes a message object of type '<robot_2-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'task_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'task_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_2-response>) istream)
  "Deserializes a message object of type '<robot_2-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task_state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'task_state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_2-response>)))
  "Returns string type for a service object of type '<robot_2-response>"
  "system_package/robot_2Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_2-response)))
  "Returns string type for a service object of type 'robot_2-response"
  "system_package/robot_2Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_2-response>)))
  "Returns md5sum for a message object of type '<robot_2-response>"
  "a78760cc430dc3134f2177ea1154f152")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_2-response)))
  "Returns md5sum for a message object of type 'robot_2-response"
  "a78760cc430dc3134f2177ea1154f152")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_2-response>)))
  "Returns full string definition for message of type '<robot_2-response>"
  (cl:format cl:nil "string task_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_2-response)))
  "Returns full string definition for message of type 'robot_2-response"
  (cl:format cl:nil "string task_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_2-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'task_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_2-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_2-response
    (cl:cons ':task_state (task_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot_2)))
  'robot_2-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot_2)))
  'robot_2-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_2)))
  "Returns string type for a service object of type '<robot_2>"
  "system_package/robot_2")