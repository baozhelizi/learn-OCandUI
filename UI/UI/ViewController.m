//
//  ViewController.m
//  UI
//
//  Created by aliang-imac on 2023/4/11.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    _mainView = [[UIView alloc]init];
    _mainView.frame = CGRectMake(0, 40, 360, 360);
    _mainView.userInteractionEnabled = YES;
    _mainView.backgroundColor = [UIColor grayColor];
    
    UILabel *scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 400, 90, 40)];
    scoreLabel.text = @"Score:";
    scoreLabel.font = [UIFont systemFontOfSize:15];
    scoreLabel.backgroundColor = [UIColor lightGrayColor];
    
    _scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 430, 90, 40)];
    _scoreLabel.backgroundColor = [UIColor whiteColor];
    
    UILabel *scoreLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(220, 400, 100, 40)];
    scoreLabel1.text = @"High Score:";
    scoreLabel1.font = [UIFont systemFontOfSize:15];
    scoreLabel1.backgroundColor = [UIColor lightGrayColor];
    
    _highScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 430, 100, 40)];
    _highScoreLabel.backgroundColor = [UIColor whiteColor];
    
    [_mainView addSubview:scoreLabel];
    [_mainView addSubview:scoreLabel1];
    [_mainView addSubview:_scoreLabel];
    [_mainView addSubview:_highScoreLabel];
    
    [self creatStartView];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeLeft];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLeft addTarget:self action:@selector(swipeLeftAct:)];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeRight];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRight addTarget:self action:@selector(swipeRightAct:)];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeUp];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [swipeUp addTarget:self action:@selector(swipeUpAct:)];
    
    UISwipeGestureRecognizer* swipeDown = [[UISwipeGestureRecognizer alloc]init];
    [_mainView addGestureRecognizer:swipeDown];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [swipeDown addTarget:self action:@selector(swipeDownAct:)];
    
    [self.view addSubview:_mainView];
}


int start_count_2 = 0;
int move_state = YES;
int view_state[4][4];
- (void)creatStartView
{
    while (1) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                if (start_count_2 < 2) {
                    if (random() % 4 == 3) {
//                        [self randomNum];
                        move_state = YES;
                        start_count_2++;
                    }
                }
            }
        }
        
        if (start_count_2 == 2) {
            break;
        }
    }
    NSString *str = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()] usedEncoding:nil error:nil];
    _highScoreLabel.text = str;
}

- (void)randomNum
{
    if (move_state == YES) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                if (view_state[i][j] == 0) {
                    if (random() % 2 == 0) {
                        UITextField *_2_start = [[UITextField alloc]init];
                        
                        _2_start.backgroundColor = [UIColor lightGrayColor];
                        _2_start.textAlignment = NSTextAlignmentCenter;
                        
                        _2_start.borderStyle = UITextBorderStyleRoundedRect;
                        _2_start.frame = CGRectMake(j * 90 + 5, i * 90 + 5, 80, 80);
                        [UIView animateWithDuration:0.5 animations:^{
                            _2_start.frame = CGRectMake(j * 90, i * 90, 90, 90);
                        }];
                        _2_start.text = @"2";
                        _2_start.tag = 2;
                        view_state[i][j] = 1;
                        NSLog(@"view    128: %d i:%d j:%d", view_state[i][j],i,j);
                        _2_start.enabled = NO;
                        _arr[i][j] = _2_start;
                        move_state = NO;
                        [_mainView addSubview:_2_start];
                        return;
                    }else if (random() % 2 == 1){
                        UITextField *_4_start = [[UITextField alloc]init];
                        
                        _4_start.backgroundColor = [UIColor lightGrayColor];
                        _4_start.textAlignment = NSTextAlignmentCenter;
                        
                        _4_start.borderStyle = UITextBorderStyleRoundedRect;
                        _4_start.frame = CGRectMake(j * 90 + 5, i * 90 + 5, 80, 80);
                        [UIView animateWithDuration:0.5 animations:^{
                            _4_start.frame = CGRectMake(j * 90, i * 90, 90, 90);
                        }];
                        _4_start.text = @"4";
                        _4_start.tag = 4;
                        view_state[i][j] = 1;
                        NSLog(@"view    148: %d i:%d j:%d", view_state[i][j],i,j);
                        _4_start.enabled = NO;
                        _arr[i][j] = _4_start;
                        move_state = NO;
                        [_mainView addSubview:_4_start];
                        return;
                    }
                }
            }
        }
    }
}

