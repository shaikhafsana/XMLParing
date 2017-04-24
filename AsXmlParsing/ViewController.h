//
//  ViewController.h
//  AsXmlParsing
//
//  Created by Student P_08 on 18/04/17.
//  Copyright © 2017 felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>
{
    
    NSMutableArray *array;
    NSMutableDictionary *dict;
    NSMutableString *str;
    

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)UIActivityIndicatorView *tableViewActivityIndicator;
@end

