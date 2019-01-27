;; Auto-generated. Do not edit!


(when (boundp 'system_package::robot_feedback)
  (if (not (find-package "SYSTEM_PACKAGE"))
    (make-package "SYSTEM_PACKAGE"))
  (shadow 'robot_feedback (find-package "SYSTEM_PACKAGE")))
(unless (find-package "SYSTEM_PACKAGE::ROBOT_FEEDBACK")
  (make-package "SYSTEM_PACKAGE::ROBOT_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude robot_feedback.msg.html


(defclass system_package::robot_feedback
  :super ros::object
  :slots (_robot_id _robot_state ))

(defmethod system_package::robot_feedback
  (:init
   (&key
    ((:robot_id __robot_id) 0)
    ((:robot_state __robot_state) "")
    )
   (send-super :init)
   (setq _robot_id (round __robot_id))
   (setq _robot_state (string __robot_state))
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:robot_state
   (&optional __robot_state)
   (if __robot_state (setq _robot_state __robot_state)) _robot_state)
  (:serialization-length
   ()
   (+
    ;; uint8 _robot_id
    1
    ;; string _robot_state
    4 (length _robot_state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _robot_id
       (write-byte _robot_id s)
     ;; string _robot_state
       (write-long (length _robot_state) s) (princ _robot_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _robot_id
     (setq _robot_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _robot_state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get system_package::robot_feedback :md5sum-) "b52bed208b6aaa52d30f0cbe649c3fa0")
(setf (get system_package::robot_feedback :datatype-) "system_package/robot_feedback")
(setf (get system_package::robot_feedback :definition-)
      "uint8 robot_id
string robot_state

")



(provide :system_package/robot_feedback "b52bed208b6aaa52d30f0cbe649c3fa0")


