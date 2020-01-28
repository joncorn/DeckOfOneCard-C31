//
//  JDCCardController.h
//  DeckOfOneCardC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JDCCard;

NS_ASSUME_NONNULL_BEGIN

@interface JDCCardController : NSObject

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^) (NSArray<JDCCard *> *_Nullable cards))completion;

+ (void)fetchCardImage:(JDCCard *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
