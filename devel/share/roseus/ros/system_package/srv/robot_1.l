;; Auto-generated. Do not edit!


(when (boundp 'system_package::robot_1)
  (if (not (find-package "SYSTEM_PACKAGE"))
    (make-package "SYSTEM_PACKAGE"))
  (shadow 'robot_1 (find-package "SYSTEM_PACKAGE")))
(unless (find-package "SYSTEM_PACKAGE::ROBOT_1")
  (make-package "SYSTEM_PACKAGE::ROBOT_1"))
(unless (find-package "SYSTEM_PACKAGE::ROBOT_1REQUEST")
  (make-package "SYSTEM_PACKAGE::ROBOT_1REQUEST"))
(unless (find-package "SYSTEM_PACKAGE::ROBOT_1RESPONSE")
  (make-package "SYSTEM_PACKAGE::ROBOT_1RESPONSE"))

(in-package "ROS")





(defclass system_package::robot_1Request
  :super ros::object
  :slots (_task_id ))

(defmethod system_package::robot_1Request
  (:init
   (&key
    ((:task_id __task_id) 0)
    )
   (send-super :init)
   (setq _task_id (round __task_id))
   self)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:serialization-length
   ()
   (+
    ;; uint8 _task_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _task_id
       (write-byte _task_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _task_id
     (setq _task_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass system_package::robot_1Response
  :super ros::object
  :slots (_task_state ))

(defmethod system_package::robot_1Response
  (:init
   (&key
    ((:task_state __task_state) "")
    )
   (send-super :init)
   (setq _task_state (string __task_state))
   self)
  (:task_state
   (&optional __task_state)
   (if __task_state (setq _task_state __task_state)) _task_state)
  (:serialization-length
   ()
   (+
    ;; string _task_state
    4 (length _task_state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _task_state
       (write-long (length _task_state) s) (princ _task_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _task_state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _task_state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass system_package::robot_1
  :super ros::object
  :slots ())

(setf (get system_package::robot_1 :md5sum-) "a78760cc430dc3134f2177ea1154f152")
(setf (get system_package::robot_1 :datatype-) "system_package/robot_1")
(setf (get system_package::robot_1 :request) system_package::robot_1Request)
(setf (get system_package::robot_1 :response) system_package::robot_1Response)

(defmethod system_package::robot_1Request
  (:response () (instance system_package::robot_1Response :init)))

(setf (get system_package::robot_1Request :md5sum-) "a78760cc430dc3134f2177ea1154f152")
(setf (get system_package::robot_1Request :datatype-) "system_package/robot_1Request")
(setf (get system_package::robot_1Request :definition-)
      "uint8 task_id
---
string task_state

")

(setf (get system_package::robot_1Response :md5sum-) "a78760cc430dc3134f2177ea1154f152")
(setf (get system_package::robot_1Response :datatype-) "system_package/robot_1Response")
(setf (get system_package::robot_1Response :definition-)
      "uint8 task_id
---
string task_state

")



(provide :system_package/robot_1 "a78760cc430dc3134f2177ea1154f152")


