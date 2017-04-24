//
//  DetailedViewController.m
//  AsXmlParsing
//
//  Created by Student P_08 on 18/04/17.
//  Copyright © 2017 felix ITs. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDesign];
    // Do any additional setup after loading the view.
}
-(void)setUpDesign
{
    self.lblTitle.text=_stringTitle;
    self.lblLink.text=_stringLink;
    self.imageView.image=_detailImage;
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

@end
