#include "ros/ros.h"
#include "system_package/robot_feedback.h"//msg
#include "system_package/robot_2.h"//srv
#include <string>

ros::Publisher pub;
system_package::robot_feedback msg;

void timer_callback(const ros::TimerEvent& event)
{
    ROS_INFO("node_robot_2 finished current task");

    msg.robot_id = 2;
    msg.robot_state = "ready";
    pub.publish(msg);
    ROS_INFO("node_robot_2 is publishing msg:%d,%s",msg.robot_id,msg.robot_state.c_str());
}

bool task_recv_process(system_package::robot_2::Request &req,system_package::robot_2::Response &res)
{
    res.task_state = "executing";
    ROS_INFO("request to robot_2:task_id=%d",req.task_id);
    ROS_INFO("sending back response from robot_2:%s",res.task_state.c_str());

    msg.robot_id = 2;
    msg.robot_state = "executing";
    pub.publish(msg);
    ROS_INFO("node_robot_2 is publishing msg:%d,%s",msg.robot_id,msg.robot_state.c_str());

    ros::NodeHandle nh;
    ros::Timer timer = nh.createTimer(ros::Duration(3.0),timer_callback);
    ROS_INFO("node_robot_2 is timing 3s for task_id:%d",req.task_id);

    return true;
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"node_robot_2");
   
    ros::NodeHandle nh;
    pub = nh.advertise<system_package::robot_feedback>("agent_feedback",1000);
    msg.robot_id = 2;
    msg.robot_state = "ready";
    pub.publish(msg);
    ROS_INFO("node_robot_2 is publishing msg:%d,%s",msg.robot_id,msg.robot_state.c_str());

    ros::ServiceServer service = nh.advertiseService("agent_task_2",task_recv_process);
    ROS_INFO("node_robot_2 is ready to receive task");
    ros::spin();
       
    return 0;
}

