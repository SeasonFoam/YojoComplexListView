//
//  YojoCListProtocol.h
//  YojoComplexListView
//
//  Created by Yojo on 2021/3/21.
//  Copyright © 2021 李永健. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YojoComplexListView;
@protocol YojoCListViewDelegate <NSObject>

@required
- (CGFloat)YojoCListViewheightForHeader:(YojoComplexListView *)listView;

@optional
- (NSInteger)numberOfYojoCListViewLines:(YojoComplexListView *)listView;
- (CGFloat)YojoCListViewHeightForLine:(YojoComplexListView *)listView;

@end

@protocol YojoCListViewDataSource <NSObject>

@required
- (NSArray<YojoComplexObject *> *)YojoCListViewItemForHeader:(YojoComplexListView *)listView;
- (NSArray<YojoComplexItemObject *> *)YojoCListViewRowItems:(YojoComplexListView *)listView;

@end
