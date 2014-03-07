//
//  NumberPad.h
//  KADIS
//
//  Created by Lars Kuhnt on 05.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Extensions.h"
#import "UIColor+Extensions.h"

@interface NumberPad : UIControl

@property (nonatomic, assign) IBOutlet UILabel * target;
@property (nonatomic, strong) NSNumberFormatter * formatter;

- (void)buttonTapped:(id)sender;

@end
