#!/usr/bin/env python

import roslib; roslib.load_manifest('beginner_tutorials')
import rospy
import actionlib
from beginner_tutorials.msg import *

if __name__ == '__main__':
	rospy.init_node('do_dishes_client')
	client = actionlib.SimpleActionClient('do_dishes', DoDishesAction)
	client.wait_for_server()

	goal = DoDishesGoal()
	goal.dishwasher_id = 1
	print "Requesting dishwasher %d"%(goal.dishwasher_id)

	client.send_goal(goal)
	client.wait_for_result(rospy.Duration.from_sec(5.0))

	result = client.get_result()
	print "Resulting dishwasher %d"%(result.total_dishes_cleaned)