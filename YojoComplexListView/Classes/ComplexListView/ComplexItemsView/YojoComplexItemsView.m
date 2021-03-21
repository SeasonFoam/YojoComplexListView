//
//  ComplexItemsView.m
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import "YojoComplexItemsView.h"
#import "YojoComplexObject.h"
#import "NSString+ListExtension.h"

@interface YojoComplexItemsView ()

@end

@implementation YojoComplexItemsView

- (void)dealloc
{
    self.Items = nil;
    self.HeaderItems = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _numOfLines = 0;
        _contentHeight = 0.0f;
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.lineHeight = 0.3f;
    }
    return self;
}

#pragma -mark
#pragma -mark Attribute
- (void)setItems:(NSArray<YojoComplexItemObject *> *)Items
{
    _Items = Items;
    
    if(Items != nil && self.HeaderItems != nil)
    {
        [self refreshUI];
    }
}

- (void)setHeaderItems:(NSArray<YojoComplexObject *> *)HeaderItems
{
    _HeaderItems = HeaderItems;
    
    if(self.Items != nil && HeaderItems != nil)
    {
        [self refreshUI];
    }
}

- (void)refreshUI
{
    for(id tempView in self.subviews)
    {
        [tempView removeFromSuperview];
    }
    
    CGFloat yPos_item = 0;
    NSInteger minCount = (self.numOfLines != 0 && self.Items.count > self.numOfLines) ? self.numOfLines : self.Items.count;
    for(int i = 0; i<minCount; i++)
    {
        YojoComplexItemObject *itemObj = [self.Items objectAtIndex:i];
        
        CGFloat xPos_item = 0;
        
        for(int m = 0; m<itemObj.SubItems.count; m++)
        {
            YojoComplexSubItemObject *subItemsObj = [itemObj.SubItems objectAtIndex:m];
            CGFloat itemHeight = itemObj.itemHeight / ((CGFloat)subItemsObj.Items.count);
            
            YojoComplexObject *headerObj = [self.HeaderItems objectAtIndex:m];
            
            CGFloat xPos_sub = xPos_item;
            CGFloat yPos_sub = yPos_item;
            
            for(int n = 0; n<subItemsObj.Items.count; n++)
            {
                YojoComplexObject *sub_itemObj = [subItemsObj.Items objectAtIndex:n];
                
                UILabel *lb_subitem = [[UILabel alloc] initWithFrame:CGRectMake(xPos_sub,
                                                                                yPos_sub,
                                                                                headerObj.itemWidth,
                                                                                itemHeight)];
                lb_subitem.frame = CGRectIntegral(lb_subitem.frame);
                lb_subitem.textAlignment = sub_itemObj.textAlignment;
                lb_subitem.textColor = sub_itemObj.textColor;
                lb_subitem.font = [UIFont systemFontOfSize:sub_itemObj.fontSize];
                lb_subitem.numberOfLines = 0;
                lb_subitem.lineBreakMode = NSLineBreakByClipping;
                lb_subitem.backgroundColor = sub_itemObj.backColor;
                lb_subitem.layer.borderWidth = sub_itemObj.hasSquare ? self.lineHeight : 0.0f;
                lb_subitem.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.5f] CGColor];
                lb_subitem.adjustsFontSizeToFitWidth = YES;
                if(sub_itemObj.attributeText != nil && ![[sub_itemObj.attributeText string] isBlankString])
                    lb_subitem.attributedText = sub_itemObj.attributeText;
                else
                    lb_subitem.text = sub_itemObj.text;
                [self addSubview:lb_subitem];
                
                yPos_sub = CGRectGetMaxY(lb_subitem.frame);
            }
            
            xPos_item += headerObj.itemWidth;
        }
        
        {
            UIView *backColorView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                             yPos_item,
                                                                             CGRectGetWidth(self.frame),
                                                                             itemObj.itemHeight)];
            backColorView.backgroundColor = [[itemObj.SubItems lastObject].Items lastObject].backColor;
            [self insertSubview:backColorView atIndex:0];
        }
        
        yPos_item += itemObj.itemHeight;
    }
    
    _contentHeight = yPos_item;
    
    self.frame = CGRectMake(CGRectGetMinX(self.frame),
                            CGRectGetMinY(self.frame),
                            CGRectGetWidth(self.frame),
                            _contentHeight);
}

@end
































