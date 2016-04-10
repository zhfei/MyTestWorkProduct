//
//  Person.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/1/7.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "Person.h"

#define PersonErrorDomain @"com.xkeshi.person"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        MyLog(@"%@",change);
    }
}

-(BOOL)validateName:(id *)ioValue error:(NSError **)outError
{
    // The name must not be nil, and must be at least two characters long.
    if ((*ioValue == nil) || ([(NSString *)*ioValue length] < 2)) {
        if (outError != NULL) {
            NSString *errorString = NSLocalizedStringFromTable(
                                                               @"A Person's name must be at least two characters long", @"Person",
                                                               @"validation: too short name error");
            NSDictionary *userInfoDict =
            [NSDictionary dictionaryWithObject:errorString
                                        forKey:NSLocalizedDescriptionKey];

            *outError = [[NSError alloc] initWithDomain:PersonErrorDomain
                                                    code:-1
                                                userInfo:userInfoDict] ;
        }
        return NO;  
    }
    
  return YES;
}

- (id)valueForUndefinedKey:(NSString *)key
{
    
    MyLog(@"key有问题"); 
    return key;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"name" context:nil];
}

@end
