//
//  Parser.m
//  xmlParse
//
//  Created by aybek can kaya on 7/26/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+(Parser *)SharedParser
{
    static Parser *theParser=nil;
    if(theParser == nil)
    {
        theParser=[[Parser alloc]init];
    }
    
    return theParser;
}

-(id)init
{
    if(self =[super init])
    {
        // Initialize vars Here
        network=[[TFNetwork alloc]init];
        network.delegate=self;
    
    }
    
    return self;
}

-(void)ParseDocumentInURL:(NSString *)Url
{
    [network QueryForSourceCode:Url];
}


#pragma mark NetworkDelegate

-(void)NetworkDidEndFetcing:(id)ResponseData
{
    
    if([ResponseData isKindOfClass:[NSError class]])
    {
       // On Error
        NSLog(@"Error: %@",[ResponseData localizedDescription]);
        return;
    }
    
    // Test String
    NSString *strdata=[TFStrings DataToString:ResponseData]; // Will Parse this data
    NSDictionary *dict=[NSDictionary dictionaryWithXMLString:strdata];
   
  NSArray *EntriesRaw=[[dict objectForKey:@"channel"]objectForKey:@"item"];
    
   // create entries
    Entries=[[NSMutableArray alloc]init];
    for(NSDictionary *EntryCandidate in EntriesRaw)
    {
        NSLog(@"%@",[EntryCandidate description]);
        Entry *entry=[[Entry alloc]init];
        entry.description=[EntryCandidate objectForKey:@"description"];
        entry.title=[EntryCandidate objectForKey:@"title"];
       // NSLog(@"Entry Desc: %@",[entry title]);
        entry.publishDateStr=[EntryCandidate objectForKey:@"pubDate"];
        NSArray *imgDataArr=[EntryCandidate objectForKey:@"enclosure"];
        entry.imageStr=[[imgDataArr objectAtIndex:0]objectForKey:@"_url"];
        
    }
    
}

#pragma END Network Delegate








@end
