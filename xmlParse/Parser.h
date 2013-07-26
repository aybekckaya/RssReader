//
//  Parser.h
//  xmlParse
//
//  Created by aybek can kaya on 7/26/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFNetwork.h"
#import "TFStrings.h"

@interface Parser : NSObject<NSXMLParserDelegate,TFNetworkDelegate>
{
    TFNetwork *network;
    NSXMLParser *parser;
}

+(Parser *)SharedParser;

-(id)init;

-(void)ParseDocumentInURL:(NSString *)Url;

@end
