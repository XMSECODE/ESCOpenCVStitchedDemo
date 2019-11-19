//
//  ViewController.m
//  ESCOpenCVDemo
//
//  Created by xiangmingsheng on 2019/10/31.
//  Copyright © 2019 xiaoxia. All rights reserved.
//

#import <opencv2/highgui/highgui.hpp>
#import <opencv2/stitching.hpp>
#import <opencv2/core/types.hpp>
#import <opencv2/opencv.hpp>

#include "opencv2.framework/Headers/opencv.hpp"
#import "CVWrapper.h"
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)UIImageView* imageView;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    self.imageView.frame = CGRectMake(0, 0, 1000, 600);
    
    UIImage *image1 = [UIImage imageNamed:@"pano_19_16_mid"];
    UIImage *image2 = [UIImage imageNamed:@"pano_19_20_mid"];
    UIImage *image3 = [UIImage imageNamed:@"pano_19_22_mid"];
    UIImage *image4 = [UIImage imageNamed:@"pano_19_25_mid"];
    
    NSArray *imageArray = @[image1,image2,image3,image4];
    UIImage *stitchedImage = [CVWrapper processWithArray:imageArray];
    
//    NSLog(@"stichedImage %@", stitchedImage);
    self.imageView.image = stitchedImage;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.imageView.frame = self.view.frame;
}

@end
