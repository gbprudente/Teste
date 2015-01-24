//
//  ViewController.m
//  Teste
//
//  Created by Guilherme Prudente on 1/23/15.
//  Copyright (c) 2015 Guilherme Prudente. All rights reserved.
//

#import "ViewController.h"

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface ViewController (
                           
)

@end

@implementation ViewController

@synthesize cardArray = _cardArray;
@synthesize imageIndex = _imageIndex;

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *_swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [_swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *_swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    _cardArray = [[NSMutableArray alloc] init];
    CGRect rect = CGRectMake(50, 50, 258, 430);
    TapCardView *card1 = [self loadNibWithParams:@"Guilherme" workStr:@"iOS" infoStr:@"24 yr old" photoStr:@"headshot.jpg" order:1];
    card1.frame = rect;
    [card1 addGestureRecognizer:_swipeRight];
    [card1 addGestureRecognizer:_swipeLeft];
    [self.view addSubview:card1];
    [_cardArray addObject:card1];
    [self animateIn:card1 order:1];
    _imageIndex++;
    //[self animateIn:card4 order:4];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(TapCardView*)loadNibWithParams:(NSString*)newName workStr:(NSString*)newWork infoStr:(NSString*)newInfo photoStr:(NSString*)newPhoto order:(int)_order {
    UIViewController *controller=[[UIViewController alloc] initWithNibName:@"TapCardView" bundle:nil];
    TapCardView* tapCard=(TapCardView*)controller.view;
    [tapCard setCardInfo:newName workStr:newWork infoStr:newInfo photoStr:newPhoto order:_order];
    return tapCard;
}

-(void)animateIn:(TapCardView*)_card order:(int)_order {
    NSLog(@"animateIn, order: %i",_order);
    NSLog(@"Card anchor: %@",NSStringFromCGPoint(_card.layer.anchorPoint));
    [self updateCardPosition:_card order:_order];
    
        CABasicAnimation *stretchX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
        stretchX.fromValue = [NSNumber numberWithDouble:1];
        stretchX.toValue = [NSNumber numberWithDouble:0.8];
        stretchX.duration = 0.5;
        [stretchX setFillMode:kCAFillModeForwards];
        
        CABasicAnimation *stretchY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        stretchY.fromValue = [NSNumber numberWithDouble:1];
        stretchY.toValue = [NSNumber numberWithDouble:0.8];
        stretchY.duration = 0.5;
        [stretchY setFillMode:kCAFillModeForwards];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:1];
        animation.duration = 0.5;
        animation.removedOnCompletion = YES;
        [_card.photo.layer addAnimation:animation forKey:@"opacity"];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = [NSArray arrayWithObjects:stretchX,stretchY,nil];
        animationGroup.removedOnCompletion = NO;
        animationGroup.duration = 0.5;
    
    UISwipeGestureRecognizer *_swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [_swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *_swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        
        
        [animationGroup setFillMode:kCAFillModeForwards];
        [CATransaction begin]; {
            [CATransaction setCompletionBlock:^{
                //NSLog(@"frame: %f %f %f %f",_card.frame.origin.x,_card.frame.origin.y,_card.frame.size.width,_card.frame.size.height);
                CGRect rect = CGRectMake(50, 50, 258, 430);
                switch (_order) {
                    case 1: {
                        TapCardView *card = [self loadNibWithParams:@"Card2" workStr:@"Card2" infoStr:@"28 yr old" photoStr:@"headshot.jpg" order:(_order+1)];
                        card.frame = rect;
                        
                        [card addGestureRecognizer:_swipeRight];
                        [card addGestureRecognizer:_swipeLeft];
                        [_cardArray addObject:card];
                        [self.view addSubview:card];
                        _imageIndex++;
                        [self animateIn:card order:(_order+1)];
                        break;
                    }
                    case 2: {
                        TapCardView *card = [self loadNibWithParams:@"Card3" workStr:@"Card3" infoStr:@"28 yr old" photoStr:@"headshot.jpg" order:(_order+1)];
                        card.frame = rect;
                        [card addGestureRecognizer:_swipeRight];
                        [card addGestureRecognizer:_swipeLeft];
                        [_cardArray addObject:card];
                        [self.view addSubview:card];
                        _imageIndex++;
                        [self animateIn:card order:(_order+1)];
                        break;
                    }
                    case 3: {
                        TapCardView *card = [self loadNibWithParams:@"Card4" workStr:@"Card4" infoStr:@"28 yr old" photoStr:@"headshot.jpg" order:(_order+1)];
                        card.frame = rect;
                        [card addGestureRecognizer:_swipeRight];
                        [card addGestureRecognizer:_swipeLeft];
                        [_cardArray addObject:card];
                        [self.view addSubview:card];
                        _imageIndex++;
                        [self animateIn:card order:(_order+1)];
                        break;
                    }
                }
                


            }];
            [_card.layer addAnimation:animationGroup forKey:@"animations"];
        } [CATransaction commit];
}

- (void)updateCardPosition:(TapCardView*)_card order:(int)_order {
    switch (_order) {
        case 4:
            _card.transform = CGAffineTransformIdentity;
            _card.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
            break;
        case 3:
            _card.transform = CGAffineTransformIdentity;
            _card.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(10));
            break;
        case 2:
            _card.transform = CGAffineTransformIdentity;
            _card.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(5));
            break;
        case 1:
            _card.transform = CGAffineTransformIdentity;
            _card.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-10));
            break;
        case 0:
            _card.transform = CGAffineTransformIdentity;
            break;
    }
}


- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    UIView *card = gesture.view;
    NSLog(@"Swipe! Index:%d",_imageIndex);
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        // if we're at the first card, execute the swipe
            NSLog(@"swipe for this card!");
            
            
            [UIView animateWithDuration:0.4
                                  delay:0.0
                                options: UIViewAnimationCurveEaseOut
                             animations:^{
                                 [card setFrame:CGRectMake(258, 430, card.frame.size.width, card.frame.size.height)];
                             }
                             completion:^(BOOL finished){
                                 NSLog(@"Done!");
                                 [_cardArray removeLastObject];
                                 _imageIndex--;
                                 /*for (int i = ([_cardArray count] - 1); i > 0 ; i--) {
                                     [self updateCardPosition:_cardArray[i] order:i];
                                 }*/
                                 [self updateCardPosition:[_cardArray lastObject] order:0];
                                 [card removeFromSuperview];

                             }];
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        // if we're at the first card, execute the swipe
        NSLog(@"swipe for this card!");
        
        
        [UIView animateWithDuration:0.4
                              delay:0.0
                            options: UIViewAnimationCurveEaseIn
                         animations:^{
                             [card setFrame:CGRectMake(-258, 430, card.frame.size.width, card.frame.size.height)];
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                             [_cardArray removeLastObject];
                             _imageIndex--;
                            /* for (int i = ([_cardArray count] - 1); i > 0 ; i--) {
                                 [self updateCardPosition:_cardArray[i] order:i];
                             }*/
                             [self updateCardPosition:[_cardArray lastObject] order:0];
                             [card removeFromSuperview];
                         }];
    }
}


@end
