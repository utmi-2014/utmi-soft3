#!/usr/bin/env python
import roslib; roslib.load_manifest('beginner_tutorials')
import rospy
from std_msgs.msg import String
from beginner_tutorials.msg import Hello


def talker2():
    pub = rospy.Publisher('chatter2', Hello)
    rospy.init_node('talker2')
    while not rospy.is_shutdown():
        str = "hello, world {}".format(rospy.get_time())
        rospy.loginfo(str)

        hello = Hello()
        hello.hello = "world"
        hello.pos.x = 0;
        hello.pos.y = 1;
        hello.pos.z = 2;
        pub.publish(hello)
        rospy.sleep(1.)

        pub.publish(hello)
        rospy.sleep(1.)


if __name__ == '__main__':
    try:
        talker2()
    except rospy.ROSInterruptException:
        pass
