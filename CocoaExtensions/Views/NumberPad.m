//
//  NumberPad.m
//  KADIS
//
//  Created by Lars Kuhnt on 05.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NumberPad.h"

@implementation NumberPad

@synthesize target;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self = [[NSBundle mainBundle] loadNibNamed:@"NumberPad" owner:self options:NULL][0];
    self.frame = frame;
    
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    UIView * padView = [[NSBundle mainBundle] loadNibNamed:@"NumberPad" owner:self options:NULL][0];
    padView.backgroundColor = self.backgroundColor;
    padView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:padView];
    int buttonWidth = (self.frame.size.width-2)/3;
    int buttonHeight = (self.frame.size.height-5)/4;
    int i = 0;
    for (UIView * subview in padView.subviews) {
      if ([subview isKindOfClass:[UIButton class]]) {
        UIButton * button = (UIButton*)subview;
        int column = i%3;
        int row = i/3;
        button.frame = CGRectMake(column+(column*buttonWidth), 1+row+(row*buttonHeight), buttonWidth, buttonHeight);
        [button setBackgroundColor:self.tintColor forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        i++;
      }
    }
  }
  return self;
}
//
//- (void)layoutSubviews {
//  [super layoutSubviews];
//
//}

- (void)buttonTapped:(UIButton*)sender {
  switch (sender.tag) {
    case 10:
      [self appendComma];
      break;
    case 11:
      [self clearLastCharacter];
      break;
    default:
      [self appendCharacter:[[NSNumber numberWithLong:sender.tag] stringValue]];
      break;
  }
}

- (void)appendComma {
  if ([self.target.text rangeOfString:@","].location == NSNotFound) {
    if (self.target.text.length == 0)
      self.target.text = @"0";
    self.target.text = [self.target.text stringByAppendingString:@","];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
  }
}

- (void)appendCharacter:(NSString*)character {
  self.target.text = [self.target.text stringByAppendingString:character];
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)clearLastCharacter {
  if (self.target.text.length > 0) {
    self.target.text = [self.target.text substringToIndex:self.target.text.length-1];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
  }
}

@end
