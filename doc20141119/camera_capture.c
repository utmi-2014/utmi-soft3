/*
 * Author:    Kentaro Wada
 * Mail:      www.kentaro.wada@gmail.com
 * URL:       http://wkentaro.com
 * Created:   2014-06-29
 * Filename:  camera_capture.c
 */
#include <cv.h>
#include <ctype.h>
#include <highgui.h>


void camera_capture(int cam_id) {
    int c=0; // キーボード入力用
    CvCapture *capture=0; // カメラキャプチャ用
    IplImage *frame=0; // キャプチャ画像用

    // カメラキャプチャ取得用
    capture = cvCreateCameraCapture(cam_id);

    // キャプチャ画像を表示するためのウィンドウを作成
    cvNamedWindow("Capture", CV_WINDOW_AUTOSIZE);

    while (1) {
        // キャプチャ画像を取得
        frame = cvQueryFrame(capture);

        // 取得したキャプチャ画像を表示
        cvShowImage("Capture", frame);

        // キーボード入力を待つ
        c = cvWaitKey (2);
        if (c == '\x1b') { // Escキー
            break;
        }
    }
}
