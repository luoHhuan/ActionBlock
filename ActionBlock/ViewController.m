//
//  ViewController.m
//  ActionBlock
//
//  Created by Luoh on 2017/11/13.
//  Copyright © 2017年 Luoh. All rights reserved.
//

#import "ViewController.h"
#import "LHActionBlocks.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    /** 按钮 */
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor redColor];
    
    [button handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        NSLog(@"按钮block 点击");
    }];
    
    /** 手势 */
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(200, 100, 80, 80)];
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor yellowColor];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithBlock:^(UITapGestureRecognizer * weakTap) {
        NSLog(@"手势回调 %@",weakTap);
    }];
    [imageView addGestureRecognizer:tap];
    
    /** switch */
    UISwitch * switch1 = [[UISwitch alloc]initWithFrame:CGRectZero];
    [switch1 handleControlEvents:UIControlEventValueChanged withBlock:^(id weakSender) {
        
    }];
    
    /** UIBarButtonItem */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"111" style:UIBarButtonItemStyleDone block:^(id weakSender) {
        
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone block:^(id weakSender) {
        
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd block:^(id weakSender) {
        
    }];
    
    /** UISegmentedControl */
    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:@[@"1",@"2",@"3"]];
    seg.frame = CGRectZero;
    [seg handleControlEvents:UIControlEventValueChanged withBlock:^(id weakSender) {
        NSLog(@"sel sefment %@",[seg titleForSegmentAtIndex:seg.selectedSegmentIndex]);
        
        if (seg.selectedSegmentIndex == 2) {
            /** remove */
            [seg removeActionBlocksForControlEvents:UIControlEventValueChanged];
        }
    }];
    
    
    /** UIToolbar */
    UIToolbar * toolbar = [[UIToolbar alloc]initWithFrame:CGRectZero];
    [self.view addSubview:toolbar];
    UIBarButtonItem * btnOne = [[UIBarButtonItem alloc]init];
    [btnOne setTitle:@"btn1"];
    [btnOne setBlock:^(id weakSender) {
        
    }];
    [toolbar setItems:@[btnOne]];
    
}


/** 截图html文本中的 img 的 url */
- (void)filterTheImgUrlArrFromfahterHtml:(NSString *)html{
    //<(img|IMG)[^\<\>]*>找img标签的正则
    //(?<=title\>).*(?=</title) 找title 的正则
    NSString *ss = @"<(img|IMG)[^\<\>]*>";//img标签的正则表达式
    NSRegularExpression *pre = [[NSRegularExpression alloc] initWithPattern:ss options:0 error:nil];
    
    NSArray *arr = [pre matchesInString:html options:NSMatchingReportProgress range:NSMakeRange(0, html.length)];//这个方法匹配正则，找到符合的结果返回数组集合，返回的类型是NSTextCheckingResult下面会提到。
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:1];
    NSLog(@"---%@",arr);
    for (NSTextCheckingResult *match in arr) {
        NSRange matchRange = [match range];//返回的是每个imgb标签的位置
        NSString *imgDivStr = [html substringWithRange:matchRange];//根据位置找对应img标签
        imgDivStr = [imgDivStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        //此处我为了找出图片URL过滤掉空格
        NSString *imgUrl = [[imgDivStr componentsSeparatedByString:@"src=\""] lastObject];
        imgUrl = [[imgUrl componentsSeparatedByString:@"\""] firstObject];
        [mutArr addObject:imgUrl];
        
    }
    NSLog(@"%@",mutArr);
    //    return [NSArray arrayWithArray:mutArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
