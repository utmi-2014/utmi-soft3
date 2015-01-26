#include <beginner_tutorials/DoDishesAction.h>
#include <actionlib/server/simple_action_server.h>

typedef actionlib::SimpleActionServer<beginner_tutorials::DoDishesAction> Server;

void execute(const beginner_tutorials::DoDishesGoalConstPtr& goal, Server* as)
{
    as->setSucceeded();
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "do_dishes_server");
    ros::NodeHandle n;
    Server server(n, "do_dishes", boost::bind(&execute, _1, &server), false);
    server.start();

    ros::spin();

    return 0;
}