//左
- (void)swipeLeftAct:(UISwipeGestureRecognizer*)swipeLeft
{
    for (int i = 0; i < 4; i++) {
        for(int j = 0; j <= 3; j++){
            if(view_state[i][j] == 0){
                for(int o = j + 1; o <= 3; o++){
                    if(view_state[i][o] == 1){
                        UITextField *view = _arr[i][o];
                        
                        CGRect frame = view.frame;
                        view_state[i][o] = 0;
                        
                        frame.origin.x = j * 90;
                        view.frame = frame;
                        
                        _arr[i][j] = view;
                        _arr[i][o] = nil;
                        
                        view_state[i][j] = 1;
                        
                        move_state = YES;
                        j--;
                        break;
                    }
                }
            }else {
                for(int o = j + 1; o <= 3; o++){
                    if(_arr[i][o].tag == _arr[i][j].tag && view_state[i][j] == 1){
                        [self changeFunc:o andI:i andJ:j];
                        break;
                    }
                }
            }
        }
    }
    [self resultShow];
    [self randomNum];
    move_state=NO;
}

//右
- (void)swipeRightAct:(UISwipeGestureRecognizer*)swipeRight
{
    for (int i = 0; i < 4; i++) {
        for(int j = 3; j >= 0; j--){
            if(view_state[i][j] == 0){
                for(int o = j - 1; o >= 0; o--){
                    if(view_state[i][o] == 1){
                        UITextField *view = _arr[i][o];
                        
                        CGRect frame = view.frame;
                        view_state[i][o] = 0;
                        
                        frame.origin.x = j * 90;
                        view.frame = frame;
                        
                        _arr[i][j] = view;
                        _arr[i][o] = nil;
                        
                        view_state[i][j] = 1;
                        
                        move_state = YES;
                        j++;
                        break;
                    }
                }
            }else {
                for(int o = j - 1; o >= 0; o--){
                    if(_arr[i][o].tag == _arr[i][j].tag && view_state[i][j] == 1){
                        [self changeFunc:o andI:i andJ:j];
                        break;
                    }
                }
            }
        }
    }
    [self resultShow];
    [self randomNum];
    move_state=NO;
}


//上
- (void)swipeUpAct:(UISwipeGestureRecognizer*)swipeUp
{
    for (int j = 0; j < 4; j++) {
        for(int i = 0; i <= 3; i++){
            if(view_state[i][j] == 0){
                for(int o = i + 1; o <= 3; o++){
                    if(view_state[o][j] == 1){
                        UITextField *view = _arr[o][j];
                        
                        CGRect frame = view.frame;
                        view_state[o][j] = 0;
                        
                        frame.origin.y = i * 90;
                        view.frame = frame;
                        
                        _arr[i][j] = view;
                        _arr[o][j] = nil;
                        
                        view_state[i][j] = 1;
                        move_state = YES;
                        i--;
                        break;
                    }
                }
            }else {
                for(int o = i + 1; o <= 3; o++){
                    if(_arr[o][j].tag == _arr[i][j].tag && view_state[i][j] == 1){
                        [self changeFunc2:o andI:i andJ:j];
                        break;
                    }
                }
            }
        }
    }
 
    [self resultShow];
    [self randomNum];
    move_state = NO;
}


