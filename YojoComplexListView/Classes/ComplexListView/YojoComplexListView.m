//
//  ComplexListView.m
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import "YojoComplexListView.h"
#import "YojoComplexHeaderView.h"
#import "YojoComplexItemsView.h"

@interface YojoComplexListView ()

@property (nonatomic, weak) YojoComplexHeaderView *headerView;
@property (nonatomic, weak) YojoComplexItemsView *itemsView;

@property (nonatomic, assign) NSInteger numOfLines;

@end

@implementation YojoComplexListView

- (void)dealloc
{
    self.Items = nil;
    
    self.headerView = nil;
    self.itemsView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _contentHeight = 0.0f;
        
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.5f] CGColor];
        
        YojoComplexHeaderView *headerView = [[YojoComplexHeaderView alloc] init];
        [self addSubview:headerView];
        self.headerView = headerView;
        
        YojoComplexItemsView *itemsView = [[YojoComplexItemsView alloc] init];
        [self addSubview:itemsView];
        self.itemsView = itemsView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat headHeight = 20.0f;
    if([self.delegate respondsToSelector:@selector(YojoCListViewheightForHeader:)])
    {
        headHeight = [self.delegate YojoCListViewheightForHeader:self];
        self.headerView.headerHeight = headHeight;
    }
    
    if([self.delegate respondsToSelector:@selector(YojoCListViewHeightForLine:)])
    {
        CGFloat lineHeight = [self.delegate YojoCListViewHeightForLine:self];
        self.layer.borderWidth = lineHeight;
        self.headerView.lineHeight = lineHeight;
        self.itemsView.lineHeight = lineHeight;
    }
    
    if([self.dataSource respondsToSelector:@selector(YojoCListViewItemForHeader:)])
    {
        NSArray<YojoComplexObject *> *headItems = [self.dataSource YojoCListViewItemForHeader:self];
        self.headerView.HeaderItems = headItems;
        self.itemsView.HeaderItems = headItems;
    }
    
    if([self.delegate respondsToSelector:@selector(numberOfYojoCListViewLines:)])
    {
        self.itemsView.numOfLines = [self.delegate numberOfYojoCListViewLines:self];
    }
    
    if([self.dataSource respondsToSelector:@selector(YojoCListViewRowItems:)])
    {
        self.itemsView.Items = [self.dataSource YojoCListViewRowItems:self];
    }
    
    self.headerView.frame = CGRectMake(0,
                                       0,
                                       CGRectGetWidth(self.frame),
                                       headHeight);
    
    self.itemsView.frame = CGRectMake(0,
                                      CGRectGetMaxY(self.headerView.frame),
                                      CGRectGetWidth(self.frame),
                                      CGRectGetHeight(self.itemsView.frame));
    
    self.frame = CGRectMake(CGRectGetMinX(self.frame),
                            CGRectGetMinY(self.frame),
                            CGRectGetWidth(self.frame),
                            CGRectGetMaxY(self.itemsView.frame));
}

#pragma -mark
#pragma -mark Attribute
- (NSInteger)numOfLines
{
    NSInteger num = 0;
    
    if([self.delegate respondsToSelector:@selector(numberOfYojoCListViewLines:)])
    {
        num = [self.delegate numberOfYojoCListViewLines:self];
    }
    
    return num;
}

- (NSArray<YojoComplexObject *> *)HeaderItems
{
    return self.headerView.HeaderItems;
}

#pragma -mark
#pragma -mark Custom Function
- (void)clearItems
{
    self.Items = nil;
}

@end
