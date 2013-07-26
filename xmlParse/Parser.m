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
    //NSString *strdata=[TFStrings DataToString:ResponseData]; // Will Parse this data
    
    parser=[[NSXMLParser alloc]initWithData:ResponseData];
    parser.delegate=self;
    
    [parser parse];
    
}

#pragma END Network Delegate




#pragma NSXmlParser Delegates

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
   
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"didStartDocuments");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"didEndDocument");
}

// error handling
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}

#pragma END NSXmlParser Delegate END



@end
