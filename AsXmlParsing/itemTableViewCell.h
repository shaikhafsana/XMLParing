//
//  itemTableViewCell.h
//  AsXmlParsing
//
//  Created by Student P_08 on 18/04/17.
//  Copyright © 2017 felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblLink;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
