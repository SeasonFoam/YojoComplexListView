//
//  ComplexHeaderView.m
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import "YojoComplexHeaderView.h"
#import "YojoComplexObject.h"
#import "NSString+ListExtension.h"

@interface YojoComplexHeaderView ()

@end

@implementation YojoComplexHeaderView

- (void)dealloc
{
    self.HeaderItems = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.lineHeight = 0.3f;
    }
    return self;
}

#pragma -mark
#pragma -mark Attribute
- (void)setHeaderHeight:(CGFloat)headerHeight
{
    _headerHeight = headerHeight;
    
    for(id tempView in self.subviews)
    {
        if([tempView isKindOfClass:[UILabel class]])
        {
            UILabel *lb_item = tempView;
            lb_item.frame = CGRectMake(CGRectGetMinX(lb_item.frame),
                                       CGRectGetMinY(lb_item.frame),
                                       CGRectGetWidth(lb_item.frame),
                                       headerHeight);
        }
    }
}

- (void)setHeaderItems:(NSArray<YojoComplexObject *> *)HeaderItems
{
    _HeaderItems = HeaderItems;
    
    if(HeaderItems != nil)
    {
        [self refreshUI];
    }
}

#pragma -mark
#pragma -mark Attribute
- (void)refreshUI
{
    for(id tempView in self.subviews)
    {
        [tempView removeFromSuperview];
    }
    
    CGFloat xPos = 0;
    for(YojoComplexObject *obj in self.HeaderItems)
    {
        UILabel *lb_header = [[UILabel alloc] initWithFrame:CGRectMake(xPos,
                                                                       0,
                                                                       obj.itemWidth,
                                                                       self.headerHeight)];
        lb_header.frame = CGRectIntegral(lb_header.frame);
        if([obj.text isBlankString])
            lb_header.attributedText = obj.attributeText;
        else
            lb_header.text = obj.text;
        lb_header.textAlignment = obj.textAlignment;
        lb_header.textColor = obj.textColor;
        lb_header.font = [UIFont systemFontOfSize:obj.fontSize];
        lb_header.backgroundColor = obj.backColor;
        lb_header.layer.borderWidth = obj.hasSquare ? self.lineHeight : 0.0f;
        lb_header.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.5f] CGColor];
        lb_header.adjustsFontSizeToFitWidth = YES;
        [self addSubview:lb_header];
        
        xPos = CGRectGetMaxX(lb_header.frame);
    }
}

@end
