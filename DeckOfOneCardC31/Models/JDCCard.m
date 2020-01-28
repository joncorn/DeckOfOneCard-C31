//
//  JDCCard.m
//  DeckOfOneCardC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "JDCCard.h"

@implementation JDCCard

- (instancetype)initWithSuit:(NSString *)suit imageURL:(NSString *)imageURL
{
    if (self = [super init])
    {
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *imageURL = dictionary[@"image"];
    
    return [self initWithSuit:suit imageURL:imageURL];
}

@end
