//
//  NSURL+YYAdditions.m
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import "NSURL+YYAdditions.h"

@implementation NSURL (YYAdditions)

-(NSDictionary *) queryDictionary{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
	NSString *query = [self query];
    if (!query) {
        return nil;
    }
	NSArray *queryArr = [query componentsSeparatedByString:@"&"];
	for (NSString *queryArri in queryArr) {
		NSArray *queryArriArr = [queryArri componentsSeparatedByString:@"="];
		if ([queryArriArr count]==2) {
			NSString *key = [queryArriArr objectAtIndex:0];
			NSString *value = [[queryArriArr objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			[dictionary setObject:value forKey:key];
		}
	}
	return dictionary;
}

@end
