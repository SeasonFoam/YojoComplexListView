//
//  ComplexObject.m
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import "YojoComplexObject.h"

@implementation YojoComplexObject

- (void)dealloc
{
    _text = nil;
    self.attributeText = nil;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        self.fontSize = 12;
        self.text = @"-";
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.backColor = [UIColor whiteColor];
        self.itemWidth = 30.0f;
        self.itemHeight = 60.0f;
        self.hasSquare = YES;
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = text == nil ? @"-" : text;//[StringHelper isBlankString:text] ? @"-" : text;
}

- (id)copyWithZone:(NSZone *)zone
{
    YojoComplexObject *copy = [[YojoComplexObject allocWithZone:zone] init];
    copy.text = self.text;
    copy.textAlignment = self.textAlignment;
    copy.textColor = self.textColor;
    copy.fontSize = self.fontSize;
    copy.backColor = self.backColor;
    copy.itemHeight = self.itemHeight;
    copy.itemWidth = self.itemWidth;
    copy.hasSquare = self.hasSquare;
    
    return copy;
}

@end

@implementation YojoComplexSubItemObject

- (void)dealloc
{
    self.Items = nil;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _itemHeight = 0.0f;
        _Items = [NSMutableArray array];
    }
    return self;
}

- (void)setItems:(NSMutableArray<YojoComplexObject *> *)Items
{
    _Items = Items;
    
    for(YojoComplexObject *obj in Items)
    {
        _itemHeight += obj.itemHeight;
    }
}

- (void)addItemsObject:(YojoComplexObject *)itemObject
{
    [_Items addObject:itemObject];
    
    _itemHeight += itemObject.itemHeight;
}

- (void)removeAllObjects
{
    [_Items removeAllObjects];
}

@end

@implementation YojoComplexItemObject

- (void)dealloc
{
    self.SubItems = nil;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        self.itemHeight = 0.0f;
        _SubItems = [NSMutableArray array];
    }
    return self;
}

- (void)setSubItems:(NSMutableArray<YojoComplexSubItemObject *> *)SubItems
{
    _SubItems = SubItems;
    
    for(YojoComplexSubItemObject *obj in SubItems)
    {
        _itemHeight = MAX(_itemHeight, obj.itemHeight);
    }
}

- (void)addItemObject:(YojoComplexSubItemObject *)subItem
{
    [_SubItems addObject:subItem];
    
    _itemHeight = MAX(_itemHeight, subItem.itemHeight);
}

@end
