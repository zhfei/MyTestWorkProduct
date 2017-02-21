//
//  HUDView.m
//  LiCai
//
//  Created by Tim on 11/9/14.
//  Copyright (c) 2014 aim. All rights reserved.
//

#import "HUDView.h"

@implementation HUDView

static HUDView *HUD;


+(id)showWithOnlyText:(NSString *)text
{
@synchronized(HUD){
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
  
    if (!HUD) {
        
        HUD = [[HUDView alloc] initWithView:window];
        [window addSubview:HUD];
    
    }
    
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = text;
    
    [HUD show:NO];
    
    HUD.removeFromSuperViewOnHide=YES;
    [HUD hide:NO afterDelay:1.5];

    return HUD;
    
}
    

}

+(id)showWithIndicator:(NSString *)text
{
    @synchronized(HUD){
        
        UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        
        if (!HUD) {
            
            HUD = [[HUDView alloc] initWithView:window];
            [window addSubview:HUD];
         
        }
        
        if (text) {
            HUD.labelText = text;
        }
        else
        {
            HUD.labelText = @"通讯中,请稍后...";
        }
        
        HUD.mode = MBProgressHUDModeIndeterminate;
        
        [HUD show:YES];
        return HUD;
        
    }

}

    
+(void)hide
{
    if (HUD) {
        
        HUD.removeFromSuperViewOnHide=YES;
        [HUD hide:YES];

        HUD = Nil;
    }
   

}


@end
