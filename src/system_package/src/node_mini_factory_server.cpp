#include "ros/ros.h"
#include "system_package/robot_feedback.h"//msg
#include "system_package/robot_1.h"//srv
#include "system_package/robot_2.h"//srv
#include <string>

int task_id_assigned_to_robot1 = 0;
int task_id_assigned_to_robot2 = 0;

ros::ServiceClient client1;
ros::ServiceClient client2;
system_package::robot_1 srv1;
system_package::robot_2 srv2;

void agent_feedback_callback(const system_package::robot_feedback::ConstPtr& msg)
{
    ROS_INFO("node_mini_factory_server is receiving msg from robot:(%d,%s)",msg->robot_id,msg->robot_state.c_str());
    printf("node_mini_factory_server is receiving msg from robot:(%d,%s)\n",msg->robot_id,msg->robot_state.c_str());

    if(msg->robot_id == 1)
    {
        if(msg->robot_state == "ready")
        {
            ROS_INFO("robot1 is ready for receive new task");
            printf("robot1 is ready for receive new task\n");
            
            if(task_id_assigned_to_robot1 == 5)
                task_id_assigned_to_robot1 = 0;
            task_id_assigned_to_robot1++;
            srv1.request.task_id = task_id_assigned_to_robot1;
            ROS_INFO("node_mini_factory_server is assigning task:%d to robot1",srv1.request.task_id);
            printf("node_mini_factory_server is assigning task:%d to robot1\n",srv1.request.task_id);

            if(client1.call(srv1))
            {
                ROS_INFO("robot1 response: task %d %s",srv1.request.task_id,srv1.response.task_state.c_str());
                printf("robot1 response: task %d %s\n",srv1.request.task_id,srv1.response.task_state.c_str());
            }
            else
            {
                ROS_ERROR("Failed to call srv1 from node_mini_factory_server");
                printf("Failed to call srv1 from node_mini_factory_server\n");
            }
        }
        else if(msg->robot_state == "executing")
        {
            ROS_INFO("robot1 is executing task:%d",task_id_assigned_to_robot1);
            printf("robot1 is executing task:%d\n",task_id_assigned_to_robot1);
        }
    }
    else if(msg->robot_id == 2)
    {
        if(msg->robot_state == "ready")
        {
            ROS_INFO("robot2 is ready for receive new task");
            printf("robot2 is ready for receive new task\n");

            if(task_id_assigned_to_robot2 == 5)
                task_id_assigned_to_robot2 = 0;
            task_id_assigned_to_robot2++;
            srv2.request.task_id = task_id_assigned_to_robot2;
            ROS_INFO("node_mini_factory_server is assigning task:%d to robot2",srv2.request.task_id);
            printf("node_mini_factory_server is assigning task:%d to robot2\n",srv2.request.task_id);

            if(client2.call(srv2))
            {
                ROS_INFO("robot2 response: task %d %s",srv2.request.task_id,srv2.response.task_state.c_str());
                printf("robot2 response: task %d %s\n",srv2.request.task_id,srv2.response.task_state.c_str());
            }
            else
            {
                ROS_ERROR("Failed to call srv2 from node_mini_factory_server");
                printf("Failed to call srv2 from node_mini_factory_server\n");
            }
        }
        else if(msg->robot_state == "executing")
        {
            ROS_INFO("robot2 is executing task:%d",task_id_assigned_to_robot2);
            printf("robot2 is executing task:%d\n",task_id_assigned_to_robot2);
        }   
    }
}

int main(int argc,char **argv)
{
    ros::init(argc,argv,"node_mini_factory_server");
    ros::NodeHandle nh;

    client1 = nh.serviceClient<system_package::robot_1>("agent_task_1");
    client2 = nh.serviceClient<system_package::robot_2>("agent_task_2");
    ros::Subscriber sub = nh.subscribe<system_package::robot_feedback>("agent_feedback",1000,agent_feedback_callback);
    ROS_INFO("node_mini_factory_server is listening the topic:/agent_feedback");
    printf("node_mini_factory_server is listening the topic:/agent_feedback\n");

    ros::spin();
    return 0;
}
