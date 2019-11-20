//
//  WorkViewController.m
//  colorfill
//
//  Created by tym on 2018/03/02.
//  Copyright © 2018年 tian. All rights reserved.
//
#import "MKColorPicker-Swift.h"
#import "KKColor.h"
#import "UIColor+CustomColors.h"
#import "UIImage+PDF.h"


#import "AppDelegate.h"

#import "AppDelegate.h"
#import "WorkViewController.h"
#import "MyimageView.h"
#import "KKColorListPicker.h"

//#import "ColorPickerView.h"

@interface WorkViewController ()<UIScrollViewDelegate,UIPopoverPresentationControllerDelegate,KKColorListViewControllerDelegate>

@property (nonatomic, strong)UIButton *shapeButton;//返回
@property (nonatomic, strong)UIButton *keepButton;//保存
@property (nonatomic, strong)UIButton *shareButton;//分享
@property (nonatomic, strong)UIButton *revokeButton;//撤销
@property (nonatomic,strong) MyimageView *myimageview;

/** 颜色选择view */
//@property(nonatomic , strong) ColorPickerView   *colorView;
/** 选中的view */
@property(nonatomic , strong) UIView  *selectedView;
@property (nonatomic,strong)UIScrollView * scrollView;
/** 颜色 */
@property(nonatomic , strong) UIColor  *selectedColor;

/** 颜色 */
@property(nonatomic , strong) ColorPickerViewController  *colorPicker;
/** 颜色 */
@property(nonatomic , strong) UIButton *colorPickBtn;


@end

@implementation WorkViewController

- (void)closeme {
    [[AppDelegate appDelegate] closeWorkPage];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorFromHexString:@"F2F2F2"]];
    //self.colorPicker.autoDismissAfterSelection = YES;
    
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    

    
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
    if (@available(iOS 11.0, *)) {
        closeBtn.frame = CGRectMake(0, self.view.safeAreaInsets.top+20, 50, 50);
    }
    
    [closeBtn setImage:[UIImage imageNamed:@"close_btn"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeme) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, screenW, screenW)];
    [self.view addSubview:_scrollView];
    self.myimageview = [[MyimageView alloc]initWithFrame:CGRectMake(0, 100, screenW, screenW)];
    [self.scrollView addSubview:self.myimageview];
    //设置内容大小
    _scrollView.contentSize = _myimageview.frame.size;
    //设置代理为控制器
    _scrollView.delegate = self;
    //设置最小缩放比例
    _scrollView.minimumZoomScale = 1;
    //设置最大缩放比例
    _scrollView.maximumZoomScale = 4;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    //设置手势点击数,双击：点2下
    tapGesture.numberOfTapsRequired=2;
    [_scrollView addGestureRecognizer:tapGesture];
    
    
    /* ファイルを読み込む */
    //UIImage *image = [UIImage imageOrPDFNamed:@"rose.pdf"];
    UIImage *image = [UIImage imageNamed:@"cellpic.png"];

    self.myimageview.image =image;
    
//    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
//
//    /* フィルタを読み込む */
//    CIFilter *ciFilter = [CIFilter filterWithName:@"CIPhotoEffectNoir"
//                                    keysAndValues:kCIInputImageKey, ciImage, nil];
//
//    /* ※注意※このフィルタは、パラメータの設定ができません */
//
//    /* フィルタした内容を画面に表示する */
//    CIContext *ciContext = [CIContext contextWithOptions:nil];
//    CGImageRef cgimg = [ciContext createCGImage:[ciFilter outputImage] fromRect:[[ciFilter outputImage] extent]];
//    //设置一个图片的存储路径
//    self.myimageview.image = [UIImage imageWithCGImage:cgimg scale:1.0f orientation:UIImageOrientationUp];
//    CGImageRelease(cgimg);
    
    

    
    
    CGFloat sc =  (screenW/self.myimageview.image.size.width);
    NSLog(@"self.myimageview.image.size.width = %f",self.myimageview.image.size.width);
    NSLog(@"self.myimageview.image.size.height = %f",self.myimageview.image.size.height);

    
    
    self.myimageview.frame = CGRectMake(0, 50, screenW, self.myimageview.image.size.height*sc);
    //self.scrollView.frame = CGRectMake(0, 50, screenW, self.myimageview.image.size.height*sc);
      
    self.myimageview.scaleNum = 1/sc;
    self.myimageview.newcolor = self.selectedColor;
    
    [self.view addSubview:closeBtn];
    
    self.colorPickBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height-80, self.view.frame.size.width-40, 50 )];
    [self.colorPickBtn setTitle:@"select color" forState:UIControlStateNormal];
    [self.colorPickBtn addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.colorPickBtn];
    
}
-(void)showPicker{
    
//    self.colorPicker = [[ColorPickerViewController alloc] init];
//
//    //[self.colorPicker.ScrollDirection]
//
//
//    UIPopoverPresentationController *presentationController = _colorPicker.popoverPresentationController;
//    presentationController.delegate = self;
//    presentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
//    presentationController.sourceView = self.view;
//    presentationController.sourceRect = self.view.bounds;
//
//
//     [self presentViewController:_colorPicker animated:YES completion:NULL];
    
    KKColorListViewController *controller = [[KKColorListViewController alloc] initWithSchemeType:KKColorsSchemeTypePantone];
    controller.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];

    
}
//放大缩小
-(void)handleTapGesture:(UIGestureRecognizer*)sender
{
    if(_scrollView.zoomScale > 1.0){
        [_scrollView setZoomScale:1.0 animated:YES];
    }else{
        [_scrollView setZoomScale:4.0 animated:YES];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return _myimageview;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)colorListController:(KKColorListViewController *)controller didSelectColor:(KKColor *)color
{
//    self.colorView.backgroundColor = [color uiColor];
//    self.colorView.hidden = NO;
    [self.colorPickBtn setBackgroundColor:[color uiColor]];
    self.selectedColor = [color uiColor];
    self.myimageview.newcolor = self.selectedColor;
}

- (void)colorListPickerDidComplete:(KKColorListViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
