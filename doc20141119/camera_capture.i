/*
 * camera_capture.i
 * kind: kadai
 * location: P20
 * author: Kentaro Wada <www.kentaro.wada@gmail.com>
 */
%module camera_capture
%{
extern void camera_capture(int cam_id);
%}
%include "camera_capture.c"
