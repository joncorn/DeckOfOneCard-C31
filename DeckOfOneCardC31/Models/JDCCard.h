//
//  JDCCard.h
//  DeckOfOneCardC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDCCard : NSObject

@property (nonatomic) NSString *suit;
@property (nonatomic) NSString *imageURL;

- (instancetype)initWithSuit:(NSString *)suit
                    imageURL:(NSString *)imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
