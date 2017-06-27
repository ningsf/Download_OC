//
//  ViewController.m
//  Download
//
//  Created by zn on 2017/6/27.
//  Copyright © 2017年 ning. All rights reserved.
//

#import "ViewController.h"
#import "DownLoaderManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)download:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://free2.macx.cn:8281/tools/photo/SnapNDragPro418.dmg"];
    
    NSURL *url2 = [NSURL URLWithString:@"http://free2.macx.cn:8281/tools/photo/Sip44.dmg"];
    
    
    [[DownLoaderManager shareInstance] downLoader:url2 downLoadInfo:^(long long totalSize) {
        NSLog(@"下载信息--%lld", totalSize);
    } progress:^(float progress) {
        NSLog(@"下载进度--%f", progress);
    } success:^(NSString *filePath) {
        NSLog(@"下载成功--路径:%@", filePath);
    } failed:^{
        NSLog(@"下载失败了");
    }];
    
    [[DownLoaderManager shareInstance] downLoader:url downLoadInfo:^(long long totalSize) {
        NSLog(@"下载信息--%lld", totalSize);
    } progress:^(float progress) {
        NSLog(@"下载进度--%f", progress);
    } success:^(NSString *filePath) {
        NSLog(@"下载成功--路径:%@", filePath);
    } failed:^{
        NSLog(@"下载失败了");
    }];
    
    //    [self.downLoader downLoader:url];
    //    [self.downLoader downLoader:url downLoadInfo:^(long long totalSize) {
    //        NSLog(@"下载信息--%lld", totalSize);
    //    } progress:^(float progress) {
    //        NSLog(@"下载进度--%f", progress);
    //    } success:^(NSString *filePath) {
    //        NSLog(@"下载成功--路径:%@", filePath);
    //    } failed:^{
    //        NSLog(@"下载失败了");
    //    }];
    
    //    [self.downLoader setStateChange:^(XMGDownLoadState state){
    //        NSLog(@"---%zd", state);
    //    }];
}
- (IBAction)pause:(id)sender {
    [[DownLoaderManager shareInstance]pauseWithURL:@""];
}
- (IBAction)cancel:(id)sender {
    [[DownLoaderManager shareInstance] cancelWithURL:@""];
}
- (IBAction)cancelClean:(id)sender {
    [[DownLoaderManager shareInstance] cleanWithURL:@""];
}


@end
