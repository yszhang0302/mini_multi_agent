; Auto-generated. Do not edit!


(cl:in-package system_package-msg)


;//! \htmlinclude robot_feedback.msg.html

(cl:defclass <robot_feedback> (roslisp-msg-protocol:ros-message)
  ((robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:fixnum
    :initform 0)
   (robot_state
    :reader robot_state
    :initarg :robot_state
    :type cl:string
    :initform ""))
)

(cl:defclass robot_feedback (<robot_feedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_feedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_feedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_package-msg:<robot_feedback> is deprecated: use system_package-msg:robot_feedback instead.")))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_package-msg:robot_id-val is deprecated.  Use system_package-msg:robot_id instead.")
  (robot_id m))

(cl:ensure-generic-function 'robot_state-val :lambda-list '(m))
(cl:defmethod robot_state-val ((m <robot_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_package-msg:robot_state-val is deprecated.  Use system_package-msg:robot_state instead.")
  (robot_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_feedback>) ostream)
  "Serializes a message object of type '<robot_feedback>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_feedback>) istream)
  "Deserializes a message object of type '<robot_feedback>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_feedback>)))
  "Returns string type for a message object of type '<robot_feedback>"
  "system_package/robot_feedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_feedback)))
  "Returns string type for a message object of type 'robot_feedback"
  "system_package/robot_feedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_feedback>)))
  "Returns md5sum for a message object of type '<robot_feedback>"
  "b52bed208b6aaa52d30f0cbe649c3fa0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_feedback)))
  "Returns md5sum for a message object of type 'robot_feedback"
  "b52bed208b6aaa52d30f0cbe649c3fa0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_feedback>)))
  "Returns full string definition for message of type '<robot_feedback>"
  (cl:format cl:nil "uint8 robot_id~%string robot_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_feedback)))
  "Returns full string definition for message of type 'robot_feedback"
  (cl:format cl:nil "uint8 robot_id~%string robot_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_feedback>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'robot_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_feedback>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_feedback
    (cl:cons ':robot_id (robot_id msg))
    (cl:cons ':robot_state (robot_state msg))
))
