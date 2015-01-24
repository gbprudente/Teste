//
//  TapCardView.m
//  Teste
//
//  Created by Guilherme Prudente on 1/23/15.
//  Copyright (c) 2015 Guilherme Prudente. All rights reserved.
//

#import "TapCardView.h"

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@implementation TapCardView

@synthesize photo = _photo;
@synthesize name = _name;
@synthesize work = _work;
@synthesize info = _info;
@synthesize welcome = _welcome;

- (id)init
{
    self = [super init];
    if (self) {
        [self setNameLabel:@"Teste"];
        [self setWorkLabel:@"Work"];
        [self setInfoLabel:@"Info"];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setPicture:(NSString*) str {
    UIImage *img = [UIImage imageNamed:str];
    _photo.image = img;
}

-(void)setNameLabel:(NSString*) str {
    _name.text = str;
}

-(void)setWorkLabel:(NSString*) str {
    _work.text = str;
}

-(void)setInfoLabel:(NSString*) str {
    _info.text = str;
}

-(UIImage*)getPicture {
    return _photo.image;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    //NSLog(@"initwithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (id)setCardInfo:(NSString*)newName workStr:(NSString *)newWork infoStr:(NSString *)newInfo photoStr:(NSString*)newPhoto order:(int)_order{
    //NSLog(@"setCardInfo");
    if (self) {
        [self setPicture:newPhoto];
         [self setNameLabel:newName];
         [self setWorkLabel:newWork];
         [self setInfoLabel:newInfo];
        
        
        CGColorRef ref = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3] CGColor];
        //self.layer.masksToBounds = FALSE;
        self.layer.shadowColor = ref;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.3;
        self.layer.shadowOffset = CGSizeMake(0,0);
        //self.layer.borderWidth = 1;
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [_welcome setBackgroundColor:color];            
    }
    return self;
}

-(void)awakeFromNib {
    //NSLog(@"awakeFromNib");
}
@end
