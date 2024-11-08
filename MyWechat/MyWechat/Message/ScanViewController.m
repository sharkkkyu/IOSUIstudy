//
//  ScanViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/16.
//

#import "ScanViewController.h"

@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (strong, nonatomic) AVCaptureDevice * device;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureMetadataOutput * output;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation ScanViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self initUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCapture];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden = NO;
}

-(void) initCapture {
    // 设置摄像头捕获会话
    self.session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&error];
    if (input) {
        [self.session addInput:input];
    } else {
        NSLog(@"Error: %@", error);
        return;
    }
   _output = [[AVCaptureMetadataOutput alloc] init];
    [self.session addOutput:_output];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [_output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.previewLayer.frame = self.view.layer.bounds;
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.session startRunning];
    });
}

-(void) initUI {
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    UIButton *pop = [UIButton buttonWithType:UIButtonTypeCustom];
    pop.frame = CGRectMake(10, 40, 50, 50);
    [pop setImage:[UIImage imageNamed:@"return_scan"] forState:UIControlStateNormal];
    [pop addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
    
    CGFloat screenHeight = self.view.frame.size.height;
    CGFloat screenWidth = self.view.frame.size.width;
    CGRect cropRect = CGRectMake((screenWidth - 280) / 2, (screenHeight - 280) / 2, 280, 280);
    [_output setRectOfInterest:CGRectMake(cropRect.origin.y / screenHeight, cropRect.origin.x / screenWidth, cropRect.size.height / screenHeight, cropRect.size.width / screenWidth)];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(cropRect.origin.x, cropRect.origin.y, 280, 280)];
    view.layer.borderColor = [UIColor greenColor].CGColor;
    view.layer.borderWidth = 1.0;
    [self.view addSubview:view];
    UIButton *lightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lightButton setImage:[UIImage imageNamed:@"lightoff"] forState:UIControlStateNormal];
    [lightButton setImage:[UIImage imageNamed:@"lighton"] forState:UIControlStateSelected];
    lightButton.frame = CGRectMake((self.view.frame.size.width - 30) / 2, self.view.frame.size.height / 2 + 200, 30, 30);
    [lightButton addTarget:self action:@selector(openLightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lightButton];
}

-(void)pop:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addScreenFillRect:(CGContextRef)ctx rect:(CGRect)rect {
    CGContextSetRGBFillColor(ctx, 40 / 255.0,40 / 255.0,40 / 255.0,1.0);
    CGContextFillRect(ctx, rect);   //draw the transparent layer
}
-(void) openLightAction:(UIButton *)button {
    if (button.selected) {
        [self turnOnlight:NO];
    } else {
        [self turnOnlight:YES];
    }
    button.selected = !button.selected;
}
-(void)turnOnlight:(BOOL) on {
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([_device hasTorch]) {
        [_device lockForConfiguration:nil];
        if(on) {
            [_device setTorchMode:AVCaptureTorchModeOn];
        } else {
            [_device setTorchMode:AVCaptureTorchModeOff];
        }
    }
}
//隐藏系统状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray<AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count > 0) {
           [self.session stopRunning];
           AVMetadataObject *metadataObject = [metadataObjects objectAtIndex:0];
           if ([metadataObject isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) {
               AVMetadataMachineReadableCodeObject *readableObject = (AVMetadataMachineReadableCodeObject *)metadataObject;
               NSString *result = readableObject.stringValue;
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果" message:result preferredStyle:UIAlertControllerStyleAlert];
               NSLog(@"%@",result);
               UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                       [self.session startRunning];
                   });
               }];
               [alert addAction:okAction];
               [self presentViewController:alert animated:YES completion:nil];
           }
       }
}


@end
