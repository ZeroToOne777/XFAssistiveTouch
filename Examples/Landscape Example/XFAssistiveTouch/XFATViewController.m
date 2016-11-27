//
//  XFATViewController.m
//  XFAssistiveTouchExample
//
//  Created by 徐亚非 on 2016/9/24.
//  Copyright © 2016年 XuYafei. All rights reserved.
//

#import "XFATViewController.h"
#import "XFATNavigationController.h"

@implementation XFATViewController

@synthesize items = _items;

- (instancetype)initWithItems:(NSArray<XFATItemView *> *)items {
    self = [super init];
    if (self) {
        self.items = items;
        _backItem = [XFATItemView itemWithType:XFATItemViewTypeBack];
        _backItem.hidden = YES;
        UITapGestureRecognizer *backGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backGesture:)];
        [_backItem addGestureRecognizer:backGesture];
    }
    return self;
}

- (instancetype)init {
    return [self initWithItems:nil];
}

#pragma mark - Accessor

- (NSArray<XFATItemView *> *)items {
    if (!_items) {
        [self loadView];
        [self viewDidLoad];
    }
    return _items;
}

- (void)setItems:(NSArray<XFATItemView *> *)items {
    if (items.count > [XFATLayoutAttributes maxCount]) {
        _items = [items subarrayWithRange:NSMakeRange(0, [XFATLayoutAttributes maxCount])];
    } else {
        _items = items;
    }
    for (int i = 0; i < MIN(_items.count, _items.count); i++) {
        XFATItemView *item = _items[i];
        item.position = [XFATPosition positionWithCount:_items.count index:i referenceFrame:CGRectZero];
    }
}

#pragma mark - LoadView

- (void)loadView {
    _items = @[[XFATItemView new], [XFATItemView new],
               [XFATItemView new], [XFATItemView new],
               [XFATItemView new], [XFATItemView new],
               [XFATItemView new], [XFATItemView new]];
}

- (void)viewDidLoad {
    
}

#pragma mark - Action

- (void)backGesture:(UITapGestureRecognizer *)backGesture {
    //[self.navigationController popViewController];
}

@end
