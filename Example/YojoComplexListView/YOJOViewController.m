//
//  YOJOViewController.m
//  YojoComplexListView
//
//  Created by yonghendeworld@163.com on 03/21/2021.
//  Copyright (c) 2021 yonghendeworld@163.com. All rights reserved.
//

#import "YOJOViewController.h"
#import "YojoComplexListView.h"

@interface YOJOViewController ()

@end

@implementation YOJOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    
    YojoComplexListView *listView = [[YojoComplexListView alloc] initWithFrame:CGRectMake(15.0f,
                                                                                          100,
                                                                                          CGRectGetWidth(self.view.frame) - 30.0f,
                                                                                          500)];
    listView.delegate = self;
    listView.dataSource = self;
    [self.view addSubview:listView];
}

#pragma -mark -
#pragma -mark YojoCListViewDelegate, YojoCListViewDataSource
- (CGFloat)YojoCListViewheightForHeader:(YojoComplexListView *)listView
{
    return 40.0f;
}

- (NSInteger)numberOfYojoCListViewLines:(YojoComplexListView *)listView
{
    return 0;
}

- (NSArray<YojoComplexObject *> *)YojoCListViewItemForHeader:(YojoComplexListView *)listView
{
    CGFloat width = CGRectGetWidth(listView.frame) / 3.0f;
    
    YojoComplexObject *item_1 = [YojoComplexObject new];
    item_1.text = @"测试1";
    item_1.itemWidth = width;
    
    YojoComplexObject *item_2 = [YojoComplexObject new];
    item_2.text = @"测试2";
    item_2.itemWidth = width;
    
    YojoComplexObject *item_3 = [YojoComplexObject new];
    item_3.text = @"测试3";
    item_3.itemWidth = width;
    
    return @[item_1, item_2, item_3];
}

- (NSArray<YojoComplexItemObject *> *)YojoCListViewRowItems:(YojoComplexListView *)listView
{
    YojoComplexItemObject *item_1 = [YojoComplexItemObject new];
    {
        YojoComplexSubItemObject *subItem_1_1 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_1_1_1 = [YojoComplexObject new];
        sub_1_1_1.text = @"1_1_1";
        sub_1_1_1.itemHeight = 30.0f;
        [subItem_1_1 addItemsObject:sub_1_1_1];
        
        YojoComplexSubItemObject *subItem_1_2 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_1_2_1 = [YojoComplexObject new];
        sub_1_2_1.text = @"1_2_1";
        sub_1_2_1.itemHeight = 30.0f;
        [subItem_1_2 addItemsObject:sub_1_2_1];
        YojoComplexObject *sub_1_2_2 = [YojoComplexObject new];
        sub_1_2_2.text = @"1_2_2";
        sub_1_2_2.itemHeight = 30.0f;
        [subItem_1_2 addItemsObject:sub_1_2_2];
        
        YojoComplexSubItemObject *subItem_1_3 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_1_3_1 = [YojoComplexObject new];
        sub_1_3_1.text = @"1_3_1";
        [subItem_1_3 addItemsObject:sub_1_3_1];
        
        [item_1 addItemObject:subItem_1_1];
        [item_1 addItemObject:subItem_1_2];
        [item_1 addItemObject:subItem_1_3];
    }

    YojoComplexItemObject *item_2 = [YojoComplexItemObject new];
    item_2.itemHeight = 200.0f;
    {
        YojoComplexSubItemObject *subItem_2_1 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_2_1_1 = [YojoComplexObject new];
        sub_2_1_1.text = @"2_1_1";
        [subItem_2_1 addItemsObject:sub_2_1_1];
        
        YojoComplexSubItemObject *subItem_2_2 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_2_2_1 = [YojoComplexObject new];
        sub_2_2_1.text = @"2_2_1";
        [subItem_2_2 addItemsObject:sub_2_2_1];
        YojoComplexObject *sub_2_2_2 = [YojoComplexObject new];
        sub_2_2_2.text = @"2_2_2";
        [subItem_2_2 addItemsObject:sub_2_2_2];
        
        YojoComplexSubItemObject *subItem_2_3 = [YojoComplexSubItemObject new];
        YojoComplexObject *sub_2_3_1 = [YojoComplexObject new];
        sub_2_3_1.text = @"2_3_1";
        [subItem_2_3 addItemsObject:sub_2_3_1];
        
        [item_2 addItemObject:subItem_2_1];
        [item_2 addItemObject:subItem_2_2];
        [item_2 addItemObject:subItem_2_3];
        
    }
    
    return @[item_1, item_2];
}

- (CGFloat)YojoCListViewHeightForLine:(YojoComplexListView *)listView
{
    return 0.25f;
}

@end
