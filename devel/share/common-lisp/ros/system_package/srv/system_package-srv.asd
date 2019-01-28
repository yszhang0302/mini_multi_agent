
(cl:in-package :asdf)

(defsystem "system_package-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robot_1" :depends-on ("_package_robot_1"))
    (:file "_package_robot_1" :depends-on ("_package"))
    (:file "robot_2" :depends-on ("_package_robot_2"))
    (:file "_package_robot_2" :depends-on ("_package"))
  ))