#include "ros/ros.h"
#include "system_package/robot_feedback.h"//msg
#include "system_package/robot_1.h"//srv
#include <string>
#include <boost/thread/thread.hpp>

system_package::robot_feedback msg;
std::string state = "ready";

void timer_callback(const ros::TimerEvent&)
{
    ROS_INFO("node_robot_1 finished current task");
    printf("node_robot_1 finished current task\n");
    state = "ready";
}

void function_timer(void)
{
    ros::NodeHandle nh;
    ros::Timer timer = nh.createTimer(ros::Duration(5.0),timer_callback);
    ROS_INFO("node_robot_1 is timing 5s for current task");
    printf("node_robot_1 is timing 5s for current task\n");
    ros::AsyncSpinner spinner(0);
    spinner.start();
    ros::waitForShutdown();
}

bool task_recv_process(system_package::robot_1::Request &req,system_package::robot_1::Response &res)
{
    res.task_state = "executing";
    ROS_INFO("request to robot_1:task_id=%d",req.task_id);
    printf("request to robot_1:task_id=%d\n",req.task_id);
    ROS_INFO("sending back response from robot_1:%s",res.task_state.c_str());
    printf("sending back response from robot_1:%s\n",res.task_state.c_str());

    state = "executing";

    boost::thread thread_timer(function_timer);
    ROS_INFO("node_robot_1 is executing task_id:%d",req.task_id);
    printf("node_robot_1 is executing task_id:%d\n",req.task_id);

    return true;
}

void function_publish(void)
{
    ros::NodeHandlePtr node = boost::make_shared<ros::NodeHandle>();
    ros::Publisher pub = node->advertise<system_package::robot_feedback>("agent_feedback",10);
    ros::Rate loop_rate(5);

    while (ros::ok())
    {
        msg.robot_id = 1;
        msg.robot_state = state;
        pub.publish(msg);
        ROS_INFO("node_robot_1 is publishing msg:(%d,%s)",msg.robot_id,msg.robot_state.c_str());
        printf("node_robot_1 is publishing msg:(%d,%s)\n",msg.robot_id,msg.robot_state.c_str());

        loop_rate.sleep();
    }
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"node_robot_1");

    boost::thread thread_publish(function_publish);
  
    ros::NodeHandle nh;
    ros::ServiceServer service = nh.advertiseService("agent_task_1",task_recv_process);
    ROS_INFO("node_robot_1 is ready to receive task");
    printf("node_robot_1 is ready to receive task\n");
    ros::spin();
 
    thread_publish.join();
    return 0;
}

