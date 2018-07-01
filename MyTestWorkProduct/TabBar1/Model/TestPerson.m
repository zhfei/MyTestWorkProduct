//
//  Person.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/4/13.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "TestPerson.h"
#import <objc/runtime.h>


@implementation TestPerson

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    
    objc_property_t  *propertys =class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t property=propertys[i];
        const char *name =property_getName(property);
        
        NSString *nameString =[NSString stringWithUTF8String:name];
        NSString *propertyValue=[self valueForKey:nameString];
        
        [aCoder encodeObject:propertyValue forKey:nameString];
    }
    
    free(propertys);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count;
    
    objc_property_t *propertys=class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t property=propertys[i];
        const char * name =property_getName(property);
        NSString *nameString=[NSString stringWithUTF8String:name];
        
        NSString *propertyValue =[aDecoder decodeObjectForKey:nameString];
        [self setValue:propertyValue forKey:nameString];
    }
    
   
    return self;
}

#pragma mark - life circle

#pragma mark - getter、setter


- (void)eat
{}
- (void)sleep
{}
- (void)work
{}



@end
