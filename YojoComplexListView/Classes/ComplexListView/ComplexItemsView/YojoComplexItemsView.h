//
//  ComplexItemsView.h
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import <UIKit/UIKit.h>

@class YojoComplexObject, YojoComplexItemObject;
@interface YojoComplexItemsView : UIView

@property (nonatomic, retain) NSArray<YojoComplexObject *> *HeaderItems;

@property (nonatomic, retain) NSArray<YojoComplexItemObject *> *Items;

@property (nonatomic, assign, readonly) CGFloat contentHeight;
@property (nonatomic, assign) NSInteger numOfLines;
@property (nonatomic, assign) CGFloat lineHeight;

@end
