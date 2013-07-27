//
//  ViewController.m
//  xmlParse
//
//  Created by aybek can kaya on 7/26/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Parser *myParser=[Parser SharedParser];
    
    NSString *UrlStr=@"http://rss.news.yahoo.com/rss/";
    
    UrlStr=@"http://www.deardiary-fashion.com/feed/";
    
    [myParser ParseDocumentInURL:UrlStr];
   
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
