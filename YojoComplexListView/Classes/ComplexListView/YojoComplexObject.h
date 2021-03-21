//
//  ComplexObject.h
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YojoComplexObject : NSObject <NSCopying>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, copy) UIColor *backColor;
@property (nonatomic, copy) UIColor *textColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, copy) NSMutableAttributedString *attributeText;

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;

@property (nonatomic, assign) BOOL hasSquare;

@end

@interface YojoComplexSubItemObject : NSObject

@property (nonatomic, assign, readonly) CGFloat itemHeight;

@property (nonatomic, retain, readonly) NSMutableArray<YojoComplexObject *> *Items;

- (void)addItemsObject:(YojoComplexObject *)itemObject;

@end

@interface YojoComplexItemObject : NSObject

@property (nonatomic, assign) CGFloat itemHeight;

@property (nonatomic, retain, readonly) NSMutableArray<YojoComplexSubItemObject *> *SubItems;

- (void)addItemObject:(YojoComplexSubItemObject *)subItem;

@end
