#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist, Vector3

# local libraries
from _waitkey import waitkey

def handle_key_options(key, linear, angular):
    direction, inc_or_dec = '', ''
    log = 'KeyOp: {} velocity {} [{}|{}]'
    if key == 'up':
        linear.x += 0.05
        direction = 'linear'
        inc_or_dec = 'incremented'
    elif key == 'down':
        linear.x -= 0.05
        direction = 'linear'
        inc_or_dec = 'decremented'
    elif key == 'left':
        angular.z += 0.33
        direction = 'angular'
        inc_or_dec = 'incremented'
    elif key == 'right':
        angular.z -= 0.33
        direction = 'angular'
        inc_or_dec = 'decremented'
    log = log.format(direction, inc_or_dec, linear.x, angular.z)
    return linear, angular, log


def velocity():
    # pub = rospy.Publisher('/my_commands/velocity', Twist)
    pub = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    rospy.init_node('my_keyop')
    linear = Vector3()
    angular = Vector3()
    while not rospy.is_shutdown():
        key = waitkey()
        if key is not None:
            linear, angular, log = handle_key_options(key, linear, angular)
            rospy.loginfo(log)
        pub.publish(linear=linear, angular=angular)


if __name__ == '__main__':
    try:
        velocity()
    except rospy.ROSInterruptException:
        pass
