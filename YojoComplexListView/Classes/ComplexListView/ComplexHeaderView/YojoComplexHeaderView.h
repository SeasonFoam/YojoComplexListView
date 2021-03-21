//
//  ComplexHeaderView.h
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import <UIKit/UIKit.h>

@class YojoComplexObject;
@interface YojoComplexHeaderView : UIView

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat lineHeight;

@property (nonatomic, retain) NSArray<YojoComplexObject *> *HeaderItems;

@end
