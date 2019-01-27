
(cl:in-package :asdf)

(defsystem "system_package-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robot_feedback" :depends-on ("_package_robot_feedback"))
    (:file "_package_robot_feedback" :depends-on ("_package"))
  ))