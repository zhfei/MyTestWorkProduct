//
//  NSArray+Additions.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/7/19.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "NSArray+Additions.h"
#import "PinYin4Objc.h"

#define HANZI_START 19968
#define HANZI_COUNT 20902

@implementation NSArray (Additions)
/*!
 *  @author zhoufei
 *
 *  @brief 将汉字数组进行分组排序，并将分组的数据用字典返回
 *  @param hanZiArray 汉字字符串数组
 *  @return 分组好的字典数据
 */
+(NSDictionary *)pinYinGroupSortWithArray:(NSArray*)hanZiArray
{
    
    //初始化HanyuPinyinOutputFormat对象，设置相应的 type
     HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
     [outputFormat setToneType:ToneTypeWithoutTone];
     [outputFormat setVCharType:VCharTypeWithV];
     [outputFormat setCaseType:CaseTypeUppercase];
     //遍历成员列表，将成员名字 contactName 转成拼音，并存放到 categoryName 字段中，用于排序
    [hanZiArray enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        
        NSInteger index= [obj characterAtIndex:0];
        NSString *result;
        index = index - HANZI_START;
        if (index >= 0 && index <= HANZI_COUNT)
        {
            NSString *outputPinyin=[PinyinHelper toHanyuPinyinStringWithNSString:[obj substringWithRange:NSMakeRange(0, 1)] withHanyuPinyinOutputFormat:outputFormat withNSString:@""];
            result = [[outputPinyin substringWithRange:NSMakeRange(0, 1)] uppercaseString];

        }
        else
        {
            result = @"#";
        }

        NSLog(@"result:%@",result);
        
        
     }];
    
    return nil;
}
@end
