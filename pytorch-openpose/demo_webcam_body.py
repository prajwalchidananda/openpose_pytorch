#!/usr/bin/env python3
import sys
import os
ROOT = os.path.dirname(os.path.abspath(__file__))
PYPATH = os.path.join(ROOT, 'python')
sys.path.append(ROOT)
sys.path.append(PYPATH)
sys.path.insert(0, 'python')
print(sys.path)
import cv2
import model
import util
from hand import Hand
from body import Body
import matplotlib.pyplot as plt
import copy
import numpy as np

body_estimation = Body(os.path.join(ROOT, 'model/body_pose_model.pth'))
hand_estimation = Hand(os.path.join(ROOT, 'model/hand_pose_model.pth'))

cap = cv2.VideoCapture(0)
cap.set(3, 640)
cap.set(4, 480)
while True:
    ret, oriImg = cap.read()
    candidate, subset = body_estimation(oriImg)
    canvas = copy.deepcopy(oriImg)
    canvas = util.draw_bodypose(canvas, candidate, subset)

    cv2.imshow('demo', canvas)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

