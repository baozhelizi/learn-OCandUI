//
//  ViewController.h
//  UI
//
//  Created by aliang-imac on 2023/4/11.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>{
    
    UIView *_mainView;
    UILabel *_scoreLabel;
    UILabel *_highScoreLabel;
    UITextField *_arr[4][4];
    
}


@end