//下
- (void)swipeDownAct:(UISwipeGestureRecognizer*)swipeDown
{
    for (int j = 0; j < 4; j++) {
        for(int i = 3; i >=0 ; i--){
            if(view_state[i][j] == 0){
                for(int o = i - 1; o >=0 ; o--){
                    if(view_state[o][j] == 1){
                        UITextField *view = _arr[o][j];
                        
                        CGRect frame = view.frame;
                        view_state[o][j] = 0;
                        
                        frame.origin.y = i * 90;
                        view.frame = frame;
                        
                        _arr[i][j] = view;
                        _arr[o][j] = nil;
                        
                        view_state[i][j] = 1;
                        move_state = YES;
                        i++;
                        break;
                    }
                }
            }else {
                for(int o = i - 1; o >= 0; o--){
                    if(_arr[o][j].tag == _arr[i][j].tag && view_state[i][j] == 1){
                        [self changeFunc2:o andI:i andJ:j];
                        break;
                    }
                }
            }
        }
    }
    [self resultShow];
    [self randomNum];
    move_state = NO;
}


int count_result;
- (void)resultShow
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (view_state[i][j] == 1) {
                count_result++;
            }
            if ([_arr[i][j].text isEqual:@"2048"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"成功通关" preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:true completion:nil];
            }
        }
    }
    
    if (count_result == 16 && move_state == NO) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"再来一次" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:true completion:nil];
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            view_state[i][j] = 0;
            start_count_2 = 0;
            [_arr[i][j] removeFromSuperview];
            _arr[i][j] = nil;
        }
    }
    
    count_result = 0;
    move_state = YES;
    [self creatStartView];
}




int color_num;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


int score;
- (void)changeFunc:(int)o andI:(int)i andJ:(int)j
{
    UITextField *view = _arr[i][j];
    int num = (int)_arr[i][j].tag * 2;
    
    view_state[i][o] = 0;
    
    view.text = [NSString stringWithFormat:@"%d",num];
    view.tag = num;
    score += num * 10;
    _scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    
    if ([_scoreLabel.text intValue] >= [_highScoreLabel.text intValue]) {
        [self saveScore];
    }
    
    float a = num;
    view.backgroundColor = [UIColor colorWithRed:a / 32 green:a / 128 blue:a / 512 alpha:0.4];
    
    _arr[i][j] = view;
    
    [_arr[i][o] removeFromSuperview];
    _arr[i][o] = nil;
    view_state[i][j] = 1;
    move_state = YES;
}

- (void)changeFunc2:(int)o andI:(int)i andJ:(int)j
{
    UITextField *view = _arr[i][j];
    int num = (int)_arr[i][j].tag * 2;
    
    view_state[o][j] = 0;
    
    view.text = [NSString stringWithFormat:@"%d",num];
    view.tag = num;
    score += num;
    _scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    
    if ([_scoreLabel.text intValue] >= [_highScoreLabel.text intValue]) {
        [self saveScore];
    }
    
    float a = num;
    view.backgroundColor = [UIColor colorWithRed:a / 32 green:a / 128 blue:a / 512 alpha:0.4];
    
    _arr[i][j] = view;
    
    [_arr[o][j] removeFromSuperview];
    _arr[o][j] = nil;
    view_state[i][j] = 1;
    move_state = YES;
}

- (void)saveScore
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    [fm createDirectoryAtPath:[NSString stringWithFormat:@"%@/HighScore",NSHomeDirectory()] withIntermediateDirectories:YES attributes:nil error:nil];
    [fm createFileAtPath:[NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()] contents:nil attributes:nil];
    NSString *strPath = [NSString stringWithFormat:@"%@/HighScore/score.plist",NSHomeDirectory()];
    
    NSString *str = [NSString stringWithContentsOfFile:strPath usedEncoding:nil error:nil];
    
    
    if ([_scoreLabel.text intValue] >= [str intValue]) {
        [_scoreLabel.text writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        _highScoreLabel.text = _scoreLabel.text;
    }
}
@end





