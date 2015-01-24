//
//  ViewController.h
//  Teste
//
//  Created by Guilherme Prudente on 1/23/15.
//  Copyright (c) 2015 Guilherme Prudente. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapCardView.h"

@interface ViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *cardArray;
@property int imageIndex;

-(TapCardView*)loadNibWithParams:(NSString*)newName workStr:(NSString*)newWork infoStr:(NSString*)newInfo photoStr:(NSString*)newPhoto order:(int)order;

@end

