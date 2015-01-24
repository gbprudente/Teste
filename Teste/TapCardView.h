//
//  TapCardView.h
//  Teste
//
//  Created by Guilherme Prudente on 1/23/15.
//  Copyright (c) 2015 Guilherme Prudente. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TapCardView : UIView

@property (strong,nonatomic) IBOutlet UIImageView *photo;

@property (strong,nonatomic) IBOutlet UILabel *name;
@property (strong,nonatomic) IBOutlet UILabel *work;
@property (strong,nonatomic) IBOutlet UILabel *info;
@property (strong,nonatomic) IBOutlet UILabel *welcome;

@property int posX;
@property int posY;


-(void)setPicture:(NSString*) str;
-(void)setNameLabel:(NSString*) str;
-(void)setWorkLabel:(NSString*) str;
-(void)setInfoLabel:(NSString*) str;

- (id)setCardInfo:(NSString*)newName workStr:(NSString *)newWork infoStr:(NSString *)newInfo photoStr:(NSString*)newPhoto order:(int)_order;

-(UIImage*)getPicture;

- (id)initWithCoder:(NSCoder *)aDecoder;

@end
