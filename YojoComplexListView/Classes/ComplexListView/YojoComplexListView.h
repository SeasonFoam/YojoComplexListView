//
//  ComplexListView.h
//  StoreAideTool
//
//  Created by Yojo on 17/7/3.
//  Copyright © 2017年 Yojo All rights reserved.
//

#import "YojoComplexObject.h"

#import "YojoCListProtocol.h"

@interface YojoComplexListView : UIView

@property (nonatomic, readonly) NSArray<YojoComplexObject *> *HeaderItems;
@property (nonatomic, copy) NSArray<YojoComplexItemObject *> *Items;

@property (nonatomic, assign, readonly) NSInteger numOfLines;
@property (nonatomic, assign, readonly) CGFloat contentHeight;

- (void)clearItems;

@property (nonatomic, weak) id<YojoCListViewDelegate> delegate;
@property (nonatomic, weak) id<YojoCListViewDataSource> dataSource;

@end
