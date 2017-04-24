//
//  ViewController.m
//  AsXmlParsing
//
//  Created by Student P_08 on 18/04/17.
//  Copyright © 2017 felix ITs. All rights reserved.
//

#import "ViewController.h"
#import "itemTableViewCell.h"
#import "DetailedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showActivityIndicator];
    [self loadData];
    }
-(void)loadData
{
    NSString *mystr=[NSString stringWithFormat:@"http://www.rediff.com/rss/sslide.xml"];
    NSURL *myUrl=[NSURL URLWithString:mystr];
    
    NSXMLParser *parse=[[NSXMLParser alloc]initWithContentsOfURL:myUrl];
    
    parse.delegate=self;
    [parse parse];
    //  NSError *err;
    if (array.count) {
        [_tableView reloadData];
        [self.tableViewActivityIndicator stopAnimating];
        [self.tableViewActivityIndicator setHidesWhenStopped:YES];
    }
    else{
        [self showAlertwithTitle:@"Error" andMsg:@"Opsssss Error occured"];
        [self.tableViewActivityIndicator stopAnimating];
        [self.tableViewActivityIndicator setHidesWhenStopped:YES];
    }

    NSLog(@"Array is .....%@",array);
    
    

}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict;
{
    NSLog(@"Element Name %@",elementName);
    if ([elementName isEqualToString:@"channel"]) {
        array=[[NSMutableArray alloc]init];
    }
    if ([elementName isEqualToString:@"item"]) {
        dict=[[NSMutableDictionary alloc ]init];
    }
    
    
    
    
    
}
-(void)showActivityIndicator
{
    self.tableViewActivityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.tableViewActivityIndicator.color=[UIColor blueColor];
    self.tableViewActivityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    self.tableViewActivityIndicator.center=self.view.center;
    [self.tableViewActivityIndicator startAnimating];
    [self.tableView addSubview:self.tableViewActivityIndicator];
    [self showAlertwithTitle:@"Done!!!!" andMsg:@"Data loaded Sucessfully"];
}
-(void)showAlertwithTitle:(NSString *)title andMsg:(NSString *)message
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName;

{
    NSLog(@"Element Name %@",elementName);
    
    if ([elementName isEqualToString:@"title"]||[elementName isEqualToString:@"link"]||    [elementName isEqualToString:@"image"]) {
        
        [dict setObject:str forKey:elementName];
        
    }
    if ([elementName isEqualToString:@"item"]) {
        [array addObject:dict];
    }
    
    
    str=nil;
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    
    str=[[NSMutableString alloc]initWithString:string];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    itemTableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell==nil) {
        
        cell=[[itemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.lblTitle.text =[[array objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.lblLink.text =[[array objectAtIndex:indexPath.row] valueForKey:@"link"];
    
    NSString *url2img=[[array objectAtIndex:indexPath.row]valueForKey:@"image"];
    NSLog(@"img=%@",url2img);
    NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:url2img]];
    cell.imageView.image=[UIImage imageWithData:imgData];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailedViewController *obj = [story instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    
  itemTableViewCell     *tblcell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    /*  NSDictionary *dict = [array objectAtIndex:indexPath.row];
     NSString *str = [NSString stringWithFormat:@"%@",[dict valueForKey:@"company"]];*/
    
    obj.stringTitle = [NSString stringWithFormat:@"%@",tblcell.lblTitle.text] ;
    
    obj.stringLink = [NSString stringWithFormat:@"%@",tblcell.lblLink.text] ;
    // obj.img = tblcell.imgvw.image;
    obj.detailImage=tblcell.imageView.image;
    [self.navigationController pushViewController:obj animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
