//
//  DetailedViewController.h
//  AsXmlParsing
//
//  Created by Student P_08 on 18/04/17.
//  Copyright © 2017 felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblLink;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic)  NSString *stringLink;
@property (strong, nonatomic) NSString *stringTitle;
@property (strong, nonatomic) UIImage *detailImage;
@end