//- (void)viewDidLoad {
//    [super viewDidLoad];
    
    //    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    label.text = @"1111";
    //    label.font = [UIFont fontWithName:@"Menlo" size:20];
    //    label.userInteractionEnabled = YES;
    //    label.textColor = [UIColor redColor];
    //    label.backgroundColor = [UIColor blackColor];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    [self.view addSubview:label];
    //    //带阴影
    //    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    //    label2.text = @"2222";
    //    label2.font = [UIFont systemFontOfSize:20];
    //    label2.shadowColor = [UIColor grayColor];
    //    label2.shadowOffset = CGSizeMake(10, 5);
    //    [self.view addSubview:label2];
    //    //自动缩小字体刚好在label框中，但不会主动换行
    //    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    //    label3.backgroundColor = [UIColor yellowColor];
    //    label3.text = @"123123123123123123";
    //    label3.adjustsFontSizeToFitWidth = YES;
    //    [self.view addSubview:label3];
    //    //可以主动换行
    //    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    label4.backgroundColor = [UIColor orangeColor];
    //    label4.text = @"321123321123321123";
    //    label4.font = [UIFont systemFontOfSize:30];
    //    label4.numberOfLines = 0;
    //    [self.view addSubview:label4];
    
    
    //    for(int i = 0; i < 320; i+=40){
    //        for(int j = 0; j < 380; j+=40){
    //            CGRect rect = CGRectMake(i, j, 40, 40);
    //            CGFloat red = rand()/(RAND_MAX*1.0);
    //            CGFloat blue = rand()/(RAND_MAX*1.0);
    //            CGFloat green = rand()/(RAND_MAX*1.0);
    //            CGFloat alpha = rand()/(RAND_MAX*1.0);
    //            UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    //            UIView *view = [[UIView alloc]initWithFrame:rect];
    //            view.backgroundColor = color;
    //            [self.view addSubview:view];
    //        }
    //    }
    
    
    
    //    NSArray *array = [UIFont familyNames];
    //    for(int i = 0; i < array.count; i++){
    //        NSLog(@"font: %@", array[i]);
    //    }
    //
    //    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"hello"];
    //    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 5)];
    //    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 5)];
    //
    
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    //    button.frame = CGRectMake(200, 200, 100, 100);
    //    button.layer.shadowColor = [UIColor blackColor].CGColor;
    //    button.layer.shadowOffset = CGSizeMake(10, 5);
    //    button.layer.shadowOpacity = 5;
    //    button.layer.shadowRadius = 2;
    //    button.backgroundColor = [UIColor greenColor];
    //    [button addTarget:self action:@selector(onButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:button];
    
    
    //    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    view.layer.cornerRadius = 10;
    //    view.clipsToBounds = YES;
    //    view.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:view];
    
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(100, 100, 200, 200);
//    
//    //创建一个圆环
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(55, 55) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    
//    //圆环遮罩
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
//    shapeLayer.lineWidth = 10;
//    shapeLayer.strokeStart = 0;
//    shapeLayer.strokeEnd = 0.8;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.lineDashPhase = 0.8;
//    shapeLayer.path = bezierPath.CGPath;
//    
//    //颜色渐变
//    NSMutableArray *colors = [NSMutableArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor whiteColor].CGColor, nil];
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.shadowPath = bezierPath.CGPath;
//    gradientLayer.frame = layer.bounds;
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 0);
//    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
//    [layer addSublayer:gradientLayer]; //设置颜色渐变
//    [layer setMask:shapeLayer]; //设置圆环遮罩
//    [self.view.layer addSublayer:layer];
//    
//    CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation2.fromValue = [NSNumber numberWithFloat:0];
//    rotationAnimation2.toValue = [NSNumber numberWithFloat:6.0*M_PI];
//    rotationAnimation2.autoreverses = NO;
//    rotationAnimation2.repeatCount = MAXFLOAT;
//
//    //组合动画
//    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
//    groupAnnimation.duration = 4;
//    groupAnnimation.autoreverses = NO;
//    groupAnnimation.animations = @[ rotationAnimation2];
//    groupAnnimation.repeatCount = MAXFLOAT;
//    [layer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
    
    
    


//}
//
//- (void)onButtonClicked {
//    NSLog(@"check");
//}
//
//@end
