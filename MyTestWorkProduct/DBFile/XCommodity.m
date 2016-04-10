//
//  XProducte.m
//  XPay
//
//  Created by jack zhou on 2/2/15.
//  Copyright (c) 2015 jack zhou. All rights reserved.
//

#import "XCommodity.h"

#import "YYModel.h"
#import "NSString+HTML.h"




@implementation XCommodity

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"commodityID":@"id",
             @"unit":@"unit",
             @"price":@"price",
             @"commodityName":@"name",
             @"printID":@"printerId",
             @"type":@"type",
             @"sequence":@"sequence",
             //新增加的属性
             @"inventory":@"inventory",
             @"unitType":@"unitType",
             @"searchPinyin":@"pinyin",
             @"commodityNumber":@"code",
             @"categoryId":@"categoryId",
             @"barcode":@"barcode",
             //套餐新加属性😄
             @"comboItem":@"items",
             @"demands":@"demands",
             @"categoryShowName":@"categoryName",
             @"quantity":@"quantity" //在标记套餐含有单品个数的时候用到.
             };
}

//!!!!:  商品打印ID 退菜时通知厨房时的要传的
-(NSString *)printID{
    if ([_printID isKindOfClass:[NSString class]] &&_printID.length>0) {
        return _printID;
    }else{
        return @"";
    }
}
//!!!!: 后台可能返回单位为空
- (NSString *)unit {
    if ([_unit isKindOfClass:[NSString class]] && _unit.length > 0) {
        return _unit;
    } else {
        return @"";
    }
}

- (NSString *)commodityName{
    return [_commodityName kv_decodeHTMLCharacterEntities];
}


@end
